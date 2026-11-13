# coding=utf-8
u"""UV Pin 基础操作。

在模型表面最近点创建 ``uvPin`` 节点，并用它驱动定位器组。

规则：

    模型        Polygon Mesh
    定位器      Transform / Jnt / Locator Shape（自动解析所属 Transform）
    落点        定位器世界位置在模型上的最近点 UV
    组          每个定位器世界位置一个世界级组（无父级）
    定位器      只作为位置参考，不改层级、不改变换

定位器组由 ``uvPin.outputMatrix`` 驱动；默认直接写 ``offsetParentMatrix``，
也可以改用 ``parentConstraint`` / ``pointConstraint``。

同一个模型、同一套 UV / 轴向 / 空间下的多个 pin 会合并到一个 ``uvPin``
节点，用不同的 ``coordinate[i]`` / ``outputMatrix[i]`` 区分。

当前只支持 Polygon Mesh。NURBS 的等参线归一化需要额外处理，暂不接入。
"""

from maya import cmds

try:
    from maya.api import OpenMaya as om2
except ImportError:
    om2 = None

from . import snap_utils


AXIS_NAMES = (
    "X",
    "Y",
    "Z",
    "-X",
    "-Y",
    "-Z",
)

RELATIVE_SPACE_WORLD = 0
RELATIVE_SPACE_LOCAL = 1
RELATIVE_SPACE_CUSTOM = 2

OUTPUT_OFFSET_PARENT_MATRIX = "offset_parent_matrix"
OUTPUT_PARENT_CONSTRAINT = "parent_constraint"
OUTPUT_POINT_CONSTRAINT = "point_constraint"

OUTPUT_MODES = (
    OUTPUT_OFFSET_PARENT_MATRIX,
    OUTPUT_PARENT_CONSTRAINT,
    OUTPUT_POINT_CONSTRAINT,
)

_shape_node_types = ("mesh", "locator", "nurbsSurface", "nurbsCurve")
_driver_node_types = ("transform", "joint")


def get_shape(node):
    u"""解析 Polygon Mesh Shape。

    Args:
        node (str): Mesh Shape 或所属 Transform。

    Returns:
        str: Mesh Shape 的 Long Path。

    Raises:
        RuntimeError: 节点不存在、不是 Mesh，或取不到 Shape。
    """

    if not node:
        raise RuntimeError(u"模型名称不能为空。")

    if not cmds.objExists(node):
        raise RuntimeError(u"模型不存在：{}".format(node))

    if cmds.nodeType(node) == "mesh":
        return cmds.ls(node, long=True)[0]

    shapes = cmds.listRelatives(
        node,
        shapes=True,
        noIntermediate=True,
        fullPath=True,
        type="mesh"
    ) or []

    if not shapes:
        raise RuntimeError(
            u"请选择一个 Polygon Mesh 模型：{}".format(node)
        )

    if len(shapes) > 1:
        cmds.warning(
            u"{} 包含多个 Mesh Shape，使用第一个：{}".format(
                node, shapes[0]
            )
        )

    return shapes[0]


def get_driver_transform(driver):
    u"""把定位器输入统一解析为可驱动的 Transform。

    Args:
        driver (str): 定位器 Transform、Locator Shape 或其他 Transform / Jnt。

    Returns:
        str: Transform Long Path。

    Raises:
        RuntimeError: 节点不存在、Shape 没有父级，或类型不支持。
    """

    if not driver:
        raise RuntimeError(u"定位器名称不能为空。")

    if not cmds.objExists(driver):
        raise RuntimeError(u"定位器不存在：{}".format(driver))

    if snap_utils.is_component(driver):
        raise RuntimeError(
            u"定位器必须是 Node，不能是组件：{}".format(driver)
        )

    node_type = cmds.nodeType(driver)

    if node_type in _shape_node_types:
        parents = cmds.listRelatives(
            driver,
            parent=True,
            fullPath=True
        ) or []

        if not parents:
            raise RuntimeError(
                u"定位器 Shape 没有所属 Transform：{}".format(driver)
            )

        driver = parents[0]
        node_type = cmds.nodeType(driver)

    if node_type not in _driver_node_types:
        raise RuntimeError(
            u"定位器必须是 Transform / Jnt：{}".format(driver)
        )

    if not cmds.attributeQuery(
            "offsetParentMatrix",
            node=driver,
            exists=True
    ):
        raise RuntimeError(
            u"当前 Maya 版本不支持 offsetParentMatrix：{}".format(driver)
        )

    return cmds.ls(driver, long=True)[0]


