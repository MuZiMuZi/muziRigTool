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

def get_child_object(object, type="joint"):
    u"""
    获取对象下面指定类型的所有子物体，并包含对象本身。

    返回结果统一为 Maya DAG Long Path，并按父级到子级的顺序排列。
    Maya 的 ``allDescendents`` 会先列孙、再列子，因此这里 append 对象本身后
    再 reverse，正好得到父级在前的顺序。

    Args:
        object (str):
            需要获取子物体的 Maya 场景对象名称。
        type (str):
            需要获取的节点类型，默认 "joint"。

    Returns:
        list[str]:
            对象本身和所有指定类型子物体的 Long Path 列表。

    Raises:
        RuntimeError:
            对象名称为空、对象不存在、不是 DAG 节点，或短名对应多个
            DAG 节点时抛出。
    """

    if not object:
        raise RuntimeError(u"对象名称不能为空。")

    # 组件没有子物体，保持“只返回自身”的旧行为。
    if "." in object:
        return [
            object
        ]

    if not cmds.objExists(object):
        raise RuntimeError(
            u"对象不存在：{}".format(object)
        )

    matches = cmds.ls(object, long=True) or []

    if len(matches) != 1:
        raise RuntimeError(
            u"对象名称不唯一，请使用完整路径：{}".format(object)
        )

    object = matches[0]

    if not cmds.objectType(object, isAType="dagNode"):
        raise RuntimeError(
            u"对象不是 DAG 节点：{}".format(object)
        )

    object_list = cmds.listRelatives(
        object,
        type=type,
        allDescendents=True,
        fullPath=True,
    ) or []

    object_list.append(
        object
    )
    object_list.reverse()

    return object_list
