# coding=utf-8
u"""NURBS 曲线查询与创建。

    查询      曲线 shape、CV 列表、CV 世界坐标、等参数采样
    创建      从选中的边建曲线、从节点位置建曲线

jnt_tool 的「曲线上建关节」依赖这里的 CV 采样：
取 CV 世界坐标 -> JntChain.create_chain。

spline_ctrl_tool 的「按点数重建曲线」依赖 rebuild_curve：
用 Maya rebuildCurve 重建，再取新曲线的 CV 世界坐标当控制器位置。

旧库还有 create_curve_from_nodes 的复杂版本（带 history 控制），
这里只保留建关节用得到的部分。
"""

from maya import cmds


def get_curve_shape(curve):
    u"""返回 NURBS 曲线的 shape 长名。

    Args:
        curve (str): 曲线 transform 或 shape。

    Returns:
        str: shape 长名。

    Raises:
        RuntimeError: 节点不存在或不是曲线。
    """

    if not curve or not cmds.objExists(curve):
        raise RuntimeError(u"节点不存在：{}".format(curve))

    # 输入本身就是 shape
    if cmds.nodeType(curve) == "nurbsCurve":
        matches = cmds.ls(curve, long=True)

        return matches[0] if matches else curve

    shapes = cmds.listRelatives(
        curve,
        shapes=True,
        noIntermediate=True,
        fullPath=True
    ) or []

    for shape in shapes:
        if cmds.nodeType(shape) == "nurbsCurve":
            return shape

    raise RuntimeError(u"节点不是 NURBS 曲线：{}".format(curve))


def get_curve_cvs(curve):
    u"""返回曲线的 CV 名列表。

    Args:
        curve (str): 曲线 transform 或 shape。

    Returns:
        list: CV 名列表，按曲线顺序。
    """

    shape = get_curve_shape(curve)

    return cmds.ls(shape + ".cv[*]", flatten=True) or []


def get_curve_cv_positions(curve, world_space=True):
    u"""返回曲线所有 CV 的坐标。

    Args:
        curve (str): 曲线 transform 或 shape。
        world_space (bool): True 返回世界坐标，False 返回局部坐标。

    Returns:
        list: [[x, y, z], ...]，从第一个 CV 到最后一个。
    """

    positions = []

    for cv in get_curve_cvs(curve):
        position = cmds.xform(
            cv,
            query=True,
            worldSpace=world_space,
            translation=True
        )

        positions.append(position)

    return positions


def create_curve_from_selected_edges(name, degree=3, form=2):
    u"""把选中的多边形边转成 NURBS 曲线。

    只读取当前选择中的边，其他类型的选择会被忽略。

    Args:
        name (str): 新曲线名。
        degree (int): 阶数。
        form (int): 0 开放 / 1 闭合 / 2 周期。

    Returns:
        str: 曲线 transform 名。

    Raises:
        RuntimeError: 没有选中边或转换失败。
    """

    edges = cmds.filterExpand(selectionMask=32, expand=True) or []

    if not edges:
        raise RuntimeError(u"请先选择一个或多个多边形边。")

    result = cmds.polyToCurve(
        form=form,
        degree=degree,
        constructionHistory=False,
        name=name
    )

    if not result:
        raise RuntimeError(u"多边形边转曲线失败。")

    # Maya 返回列表，第一项是曲线 transform
    return result[0]


def create_curve_from_nodes(nodes, name, degree=3):
    u"""按节点世界位置建一条曲线。

    Args:
        nodes (list): 节点列表，至少两个。
        name (str): 曲线名。
        degree (int): 阶数。

    Returns:
        str: 曲线 transform 名。

    Raises:
        RuntimeError: 节点不足两个。
    """

    points = []

    for node in nodes:
        points.append(
            cmds.xform(node, query=True, worldSpace=True, translation=True)
        )

    if len(points) < 2:
        raise RuntimeError(u"至少需要两个点。")

    return cmds.curve(point=points, degree=degree, name=name)


def rebuild_curve(curve, spans, degree=3):
    u"""按跨度数重建曲线。

    用 Maya 自带的 rebuildCurve，而不是自己沿曲线采样再建曲线：
    采样点直接当 CV 建出来的曲线，形状和控制点位置都会走样。

    参数和 Maya「重建曲线选项」一一对应：

        重建类型 = 一致（Uniform）
        跨度数   = spans
        次数     = degree
        参数范围 = 0 到 1

    保持类参数全部显式传，不依赖 Maya 默认值（不同版本默认值不一样）：
        保持末端  打开
        保持切线  关闭
        保持 CV   关闭 —— 打开会保留原 CV 数量，spans 就不生效了

    开曲线的控制点数 = spans + degree。
    实际数量以重建结果为准，调用方应该读回来再用。

    Args:
        curve (str): 源曲线 transform 或 shape。
        spans (int): 跨度数，至少 1。
        degree (int): 阶数，1 ~ 7，默认 3。

    Returns:
        str: 新建的曲线名（Maya 自动命名，调用方可以再改名）。

    Raises:
        ValueError: 跨度数或阶数不合法。
        RuntimeError: 重建失败。
    """

    span_count = int(spans)
    degree_value = int(degree)

    if span_count < 1:
        raise ValueError(u"跨度数至少为 1，收到：{}".format(spans))

    if not 1 <= degree_value <= 7:
        raise ValueError(u"阶数必须在 1 ~ 7 之间，收到：{}".format(degree))

    shape = get_curve_shape(curve)

    result = cmds.rebuildCurve(
        shape,
        constructionHistory=False,
        replaceOriginal=False,
        rebuildType=0,
        spans=span_count,
        degree=degree_value,
        keepRange=0,
        keepEndPoints=True,
        keepTangents=False,
        keepControlPoints=False
    )

    if not result:
        raise RuntimeError(u"曲线重建失败：{}".format(curve))

    return result[0]