def get_uv_sets(shape):
    u"""返回 Mesh 上的全部 UV Set 名称。

    Args:
        shape (str): Polygon Mesh Shape。

    Returns:
        list: UV Set 名称；没有时返回空列表。
    """

    shape = get_shape(shape)

    return list(
        cmds.polyUVSet(shape, query=True, allUVSets=True) or []
    )


def get_current_uv_set(shape):
    u"""返回 Mesh 当前 UV Set 名称。

    Args:
        shape (str): Polygon Mesh Shape。

    Returns:
        str: 当前 UV Set；没有时返回空字符串。
    """

    shape = get_shape(shape)
    current = cmds.polyUVSet(
        shape,
        query=True,
        currentUVSet=True
    ) or []

    if not current:
        return ""

    return current[0]


def get_closest_uv(shape, world_position, uv_set=None):
    u"""计算世界位置在 Mesh 上的最近点 UV。

    Args:
        shape (str): Polygon Mesh Shape。
        world_position (list): [x, y, z]。
        uv_set (str | None): UV Set 名称；None 用当前 UV Set。

    Returns:
        dict: ``u``、``v``、``point``、``face``、``distance``。

    Raises:
        RuntimeError: OpenMaya 不可用或取不到最近点。
        ValueError: 坐标不是三维。
    """

    if om2 is None:
        raise RuntimeError(u"当前环境无法加载 maya.api.OpenMaya。")

    if not world_position or len(world_position) != 3:
        raise ValueError(u"world_position 必须是 [x, y, z]。")

    shape = get_shape(shape)
    selection = om2.MGlobal.getSelectionListByName(shape)
    dag_path = selection.getDagPath(0)
    mesh_function = om2.MFnMesh(dag_path)
    mpoint = om2.MPoint(
        float(world_position[0]),
        float(world_position[1]),
        float(world_position[2])
    )
    closest_point, face_index = mesh_function.getClosestPoint(
        mpoint,
        om2.MSpace.kWorld
    )
    uv_result = mesh_function.getUVAtPoint(
        closest_point,
        om2.MSpace.kWorld,
        uv_set or ""
    )

    # API 2.0 的 getUVAtPoint 返回 (u, v, faceIndex)。
    u = float(uv_result[0])
    v = float(uv_result[1])

    dx = closest_point.x - mpoint.x
    dy = closest_point.y - mpoint.y
    dz = closest_point.z - mpoint.z

    return {
        "u": u,
        "v": v,
        "point": [
            closest_point.x,
            closest_point.y,
            closest_point.z,
        ],
        "face": int(face_index),
        "distance": (dx * dx + dy * dy + dz * dz) ** 0.5,
    }


def _validate_axes(normal_axis, tangent_axis):
    u"""校验法线轴和切线轴，禁止同轴。"""

    if normal_axis not in range(6) or tangent_axis not in range(6):
        raise ValueError(u"轴向必须是 0 ~ 5。")

    if normal_axis % 3 == tangent_axis % 3:
        raise RuntimeError(
            u"法线轴和切线轴不能是同一个轴向：{} / {}".format(
                AXIS_NAMES[normal_axis],
                AXIS_NAMES[tangent_axis]
            )
        )


