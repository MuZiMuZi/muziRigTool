# coding=utf-8
u"""把控制器钉在参考面上（BS 跟随）。

用途（用户定的 B 方案）：

    复制一张头模当参考面，上面挂同一个 blendshape（只吃 BS，不吃蒙皮）；
    次级控制器用 uvPin 钉在参考面上，于是 BS 一抬，控制器跟着上去。

为什么不会成环：

    参考面只被 BS 驱动，不读主模型；
    控制器 → 关节 → 主模型，是另一条单向链。

连法：

    uvPin（采样参考面）→ 世界组 → 控制器 zero 组 → offset 组（世界位移）

    panel 仍然可以驱动 zero 组的位移，叠加在钉住的位置之上。
"""

from maya import cmds

from .....core import uv_pin_utils
from .....core.name_utils import Name


def pin_control(zero_group, reference_mesh, side="lf", part="brow",
                index=1):
    u"""把一个控制器的 zero 组钉到参考面上。

    Args:
        zero_group (str): 控制器层级最外层的 zero 组。
        reference_mesh (str): 参考面（多边形网格）。
        side (str): lf / rt。
        part (str): 部位名。
        index (int): 序号。

    Returns:
        dict: 定位器、组、uvPin 节点名。
    """

    driver_name = Name(
        type="loc", side=side, part=part, function="pin", index=index
    ).name

    driver = cmds.spaceLocator(name=driver_name)[0]
    cmds.xform(
        driver,
        worldSpace=True,
        translation=cmds.xform(zero_group, query=True, worldSpace=True,
                               translation=True)
    )
    cmds.setAttr(driver + ".visibility", 0)

    result = uv_pin_utils.create_uv_pin(
        reference_mesh,
        driver,
        drive_group=True,
        output_mode=uv_pin_utils.OUTPUT_OFFSET_PARENT_MATRIX,
    )

    group = result["group"]

    # 控制器挂到 uvPin 驱动的组下，局部变换清零
    cmds.parent(zero_group, group)

    cmds.setAttr(zero_group + ".translate", 0.0, 0.0, 0.0)
    cmds.setAttr(zero_group + ".rotate", 0.0, 0.0, 0.0)

    return {
        "driver": driver,
        "group": group,
        "node": result["node"],
    }
