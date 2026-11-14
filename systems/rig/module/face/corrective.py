# coding=utf-8
u"""修型驱动：控制器 → 基础 BS 权重 → 组合 BS 权重。

两条链路：

    1. 单目标：控制器属性 ──driven key──▸ 目标体权重
    2. 组合目标：基础目标权重 ──相加 → clamp──▸ 组合目标权重

组合目标（eyeExpand / eyeCrush）本身是**单独雕的目标体**，
这里只负责把它的权重算出来，形状不在这里生成。

约定：

    驱动源用控制器的旋转 / 位移通道（自由文本，如 translateY、rotateX）
    权重范围 0~1，组合时用 clamp 截断，避免越界
"""

from maya import cmds


def weight_plug(blendshape, target):
    u"""返回某个目标体的 weight 插头。

    Args:
        blendshape (str): blendshape 节点。
        target (str): 目标体别名（如 browUp）。

    Returns:
        str: 例如 ``bsn_md_face_001.weight[3]``。

    Raises:
        RuntimeError: 目标体不存在。
    """

    pairs = cmds.aliasAttr(blendshape, query=True) or []

    for index in range(0, len(pairs), 2):
        alias = pairs[index]
        plug = pairs[index + 1]

        if alias == target:
            return "{}.{}".format(blendshape, plug)

    raise RuntimeError(
        u"{} 上没有目标体：{}".format(blendshape, target)
    )


def drive_weight(control, blendshape, target, attr="translateY",
                 low=0.0, high=1.0):
    u"""控制器通道 → 目标体权重（driven key）。

    ``low`` 处权重 0，``high`` 处权重 1；两端线性，之后可在
    Graph Editor 里改曲线手感。

    Returns:
        str: 权重插头。
    """

    plug = weight_plug(blendshape, target)

    for driver_value, weight in ((low, 0.0), (high, 1.0)):
        cmds.setDrivenKeyframe(
            plug,
            currentDriver="{}.{}".format(control, attr),
            driverValue=driver_value,
            value=weight
        )

    return plug


def connect_combined(blendshape, combined, basics, clip=(0.0, 1.0),
                     name=None):
    u"""基础目标权重相加 → clamp → 组合目标权重。

    用途（eyeExpand / eyeCrush）：

        browUp + eyeUpWide + eyeDownWide ──▸ eyeExpand 的权重

    组合目标体本身是单独雕的，这里只算权重。

    Args:
        blendshape (str): blendshape 节点。
        combined (str): 组合目标体别名。
        basics (iterable): 基础目标体别名。
        clip (tuple): clamp 范围。
        name (str): 相加节点名；None 自动。

    Returns:
        dict: 相加节点、clamp 节点、目标插头。
    """

    basics = list(basics)

    if not basics:
        raise ValueError(u"basics 不能为空")

    add_name = name or "{}_add".format(combined)
    clamp_name = "{}_clamp".format(combined)

    add = (
        add_name if cmds.objExists(add_name)
        else cmds.createNode("plusMinusAverage", name=add_name)
    )
    clamp = (
        clamp_name if cmds.objExists(clamp_name)
        else cmds.createNode("clamp", name=clamp_name)
    )

    for index, target in enumerate(basics):
        plug = weight_plug(blendshape, target)
        source = plug

        destination = "{}.input1D[{}]".format(add, index)

        if not cmds.isConnected(source, destination):
            cmds.connectAttr(source, destination, force=True)

    target_plug = weight_plug(blendshape, combined)

    if not cmds.isConnected(add + ".output1D", clamp + ".inputR"):
        cmds.connectAttr(add + ".output1D", clamp + ".inputR", force=True)

    cmds.setAttr(clamp + ".minR", float(clip[0]))
    cmds.setAttr(clamp + ".maxR", float(clip[1]))

    if not cmds.isConnected(clamp + ".outputR", target_plug):
        cmds.connectAttr(clamp + ".outputR", target_plug, force=True)

    return {
        "add": add,
        "clamp": clamp,
        "target": target_plug,
    }
