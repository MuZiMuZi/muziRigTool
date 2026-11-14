# coding=utf-8
u"""三层头：tweak → 修型 → stretch。

层级（节点历史从上到下）：

    tweak 头      控制层：控制器 → 关节 → skinCluster
        │ blendshape 目标
        ▼
    修型头         corrective：表情 / 修型目标体
        │ blendshape 目标
        ▼
    stretch 头     渲染层：stretch 关节做挤压拉伸、zip、下巴跟随、颧骨

默认只用**两层**（省一张整网格）：

    tweak 头   控制层
        │ blendshape
        ▼
    stretch 头 渲染层
        ├─ 表情 / 修型目标体直接挂在这层（不再单独建修型头）
        └─ stretch 关节做挤压拉伸

要看修型层的中间结果时，再传 ``layers="three"`` 建三层：

    tweak → 修型 → stretch

为什么默认两层：

    修型头只是「表情 BS 的落点」，把同样的 BS 直接挂到 stretch 头上，
    少一张整网格 + 一个 blendshape，质量差异很小。
"""

from maya import cmds

from .....core.name_utils import Name


def _name(node_type, function, side="md", part="face", index=1):
    u"""五段式命名。"""

    return Name(
        type=node_type, side=side, part=part,
        function=function, index=index
    ).name


def head_names(side="md"):
    u"""三层头 + 两个 blendshape 节点的固定名字。"""

    return {
        "tweak": _name("mesh", "tweak", side),
        "corrective": _name("mesh", "corrective", side),
        "stretch": _name("mesh", "stretch", side),
        "tweak_to_corrective": _name("bsn", "tweak2corr", side),
        "corrective_to_stretch": _name("bsn", "corr2stretch", side),
    }


def _delete_old(names):
    u"""重建前清理旧节点。"""

    for key in ("stretch", "corrective", "tweak"):
        if cmds.objExists(names[key]):
            cmds.delete(names[key])

    for key in ("corrective_to_stretch", "tweak_to_corrective"):
        if cmds.objExists(names[key]):
            cmds.delete(names[key])


def build_heads(head_mesh, side="md", layers="two_bs"):
    u"""从头部模型复制出三层头并接好 blendshape。

    Args:
        head_mesh (str): 原始头部模型。
        side (str): md / lf / rt。

    Returns:
        dict: 三层头与两个 blendshape 节点的名字。

    Raises:
        RuntimeError: 头部模型不存在。
    """

    if not cmds.objExists(head_mesh):
        raise RuntimeError(u"找不到头部模型：{}".format(head_mesh))

    names = head_names(side)
    _delete_old(names)

    # 原始模型隐藏，只当源头
    cmds.setAttr(head_mesh + ".visibility", 0)

    if layers == "three":
        keys = ("tweak", "corrective", "stretch")
    elif layers == "two":
        keys = ("tweak", "stretch")
    else:                      # two_bs：两张头都喂给 stretch
        keys = ("tweak", "corrective", "stretch")

    for key in keys:
        node = cmds.duplicate(head_mesh, name=names[key])[0]

        if cmds.listRelatives(node, parent=True):
            cmds.parent(node, world=True)

    if layers == "three":
        # tweak → 修型 → stretch（链式）
        names["tweak_to_corrective"] = cmds.blendShape(
            names["tweak"], names["corrective"],
            name=names["tweak_to_corrective"]
        )[0]
        cmds.setAttr(
            "{}.weight[0]".format(names["tweak_to_corrective"]), 1.0
        )

        names["corrective_to_stretch"] = cmds.blendShape(
            names["corrective"], names["stretch"],
            name=names["corrective_to_stretch"]
        )[0]
        cmds.setAttr(
            "{}.weight[0]".format(names["corrective_to_stretch"]), 1.0
        )

    elif layers == "two":
        # 只有 tweak 喂 stretch
        names["tweak_to_corrective"] = ""

        names["corrective_to_stretch"] = cmds.blendShape(
            names["tweak"], names["stretch"],
            name=names["corrective_to_stretch"]
        )[0]
        cmds.setAttr(
            "{}.weight[0]".format(names["corrective_to_stretch"]), 1.0
        )

    else:
        # two_bs：一个 blendshape 节点、两个目标（tweak + 修型）。
        # 两个目标都相对同一个 rest 网格，delta 相加：
        #     rest + (tweak - rest) + (corrective - rest)
        # 放在同一个节点里，求值顺序稳定，不会互相覆盖。
        names["tweak_to_corrective"] = ""

        names["corrective_to_stretch"] = cmds.blendShape(
            names["tweak"], names["corrective"], names["stretch"],
            name=names["corrective_to_stretch"]
        )[0]

        for index in (0, 1):
            cmds.setAttr(
                "{}.weight[{}]".format(
                    names["corrective_to_stretch"], index
                ),
                1.0
            )

    # 只显示 stretch
    cmds.setAttr(names["tweak"] + ".visibility", 0)

    if cmds.objExists(names["corrective"]):
        cmds.setAttr(names["corrective"] + ".visibility", 0)

    cmds.setAttr(names["stretch"] + ".visibility", 1)

    return names


def delete_heads(side="md"):
    u"""删掉三层头（保留原始模型）。"""

    names = head_names(side)
    _delete_old(names)

    return names


def set_display(side="md", layer="stretch"):
    u"""只显示指定的一层，调试用。"""

    names = head_names(side)

    for key in ("tweak", "corrective", "stretch"):
        if cmds.objExists(names[key]):
            cmds.setAttr(
                names[key] + ".visibility",
                1 if key == layer else 0
            )

    return names
