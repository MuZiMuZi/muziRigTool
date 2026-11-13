# coding=utf-8
u"""层级、组与节点校验。

这些是纯粹的 Maya DAG 操作，和具体业务无关：

    ensure_group        确保组存在，不存在就创建
    parent_keep_world   挂到父级下，保持世界位置
    ensure_group_at     确保组存在，并对齐到某个节点
    get_child_object    取对象自身及指定类型的全部子物体，Long Path，父级在前
    validate_node       校验节点名可用：非空、是 Node 而非 Plug、且存在于场景
    get_long_name       取节点 Long Path，名称不唯一时报错

绑定模块、控制器工具都会用到，所以放在 core 层。

2026-11-13：原 core/scene_utils.py 只剩 validate_node / get_long_name
两个函数，已并入本文件，scene_utils 删除。
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


def validate_node(node, label=None):
    u"""校验节点名可用。

    拦截三种情况：名称为空、名带点号（其实是 Plug / Component）、名称不在场景里。

    Args:
        node (str):
            需要校验的 Maya 节点名或 DAG Path，例如 "root"、"|grp|root"。
        label (str | None):
            报错时显示的对象称谓，例如 "根关节"、"模型"；None 时用 "maya节点"。

    Returns:
        bool:
            校验通过返回 True。

    Raises:
        RuntimeError:
            名称为空、是 Plug / Component，或节点不存在时抛出。
    """

    display_label = label or u"maya节点"

    # 先挡 None：直接 str(None) 会变成 "None"，错误信息会误导。
    if node is None:
        raise RuntimeError(
            u"{}名称不能为空。".format(display_label)
        )

    node = str(node).strip()

    if not node:
        raise RuntimeError(
            u"{}名称不能为空。".format(display_label)
        )

    # 带点号说明传进来的是属性或组件，不是节点。
    if "." in node:
        raise RuntimeError(
            u"{}必须是 Maya Node，不能是 Plug / Component：{}".format(
                display_label,
                node
            )
        )

    if not cmds.objExists(node):
        raise RuntimeError(
            u"{}不存在：{}".format(display_label, node)
        )

    return True


def get_long_name(node):
    u"""取节点的 Long Path。

    短名在场景里对应多个节点时直接报错，避免后面操作到错误的那个。

    Args:
        node (str):
            需要查询的 Maya 节点名或 DAG Path。

    Returns:
        str:
            节点的完整路径。

    Raises:
        RuntimeError:
            节点名不可用，或短名对应多个节点时抛出。
    """

    # 先过一遍通用校验：空名 / Plug / 不存在都在这里拦掉。
    validate_node(node)

    matches = cmds.ls(node, long=True)

    if matches is None:
        matches = []

    if not matches:
        return str(node)

    if len(matches) > 1:
        raise RuntimeError(
            u"节点名称不唯一，请使用完整路径：{}".format(node)
        )

    return matches[0]
