# coding=utf-8
u"""矩阵驱动：用节点代替约束（性能优先）。

约束（parentConstraint / aimConstraint）每帧要走约束求解，
数量一多就有开销；能换成矩阵连线的，尽量换：

    parentConstraint  → wtAddMatrix（可加权混合）→ multMatrix → offsetParentMatrix
    aimConstraint     → aimMatrix 节点 → offsetParentMatrix

约束求的是世界矩阵，矩阵连线走的是 DG 求值，节点更轻、可读性也更好。

注意：驱动 offsetParentMatrix 后，节点自身的 TRS 要保持零，
否则会叠加两次变换。
"""

from maya import cmds


def _zero_transform(node):
    u"""把 TRS 归零（矩阵驱动时用）。"""

    for attribute, value in (
        ("translate", (0.0, 0.0, 0.0)),
        ("rotate", (0.0, 0.0, 0.0)),
        ("scale", (1.0, 1.0, 1.0)),
    ):
        cmds.setAttr(node + "." + attribute, *value)


def combine_matrices(matrix_plugs, weights=None, name=None):
    u"""把多个矩阵按权重混合成一个矩阵插头。

    Args:
        matrix_plugs (list): 世界矩阵插头，如 ``loc.worldMatrix[0]``。
        weights (list | None): 每个矩阵的权重；None 表示各 1。
        name (str | None): wtAddMatrix 节点名。

    Returns:
        str: 混合后的矩阵插头。
    """

    matrix_plugs = list(matrix_plugs)

    if not matrix_plugs:
        raise ValueError(u"matrix_plugs 不能为空")

    if weights is None:
        weights = [1.0] * len(matrix_plugs)

    if len(weights) != len(matrix_plugs):
        raise ValueError(u"矩阵与权重数量不一致")

    node = (
        name if name and cmds.objExists(name)
        else cmds.createNode("wtAddMatrix", name=name)
    )

    for index, (plug, weight) in enumerate(zip(matrix_plugs, weights)):
        cmds.connectAttr(
            plug, "{}.wtMatrix[{}].matrixIn".format(node, index),
            force=True
        )
        cmds.setAttr(
            "{}.wtMatrix[{}].weightIn".format(node, index),
            float(weight)
        )

    return node + ".matrixSum"


def drive_offset_parent_matrix(target, matrix_plug, parent=None,
                               name=None):
    u"""用矩阵驱动目标的 offsetParentMatrix。

    Args:
        target (str): 被驱动节点。
        matrix_plug (str): 世界矩阵插头或 wtAddMatrix 的输出。
        parent (str | None): 父节点；给了就乘父节点世界逆矩阵，
            把世界矩阵转成父空间。
        name (str | None): multMatrix 节点名。

    Returns:
        str: multMatrix 输出插头。
    """

    node = (
        name if name and cmds.objExists(name)
        else cmds.createNode("multMatrix", name=name)
    )

    cmds.connectAttr(matrix_plug, node + ".matrixIn[0]", force=True)

    if parent and cmds.objExists(parent):
        cmds.connectAttr(
            parent + ".worldInverseMatrix[0]",
            node + ".matrixIn[1]",
            force=True
        )

    cmds.connectAttr(
        node + ".matrixSum",
        target + ".offsetParentMatrix",
        force=True
    )

    _zero_transform(target)

    return node + ".matrixSum"


def aim_matrix(target, aim_position, parent=None, up_axis="Y",
               primary_axis="X", name=None):
    u"""用 aimMatrix 节点让目标朝向一个位置（替代 aimConstraint）。

    Args:
        target (str): 被驱动的节点。
        aim_position (str): 目标点节点的世界位置（用 translate 或矩阵）。
        parent (str | None): 父节点，用于转父空间。
        up_axis (str): 次要轴，X / Y / Z。
        primary_axis (str): 主瞄准轴，X / Y / Z。
        name (str | None): 节点名。

    Returns:
        str: aimMatrix 节点名。
    """

    node = (
        name if name and cmds.objExists(name)
        else cmds.createNode("aimMatrix", name=name)
    )

    axes = {"X": 0, "Y": 1, "Z": 2}

    cmds.setAttr(
        node + ".primaryInputAxis",
        *[1.0 if index == axes[primary_axis] else 0.0
          for index in range(3)]
    )
    cmds.setAttr(
        node + ".secondaryInputAxis",
        *[1.0 if index == axes[up_axis] else 0.0
          for index in range(3)]
    )
    cmds.setAttr(node + ".primaryMode", 1)   # 1 = align
    cmds.setAttr(node + ".secondaryMode", 0)  # 0 = none（只定主方向）

    cmds.connectAttr(
        aim_position + ".translate", node + ".primaryInput"
    )

    drive_offset_parent_matrix(
        target, node + ".outputMatrix", parent=parent,
        name=(name or node) + "_mult"
    )

    return node