def _reset_target_transform(target):
    u"""清空目标自身的 TRS，让 offsetParentMatrix 成为唯一驱动来源。"""

    values = (
        ("translate", (0.0, 0.0, 0.0)),
        ("rotate", (0.0, 0.0, 0.0)),
        ("scale", (1.0, 1.0, 1.0)),
        ("shear", (0.0, 0.0, 0.0)),
    )

    for attribute_name, attribute_values in values:
        if not cmds.attributeQuery(
                attribute_name,
                node=target,
                exists=True
        ):
            continue

        try:
            cmds.setAttr(
                "{}.{}".format(target, attribute_name),
                *attribute_values,
                type="double3"
            )
        except Exception as error:
            raise RuntimeError(
                u"无法清空目标 {} 的 {}：{}".format(
                    target,
                    attribute_name,
                    error
                )
            )


def create_zero_group(driver, group_name=None):
    u"""按定位器世界位置创建一个世界级组。

    组没有父级，旋转/缩放保持 identity；定位器本身不改层级、不改变换。

    Args:
        driver (str): 定位器 Transform / Shape。
        group_name (str | None): 组名；None 用 ``uvpin_<定位器名>``。

    Returns:
        str: 创建的组名。

    Raises:
        RuntimeError: 定位器无效或取不到世界位置。
    """

    driver = get_driver_transform(driver)
    short_name = driver.rsplit("|", 1)[-1].rsplit(":", 1)[-1]

    if not group_name:
        group_name = "uvpin_{}".format(short_name)

    world_position = snap_utils.get_item_world_position(driver)

    if world_position is None:
        raise RuntimeError(
            u"无法取得定位器世界位置：{}".format(driver)
        )

    group = cmds.createNode("transform", name=group_name)
    cmds.xform(
        group,
        worldSpace=True,
        translation=world_position
    )

    return group


def _get_target_parent(target, output_mode):
    u"""返回 offsetParentMatrix 模式下需要对齐的父级；约束模式固定世界。"""

    if output_mode != OUTPUT_OFFSET_PARENT_MATRIX:
        return None

    parents = cmds.listRelatives(
        target,
        parent=True,
        fullPath=True
    ) or []

    return parents[0] if parents else None


def _create_pin_node(
        shape,
        uv_set,
        normal_axis,
        tangent_axis,
        parent,
        node_name
):
    u"""创建一个 uvPin 节点，并完成节点级属性与几何连接。"""

    node = cmds.createNode("uvPin", name=node_name)

    cmds.connectAttr(
        "{}.worldMesh[0]".format(shape),
        "{}.deformedGeometry".format(node),
        force=True
    )

    if uv_set:
        cmds.setAttr(
            "{}.uvSetName".format(node),
            uv_set,
            type="string"
        )

    cmds.setAttr(
        "{}.normalAxis".format(node),
        normal_axis
    )
    cmds.setAttr(
        "{}.tangentAxis".format(node),
        tangent_axis
    )

    if parent:
        cmds.setAttr(
            "{}.relativeSpaceMode".format(node),
            RELATIVE_SPACE_CUSTOM
        )
        cmds.connectAttr(
            "{}.worldMatrix[0]".format(parent),
            "{}.relativeSpaceMatrix".format(node),
            force=True
        )
        relative_space = "custom"
    else:
        cmds.setAttr(
            "{}.relativeSpaceMode".format(node),
            RELATIVE_SPACE_WORLD
        )
        relative_space = "world"

    return node, relative_space


def _set_pin_coordinate(node, index, u, v):
    u"""写入第 index 个 UV 坐标。"""

    cmds.setAttr(
        "{}.coordinate[{}].coordinateU".format(node, index),
        u
    )
    cmds.setAttr(
        "{}.coordinate[{}].coordinateV".format(node, index),
        v
    )


