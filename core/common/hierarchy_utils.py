# coding=utf-8
u"""层级与组操作。

这些是纯粹的 Maya DAG 操作，和具体业务无关：

    ensure_group        确保组存在，不存在就创建
    parent_keep_world   挂到父级下，保持世界位置
    ensure_group_at     确保组存在，并对齐到某个节点

绑定模块、控制器工具、清理工具都会用到，所以放在 core 层。

为什么单独一个文件而不是塞进 scene_utils：

    scene_utils 负责清理和查询，偏「扫描场景」；
    这里负责「调整层级」，偏「构造结构」。
    两者职责不同，混在一起会让 scene_utils 越来越杂。
"""

from maya import cmds


def ensure_group(name):
    u"""组不存在就创建，存在就复用。

    Args:
        name (str): 组名。

    Returns:
        str: 组名。
    """

    if cmds.objExists(name):
        return name

    return cmds.group(empty=True, name=name)


def parent_keep_world(child, parent):
    u"""把 child 挂到 parent 下，保持世界位置。

    注意这里用 absolute=True：挂接过程中节点在视口里不会跳。

    Args:
        child (str): 要挂的子节点。
        parent (str): 目标父级。

    Returns:
        str: 父级名。
    """

    cmds.parent(child, parent, absolute=True)

    return parent


def ensure_group_at(name, target):
    u"""确保组存在，并把它的变换对齐到目标节点。

    建控制器层级时常用：新组要落在控制器当前位置上，
    否则挂进去的子节点会跳到世界原点。

    Args:
        name (str): 组名。
        target (str): 对齐目标。

    Returns:
        str: 组名。
    """

    if not cmds.objExists(name):
        group = cmds.group(empty=True, name=name)
        cmds.matchTransform(group, target)

        return group

    return name
