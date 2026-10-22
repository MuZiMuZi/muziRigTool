# coding=utf-8
u"""约束创建与查询。

支持的类型：

    parentConstraint / pointConstraint / orientConstraint
    scaleConstraint / aimConstraint / poleVectorConstraint

两种选择模式：

    多对一      前 N 个是 Driver，最后一个是 Driven
    一对多      第一个是 Driver，其余都是 Driven
"""

from maya import cmds


constraint_types = [
    "parentConstraint",
    "pointConstraint",
    "orientConstraint",
    "scaleConstraint",
    "aimConstraint",
    "poleVectorConstraint",
]

# 标准约束：驱动一个对象，可以多个 driver
standard_commands = {
    "parentConstraint": cmds.parentConstraint,
    "pointConstraint": cmds.pointConstraint,
    "orientConstraint": cmds.orientConstraint,
    "scaleConstraint": cmds.scaleConstraint,
    "aimConstraint": cmds.aimConstraint,
}


def create_constraint(
    driver_objects,
    driven_object,
    constraint_type="parentConstraint",
    maintain_offset=True
):
    u"""给一个 Driven 创建标准约束。

    Args:
        driver_objects (list): 一个或多个 Driver。
        driven_object (str): 接收约束的对象。
        constraint_type (str): 标准约束类型。
        maintain_offset (bool): 是否保持当前偏移。

    Returns:
        list: 创建出的约束节点。

    Raises:
        RuntimeError: Driver 为空或 Driven 无效。
        ValueError: 约束类型不支持。
    """

    if not driver_objects:
        raise RuntimeError(u"至少需要一个 Driver。")

    if not driven_object or not cmds.objExists(driven_object):
        raise RuntimeError(u"Driven 无效：{}".format(driven_object))

    command = standard_commands.get(constraint_type)

    if command is None:
        raise ValueError(
            u"不支持的标准约束类型：{}".format(constraint_type)
        )

    result = command(
        driver_objects,
        driven_object,
        maintainOffset=maintain_offset
    )

    return result or []


def create_pole_vector_constraint(driver_object, ik_handle):
    u"""创建极向量约束。

    Args:
        driver_object (str): 极向量控制器。
        ik_handle (str): ikHandle 节点。

    Returns:
        list: 创建出的约束节点。

    Raises:
        RuntimeError: 节点无效或第二个参数不是 ikHandle。
    """

    if not cmds.objExists(driver_object):
        raise RuntimeError(u"Driver 无效：{}".format(driver_object))

    if not cmds.objExists(ik_handle):
        raise RuntimeError(u"IK Handle 无效：{}".format(ik_handle))

    if cmds.nodeType(ik_handle) != "ikHandle":
        raise RuntimeError(
            u"Pole Vector 的 Driven 必须是 ikHandle：{}".format(ik_handle)
        )

    result = cmds.poleVectorConstraint(driver_object, ik_handle)

    return result or []


def get_constraints(nodes, search_types=None):
    u"""查询真正驱动这些对象的约束节点。

    只沿输入方向查，所以只作为 Driver 的对象不会被误报。

    Args:
        nodes (list): 被驱动的对象。
        search_types (list | None): 限定约束类型；None 表示全部。

    Returns:
        list: 约束节点，去重。
    """

    if not nodes:
        return []

    types = search_types or constraint_types
    result = []

    for node in nodes:
        if not cmds.objExists(node):
            continue

        for constraint_type in types:
            constraint_nodes = cmds.listConnections(
                node,
                source=True,
                destination=False,
                type=constraint_type
            ) or []

            for constraint_node in constraint_nodes:
                if constraint_node not in result:
                    result.append(constraint_node)

    return result


def delete_constraints(nodes):
    u"""删除驱动这些对象的约束。

    Args:
        nodes (list): 被驱动的对象。

    Returns:
        int: 删除的约束数量。
    """

    constraints = get_constraints(nodes)

    if not constraints:
        return 0

    cmds.delete(constraints)

    return len(constraints)