def _connect_pin_output(
        node,
        index,
        target,
        output_mode,
        maintain_offset
):
    u"""把第 index 个输出连接到目标，返回 (pin_output, constraint)。"""

    if output_mode == OUTPUT_OFFSET_PARENT_MATRIX:
        _reset_target_transform(target)

        cmds.connectAttr(
            "{}.outputMatrix[{}]".format(node, index),
            "{}.offsetParentMatrix".format(target),
            force=True
        )
        return "", ""

    pin_output = cmds.spaceLocator(
        name="{}_{}_output".format(node, index)
    )[0]
    cmds.setAttr(
        "{}.visibility".format(pin_output),
        0
    )
    cmds.connectAttr(
        "{}.outputMatrix[{}]".format(node, index),
        "{}.offsetParentMatrix".format(pin_output),
        force=True
    )

    if output_mode == OUTPUT_PARENT_CONSTRAINT:
        constraint = cmds.parentConstraint(
            pin_output,
            target,
            maintainOffset=maintain_offset,
            name="{}_{}_parentConstraint".format(node, index)
        )[0]
    else:
        constraint = cmds.pointConstraint(
            pin_output,
            target,
            maintainOffset=maintain_offset,
            name="{}_{}_pointConstraint".format(node, index)
        )[0]

    return pin_output, constraint


def create_uv_pin(
        shape,
        driver,
        uv_set=None,
        normal_axis=0,
        tangent_axis=1,
        node_name=None,
        output_mode=OUTPUT_OFFSET_PARENT_MATRIX,
        maintain_offset=False,
        drive_group=True,
        group_name=None
):
    u"""在模型表面最近点创建一个 uvPin，并驱动定位器或定位器组。

    默认 ``drive_group=True``：按定位器世界位置创建一个世界级组，
    uvPin 驱动这个组，定位器本身保持不变。

    ``drive_group=False`` 时沿用基础行为，直接驱动定位器。

    两种输出方式：

    ``offset_parent_matrix``
        清空目标 TRS，用 ``outputMatrix -> offsetParentMatrix`` 直接驱动。

    ``parent_constraint`` / ``point_constraint``
        额外创建一个隐藏的输出 Locator，用约束驱动目标。
        ``maintain_offset=True`` 时保留目标原来的相对偏移。

    Args:
        shape (str): Polygon Mesh Shape 或所属 Transform。
        driver (str): 定位器 Transform / Shape。
        uv_set (str | None): UV Set 名称；None 用当前 UV Set。
        normal_axis (int): 对齐表面法线的轴，0 ~ 5。
        tangent_axis (int): 对齐表面切线的轴，0 ~ 5。
        node_name (str | None): uvPin 节点名；None 用 ``<定位器>_uvPin``。
        output_mode (str): ``offset_parent_matrix`` / ``parent_constraint`` /
            ``point_constraint``。
        maintain_offset (bool): 约束模式下是否保留目标原偏移。
        drive_group (bool): True 时驱动新建的世界级组，False 时驱动定位器。
        group_name (str | None): 组名；None 用 ``uvpin_<定位器名>``。

    Returns:
        dict: ``driver``、``group``、``target``、``shape``、``node``、``index``、
        ``uv_set``、``u``、``v``、``point``、``distance``、``relative_space``、
        ``output_mode``、``pin_output``、``constraint``。

    Raises:
        RuntimeError: 模型 / 定位器无效、UV 不合法或连接失败。
        ValueError: 轴向或输出方式参数非法。
    """

    shape = get_shape(shape)
    driver = get_driver_transform(driver)
    _validate_axes(normal_axis, tangent_axis)

    if output_mode not in OUTPUT_MODES:
        raise ValueError(
            u"不支持的输出方式：{}".format(output_mode)
        )

    selected_uv_set = uv_set or ""

    if selected_uv_set:
        if selected_uv_set not in get_uv_sets(shape):
            raise RuntimeError(
                u"模型上没有 UV Set：{}".format(selected_uv_set)
            )
    else:
        selected_uv_set = get_current_uv_set(shape)

    world_position = snap_utils.get_item_world_position(driver)

    if world_position is None:
        raise RuntimeError(
            u"无法取得定位器世界位置：{}".format(driver)
        )

    uv_data = get_closest_uv(
        shape,
        world_position,
        uv_set=selected_uv_set
    )

    group = ""
    target = driver

    if drive_group:
        group = create_zero_group(
            driver,
            group_name=group_name
        )
        target = group

    short_name = driver.rsplit("|", 1)[-1].rsplit(":", 1)[-1]

    if not node_name:
        node_name = "{}_uvPin".format(short_name)

    parent = _get_target_parent(target, output_mode)

    node, relative_space = _create_pin_node(
        shape=shape,
        uv_set=selected_uv_set,
        normal_axis=normal_axis,
        tangent_axis=tangent_axis,
        parent=parent,
        node_name=node_name
    )

    _set_pin_coordinate(
        node,
        0,
        uv_data["u"],
        uv_data["v"]
    )

    pin_output, constraint = _connect_pin_output(
        node=node,
        index=0,
        target=target,
        output_mode=output_mode,
        maintain_offset=maintain_offset
    )

    return {
        "driver": driver,
        "group": group,
        "target": target,
        "shape": shape,
        "node": node,
        "index": 0,
        "uv_set": selected_uv_set,
        "u": uv_data["u"],
        "v": uv_data["v"],
        "point": uv_data["point"],
        "distance": uv_data["distance"],
        "relative_space": relative_space,
        "output_mode": output_mode,
        "pin_output": pin_output,
        "constraint": constraint,
    }


