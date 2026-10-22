# coding=utf-8
u"""NURBS 曲线查询与创建。

    查询      曲线 shape、CV 列表、CV 世界坐标
    创建      从选中的边建曲线、从节点位置建曲线

jnt_tool 的「曲线上建关节」依赖这里的 CV 采样：
取 CV 世界坐标 -> JntChain.create_chain。

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
