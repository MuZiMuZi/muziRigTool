# coding=utf-8
u"""吸附基础操作。

支持的选择项：

    组件           顶点、边、面、CV
    Transform/Jnt  普通对象
    Locator        取 shape.worldPosition（可视十字中心），不是 transform 原点

规则：前面的选择作为参考，最后一个作为目标，吸附到参考项的平均位置。

旧库依赖 hierarchy_utils / math_utils / transform_utils 三个模块，
这里全部内联：平均点用普通循环，世界旋转用 cmds.xform 查询。
"""

from maya import cmds


component_tokens = (".vtx[", ".e[", ".f[", ".cv[", ".ep[", ".pt[", ".map[")


def is_component(item):
    u"""判断选择项是否为常见组件。

    Args:
        item (str): Maya 节点或组件字符串。

    Returns:
        bool: 是组件返回 True。
    """

    if not item or "." not in item:
        return False

    return any(token in item for token in component_tokens)


def get_item_world_position(item):
    u"""返回对象或组件的世界位置。

    Locator 的可视中心来自 shape.worldPosition，和 transform 原点可能不一致，
    所以优先读它；其他情况走 xform。

    Args:
        item (str): Transform、Jnt 或组件。

    Returns:
        list | None: [x, y, z]；取不到时返回 None。
    """

    position = None

    if not is_component(item):
        try:
            node_type = cmds.nodeType(item)
        except Exception:
            node_type = None

        locator_shapes = []

        if node_type == "locator":
            locator_shapes = [item]
        elif node_type in ("transform", "joint"):
            locator_shapes = cmds.listRelatives(
                item,
                shapes=True,
                noIntermediate=True,
                fullPath=True,
                type="locator"
            ) or []

        if locator_shapes:
            try:
                world_position = cmds.getAttr(
                    locator_shapes[0] + ".worldPosition[0]"
                )
            except Exception:
                world_position = None

            if world_position:
                position = world_position[0]

    if position is None:
        try:
            position = cmds.xform(
                item,
                query=True,
                worldSpace=True,
                translation=True
            )
        except Exception:
            position = None

    if not position or len(position) < 3:
        return None

    return [float(position[0]), float(position[1]), float(position[2])]


def get_item_world_rotation(item):
    u"""返回 Transform / Jnt 的世界旋转；组件返回 None。

    Args:
        item (str): Transform、Jnt 或组件。

    Returns:
        list | None: [rx, ry, rz]；组件或取不到时返回 None。
    """

    if is_component(item) or not cmds.objExists(item):
        return None

    try:
        node_type = cmds.nodeType(item)
    except Exception:
        return None

    # 传入 shape 时先找到它的 transform
    if node_type not in ("transform", "joint"):
        parents = cmds.listRelatives(item, parent=True, fullPath=True) or []

        if not parents:
            return None

        item = parents[0]

    try:
        rotation = cmds.xform(
            item,
            query=True,
            worldSpace=True,
            rotation=True
        )
    except Exception:
        return None

    return [float(rotation[0]), float(rotation[1]), float(rotation[2])]


def average_point3(points):
    u"""返回一组三维点的平均值。

    Args:
        points (list): [[x, y, z], ...]

    Returns:
        list | None: 平均值；空列表返回 None。
    """

    if not points:
        return None

    count = float(len(points))

    return [
        sum(point[0] for point in points) / count,
        sum(point[1] for point in points) / count,
        sum(point[2] for point in points) / count,
    ]


def snap_to_average(reference_items, target_item, include_rotation=True):
    u"""把目标吸附到参考项的平均位置和平均旋转。

    Args:
        reference_items (list): 参考对象。
        target_item (str): 被移动的目标。
        include_rotation (bool): 是否同时应用平均旋转。

    Returns:
        dict: {"position": [...], "rotation": [...] 或 None}

    Raises:
        RuntimeError: 没有参考项、目标为空或取不到有效位置。
    """

    if not reference_items:
        raise RuntimeError(u"参考对象不能为空。")

    if not target_item:
        raise RuntimeError(u"目标对象不能为空。")

    positions = []

    for item in reference_items:
        position = get_item_world_position(item)

        if position is not None:
            positions.append(position)

    average_position = average_point3(positions)

    if average_position is None:
        raise RuntimeError(u"无法从选择中取得有效参考位置。")

    cmds.xform(target_item, worldSpace=True, translation=average_position)

    result = {
        "position": average_position,
        "rotation": None,
    }

    if not include_rotation or is_component(target_item):
        return result

    rotations = []

    for item in reference_items:
        rotation = get_item_world_rotation(item)

        if rotation is not None:
            rotations.append(rotation)

    average_rotation = average_point3(rotations)

    if average_rotation is None:
        return result

    try:
        cmds.xform(target_item, worldSpace=True, rotation=average_rotation)
        result["rotation"] = average_rotation
    except Exception:
        pass

    return result