def create_uv_pins(
        shape,
        drivers,
        uv_set=None,
        normal_axis=0,
        tangent_axis=1,
        output_mode=OUTPUT_OFFSET_PARENT_MATRIX,
        maintain_offset=False,
        drive_group=True,
        merge=True
):
    u"""为一批定位器创建 UV Pin，单个失败不会中断整批。

    ``merge=True`` 时按 ``(UV Set, 法线轴, 切线轴, 空间父级)`` 分桶，
    每个桶只创建一个 uvPin 节点，多个定位器用不同 index。

    ``drive_group=True`` 时每个定位器先创建一个世界级组作为驱动目标；
    组都在世界级，所以同一模型通常只需要一个 uvPin 节点。

    Args:
        shape (str): Polygon Mesh Shape 或所属 Transform。
        drivers (list): 定位器列表。
        uv_set (str | None): UV Set 名称；None 用当前 UV Set。
        normal_axis (int): 对齐表面法线的轴，0 ~ 5。
        tangent_axis (int): 对齐表面切线的轴，0 ~ 5。
        output_mode (str): ``offset_parent_matrix`` / ``parent_constraint`` /
            ``point_constraint``。
        maintain_offset (bool): 约束模式下是否保留目标原偏移。
        drive_group (bool): True 时驱动新建的世界级组，False 时驱动定位器。
        merge (bool): 是否把同一模型 / 同空间的 pin 合并到一个 uvPin 节点。

    Returns:
        dict: ``created`` 每个定位器一项，含 ``node`` / ``index`` / ``group`` /
        ``target``；``failed`` 为 ``{"driver": ..., "error": ...}``；``nodes``
        为本次创建的 uvPin 节点列表。

    Raises:
        RuntimeError: 模型无效或定位器列表为空。
        ValueError: 轴向或输出方式参数非法。
    """

    shape = get_shape(shape)

    if not drivers:
        raise RuntimeError(u"定位器列表不能为空。")

    _validate_axes(normal_axis, tangent_axis)

    if output_mode not in OUTPUT_MODES:
        raise ValueError(
            u"不支持的输出方式：{}".format(output_mode)
        )

    selected_uv_set = uv_set or ""

    if selected_uv_set:
        if selected_uv_set not in get_uv_sets(shape):
            raise RuntimeError(
                u"模型上没有 UV Set：{}".format(selected_uv_set)
            )
    else:
        selected_uv_set = get_current_uv_set(shape)

    if not merge:
        created = []
        failed = []
        nodes = []
        seen = set()

        for driver in drivers:
            if not driver or driver in seen:
                continue

            seen.add(driver)

            try:
                item = create_uv_pin(
                    shape=shape,
                    driver=driver,
                    uv_set=selected_uv_set,
                    normal_axis=normal_axis,
                    tangent_axis=tangent_axis,
                    output_mode=output_mode,
                    maintain_offset=maintain_offset,
                    drive_group=drive_group
                )
                created.append(item)

                if item["node"] not in nodes:
                    nodes.append(item["node"])
            except Exception as error:
                failed.append({
                    "driver": driver,
                    "error": str(error),
                })

        return {
            "created": created,
            "failed": failed,
            "nodes": nodes,
        }

    buckets = {}
    failed = []
    seen = set()

    for driver in drivers:
        if not driver or driver in seen:
            continue

        seen.add(driver)

        try:
            resolved_driver = get_driver_transform(driver)
            world_position = snap_utils.get_item_world_position(
                resolved_driver
            )

            if world_position is None:
                raise RuntimeError(
                    u"无法取得定位器世界位置：{}".format(resolved_driver)
                )

            uv_data = get_closest_uv(
                shape,
                world_position,
                uv_set=selected_uv_set
            )

            group = ""
            target = resolved_driver

            if drive_group:
                group = create_zero_group(resolved_driver)
                target = group

            parent = _get_target_parent(target, output_mode)
            key = (
                selected_uv_set,
                normal_axis,
                tangent_axis,
                parent,
            )

            buckets.setdefault(key, []).append({
                "driver": resolved_driver,
                "group": group,
                "target": target,
                "uv": uv_data,
            })
        except Exception as error:
            failed.append({
                "driver": driver,
                "error": str(error),
            })

    created = []
    nodes = []

    shape_short = shape.rsplit("|", 1)[-1].rsplit(":", 1)[-1]
    shape_parents = cmds.listRelatives(
        shape,
        parent=True,
        fullPath=True
    ) or []
    shape_transform_short = shape_short

    if shape_parents:
        shape_transform_short = shape_parents[0].rsplit(
            "|", 1
        )[-1].rsplit(":", 1)[-1]

    for key, records in buckets.items():
        key_uv_set, key_normal_axis, key_tangent_axis, key_parent = key

        if len(records) == 1:
            first_driver = records[0]["driver"]
            first_short = first_driver.rsplit("|", 1)[-1].rsplit(":", 1)[-1]
            node_name = "{}_uvPin".format(first_short)
        else:
            node_name = "{}_uvPin".format(shape_transform_short)

        try:
            node, relative_space = _create_pin_node(
                shape=shape,
                uv_set=key_uv_set,
                normal_axis=key_normal_axis,
                tangent_axis=key_tangent_axis,
                parent=key_parent,
                node_name=node_name
            )
        except Exception as error:
            for record in records:
                failed.append({
                    "driver": record["driver"],
                    "error": str(error),
                })

                if record["group"]:
                    try:
                        cmds.delete(record["group"])
                    except Exception:
                        pass

            continue

        nodes.append(node)

        for index, record in enumerate(records):
            try:
                _set_pin_coordinate(
                    node,
                    index,
                    record["uv"]["u"],
                    record["uv"]["v"]
                )

                pin_output, constraint = _connect_pin_output(
                    node=node,
                    index=index,
                    target=record["target"],
                    output_mode=output_mode,
                    maintain_offset=maintain_offset
                )

                created.append({
                    "driver": record["driver"],
                    "group": record["group"],
                    "target": record["target"],
                    "shape": shape,
                    "node": node,
                    "index": index,
                    "uv_set": selected_uv_set,
                    "u": record["uv"]["u"],
                    "v": record["uv"]["v"],
                    "point": record["uv"]["point"],
                    "distance": record["uv"]["distance"],
                    "relative_space": relative_space,
                    "output_mode": output_mode,
                    "pin_output": pin_output,
                    "constraint": constraint,
                })
            except Exception as error:
                failed.append({
                    "driver": record["driver"],
                    "error": str(error),
                })

    return {
        "created": created,
        "failed": failed,
        "nodes": nodes,
    }