def space_points_on_polyline(points, count):
    u"""沿折线等弧长取 count 个点，包含首尾。

    用途：把「控制点」重采样成「变形骨骼」的位置。
    控制器少一点好摆，骨骼多一点形变才顺，两者数量不必相同。

    Args:
        points (list): 折线顶点 [[x, y, z], ...]，至少 2 个。
        count (int): 目标点数，至少 2。

    Returns:
        list: count 个点，首尾与输入一致。

    Raises:
        ValueError: 输入点数或采样数量不足。
    """

    total_count = int(count)

    if len(points) < 2:
        raise ValueError(u"折线至少需要 2 个点。")

    if total_count < 2:
        raise ValueError(u"采样数量至少为 2，收到：{}".format(count))

    segments = []
    total_length = 0.0

    for index in range(len(points) - 1):
        start = points[index]
        end = points[index + 1]
        dx = end[0] - start[0]
        dy = end[1] - start[1]
        dz = end[2] - start[2]
        length = (dx * dx + dy * dy + dz * dz) ** 0.5
        segments.append(length)
        total_length += length

    # 所有点重合时没有长度可分，直接重复首点。
    if total_length <= 0.0:
        return [list(points[0]) for _ in range(total_count)]

    result = []

    for index in range(total_count):
        distance = total_length * index / float(total_count - 1)
        result.append(_point_at_distance(points, segments, distance))

    return result


def sample_curve_points(curve, count, samples=200, bounds=None):
    u"""沿曲线等弧长取 count 个点。

    做法：先在参数上稠密采样得到一条折线，再沿折线等弧长取点。
    直接拿控制点连线取点会切角——曲线弯得厉害时，关节会偏到曲线内侧。

    Args:
        curve (str): 曲线 transform 或 shape。
        count (int): 目标点数，至少 2。
        samples (int): 稠密采样数量，默认 200，越大越准。
        bounds (tuple | None): (起点, 终点) 世界坐标。给了就只在这两点之间取点
            ——首尾控制点跳过时用它把关节限制在中间段。

    Returns:
        list: count 个世界坐标点。

    Raises:
        ValueError: 采样数量不合法。
        RuntimeError: 曲线采样失败，或 bounds 之间没有有效区间。
    """

    total_count = int(count)

    if total_count < 2:
        raise ValueError(u"采样数量至少为 2，收到：{}".format(count))

    shape = get_curve_shape(curve)
    dense = []

    for index in range(samples + 1):
        parameter = float(index) / samples
        point = cmds.pointOnCurve(shape, parameter=parameter, position=True)

        if point:
            dense.append(point)

    if len(dense) < 2:
        raise RuntimeError(u"曲线采样失败：{}".format(curve))

    if bounds:
        start_index = _nearest_index(dense, bounds[0])
        end_index = _nearest_index(dense, bounds[1])

        if end_index - start_index < 1:
            raise RuntimeError(u"曲线指定区间过短，无法分布关节：{}".format(curve))

        dense = dense[start_index:end_index + 1]

    return space_points_on_polyline(dense, total_count)


def _nearest_index(points, target):
    u"""返回离 target 最近的点下标。"""

    best_index = 0
    best_distance = None

    for index, point in enumerate(points):
        dx = point[0] - target[0]
        dy = point[1] - target[1]
        dz = point[2] - target[2]
        distance = dx * dx + dy * dy + dz * dz

        if best_distance is None or distance < best_distance:
            best_distance = distance
            best_index = index

    return best_index


def _point_at_distance(points, segments, distance):
    u"""取折线上距起点 distance 处的点。

    Args:
        points (list): 折线顶点。
        segments (list): 每段长度。
        distance (float): 距起点的弧长。

    Returns:
        list: [x, y, z]。
    """

    travelled = 0.0
    last_index = len(segments) - 1

    for index, length in enumerate(segments):
        if travelled + length >= distance or index == last_index:
            start = points[index]
            end = points[index + 1]

            if length <= 0.0:
                return list(start)

            ratio = (distance - travelled) / length
            ratio = min(max(ratio, 0.0), 1.0)

            return [
                start[0] + (end[0] - start[0]) * ratio,
                start[1] + (end[1] - start[1]) * ratio,
                start[2] + (end[2] - start[2]) * ratio,
            ]

        travelled += length

    return list(points[-1])
