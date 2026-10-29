# coding=utf-8
u"""UV Pin Maya 2023 冒烟测试。

验证内容：

1. 按定位器世界位置创建世界级组，定位器本身不动；
2. 同一模型的多个 pin 合并到一个 uvPin 节点；
3. 关闭合并时每个定位器一个节点；
4. drive_group=False 时兼容旧的「直接驱动定位器」行为；
5. 父级 Custom 空间、约束输出、保持偏移；
6. 不同父级按空间分组；
7. 非法轴向与非法 UV Set 会被拒绝。

运行方式（Maya Script Editor）：

    from muziRigTool.tests import uv_pin_tool_maya_smoke_test

    result = uv_pin_tool_maya_smoke_test.run()

运行方式（mayapy，从 scripts 目录）：

    mayapy -m muziRigTool.tests.uv_pin_tool_maya_smoke_test
"""

import traceback
import uuid

import maya.cmds as cmds

from ..core.rigging import uv_pin_utils


# =============================================================================
# Helpers
# =============================================================================

def create_namespace():
    u"""创建独立 Smoke Namespace，并返回绝对路径。"""

    token = uuid.uuid4().hex[:8]
    namespace = "muziUVPinSmoke_{}".format(token)
    absolute_namespace = ":{}".format(namespace)

    cmds.namespace(set=":")
    cmds.namespace(add=namespace)
    cmds.namespace(set=absolute_namespace)

    return absolute_namespace


def remove_namespace(namespace):
    u"""删除 Smoke Namespace 及其内容。"""

    if not namespace:
        return

    absolute_namespace = str(namespace).strip()

    if not absolute_namespace.startswith(":"):
        absolute_namespace = ":{}".format(absolute_namespace)

    try:
        cmds.namespace(set=":")
    except Exception:
        pass

    if not cmds.namespace(exists=absolute_namespace):
        return

    try:
        cmds.namespace(
            removeNamespace=absolute_namespace,
            deleteNamespaceContent=True
        )
    except Exception as error:
        cmds.warning(
            u"无法删除 Smoke Namespace {}：{}".format(
                absolute_namespace,
                error
            )
        )


def require(condition, message):
    u"""统一断言。"""

    if condition:
        return

    raise RuntimeError(message)


def get_world_position(node):
    u"""返回节点世界平移。"""

    return cmds.xform(
        node,
        query=True,
        worldSpace=True,
        translation=True
    )


def get_distance_to_origin(position):
    u"""返回位置到原点的距离。"""

    return sum(value * value for value in position) ** 0.5


def positions_close(first, second, tolerance=0.001):
    u"""判断两个世界位置是否接近。"""

    return all(
        abs(start - end) <= tolerance
        for start, end in zip(first, second)
    )


def get_short_name(node):
    u"""返回不含 Namespace 和 DAG 路径的短名。"""

    return node.rsplit("|", 1)[-1].rsplit(":", 1)[-1]


def create_test_sphere(name="muzi_uvpin_sphere"):
    u"""创建半径 1 的测试球，返回 Transform 与 Mesh Shape。"""

    sphere = cmds.polySphere(name=name, radius=1.0)[0]
    shapes = cmds.listRelatives(
        sphere,
        shapes=True,
        fullPath=True
    ) or []

    return sphere, shapes[0]


def create_test_locator(name, position):
    u"""创建指定世界位置的定位器。"""

    locator = cmds.spaceLocator(name=name)[0]
    cmds.xform(locator, worldSpace=True, translation=position)

    return locator


def get_parents(node):
    u"""返回节点的父级短名列表。"""

    parents = cmds.listRelatives(
        node,
        parent=True,
        fullPath=True
    ) or []

    return [get_short_name(parent) for parent in parents]


def connect_target_to_output(group, node, index):
    u"""检查组的 offsetParentMatrix 是否来自指定 outputMatrix 索引。"""

    connections = cmds.listConnections(
        group + ".offsetParentMatrix",
        source=True,
        destination=False,
        plugs=True
    ) or []

    expected = "{}.outputMatrix[{}]".format(node, index)

    return any(
        connection.endswith(expected)
        for connection in connections
    )


# =============================================================================
# Test Cases
# =============================================================================

def test_zero_group():
    u"""组在世界级、位置等于定位器，且定位器完全不动。"""

    parent = cmds.createNode("transform", name="muzi_uvpin_zero_parent")
    cmds.setAttr(parent + ".translate", 2.0, 0.0, 0.0, type="double3")

    locator = cmds.spaceLocator(name="muzi_uvpin_zero_locator")[0]
    cmds.parent(locator, parent, absolute=True)
    cmds.setAttr(
        locator + ".translate",
        -1.0,
        1.0,
        0.0,
        type="double3"
    )

    before_position = get_world_position(locator)
    before_parents = get_parents(locator)

    group = uv_pin_utils.create_zero_group(locator)

    require(cmds.objExists(group), u"组不存在：{}".format(group))
    require(
        get_short_name(group) == "uvpin_{}".format(
            get_short_name(locator)
        ),
        u"组名不符合 uvpin_<定位器名>：{}".format(group)
    )
    require(
        cmds.nodeType(group) == "transform",
        u"组类型不是 transform：{}".format(group)
    )
    require(
        not get_parents(group),
        u"组不应有父级：{}".format(get_parents(group))
    )
    require(
        positions_close(get_world_position(group), before_position),
        u"组位置不等于定位器位置：{} -> {}".format(
            before_position,
            get_world_position(group)
        )
    )
    require(
        positions_close(get_world_position(locator), before_position),
        u"定位器位置被改动了"
    )
    require(
        get_parents(locator) == before_parents,
        u"定位器父级被改动了：{} -> {}".format(
            before_parents,
            get_parents(locator)
        )
    )

    rotation = cmds.getAttr(group + ".rotate")[0]
    scale = cmds.getAttr(group + ".scale")[0]

    require(
        all(abs(value) < 0.001 for value in rotation),
        u"组旋转不是 identity：{}".format(rotation)
    )
    require(
        all(abs(value - 1.0) < 0.001 for value in scale),
        u"组缩放不是 identity：{}".format(scale)
    )

    return u"世界级组创建正确，定位器未改动"


def test_batch_merged():
    u"""默认批量创建：3 个组、1 个 uvPin 节点。"""

    sphere, shape = create_test_sphere()
    positions = [
        (1.1, 0.1, 0.05),
        (0.1, 1.15, -0.05),
        (-0.9, 0.2, 0.4),
    ]
    drivers = []

    for index, position in enumerate(positions):
        drivers.append(
            create_test_locator(
                "muzi_uvpin_locator_{:02d}".format(index),
                position
            )
        )

    before_positions = {
        cmds.ls(driver, long=True)[0]: get_world_position(driver)
        for driver in drivers
    }
    before_parents = {
        cmds.ls(driver, long=True)[0]: get_parents(driver)
        for driver in drivers
    }

    result = uv_pin_utils.create_uv_pins(shape, drivers)

    require(
        len(result["created"]) == 3,
        u"批量创建数量错误：{}".format(len(result["created"]))
    )
    require(
        not result["failed"],
        u"批量创建出现失败：{}".format(result["failed"])
    )
    require(
        len(result["nodes"]) == 1,
        u"同一模型应合并为 1 个 uvPin：{}".format(result["nodes"])
    )

    node = result["nodes"][0]
    require(cmds.objExists(node), u"uvPin 节点不存在：{}".format(node))

    for item in result["created"]:
        group = item["group"]

        require(
            item["node"] == node,
            u"多个 pin 没有共用同一个节点：{}".format(item["node"])
        )
        require(
            item["target"] == group,
            u"默认应该驱动组：{}".format(item["target"])
        )
        require(
            cmds.objExists(group),
            u"组不存在：{}".format(group)
        )
        require(
            not get_parents(group),
            u"组不应有父级：{}".format(get_parents(group))
        )
        require(
            positions_close(
                get_world_position(item["driver"]),
                before_positions[item["driver"]]
            ),
            u"定位器被驱动了：{}".format(item["driver"])
        )
        require(
            get_parents(item["driver"]) == before_parents[item["driver"]],
            u"定位器父级被改动了：{}".format(item["driver"])
        )
        require(
            0.9 < get_distance_to_origin(get_world_position(group)) < 1.05,
            u"组没有落到球面：{}".format(get_world_position(group))
        )
        require(
            connect_target_to_output(group, node, item["index"]),
            u"组没有接对应的 outputMatrix[{}]".format(item["index"])
        )

    return u"3 个组合并到 1 个 uvPin 节点，索引连接正确"


def test_merge_disabled():
    u"""关闭合并后每个定位器一个 uvPin 节点。"""

    sphere, shape = create_test_sphere()
    drivers = [
        create_test_locator("muzi_uvpin_no_merge_0", (1.1, 0.1, 0.05)),
        create_test_locator("muzi_uvpin_no_merge_1", (0.1, 1.15, -0.05)),
        create_test_locator("muzi_uvpin_no_merge_2", (-0.9, 0.2, 0.4)),
    ]

    result = uv_pin_utils.create_uv_pins(
        shape,
        drivers,
        merge=False
    )

    require(
        len(result["created"]) == 3,
        u"未合并时创建数量错误：{}".format(len(result["created"]))
    )
    require(
        len(result["nodes"]) == 3,
        u"未合并时应为 3 个节点：{}".format(result["nodes"])
    )
    require(
        len(set(result["nodes"])) == 3,
        u"未合并时节点重复：{}".format(result["nodes"])
    )

    return u"关闭合并后每个定位器独立节点"


def test_parent_space():
    u"""drive_group=False 且定位器有父级时使用 Custom 空间。"""

    sphere, shape = create_test_sphere()

    parent = cmds.createNode("transform", name="muzi_uvpin_group")
    cmds.setAttr(parent + ".translate", 2.0, 0.0, 0.0, type="double3")

    locator = cmds.spaceLocator(
        name="muzi_uvpin_parented_locator"
    )[0]
    cmds.parent(locator, parent, absolute=True)
    cmds.setAttr(
        locator + ".translate",
        -1.0,
        1.0,
        0.0,
        type="double3"
    )

    result = uv_pin_utils.create_uv_pin(
        shape,
        locator,
        drive_group=False
    )

    require(
        result["group"] == "",
        u"drive_group=False 不应创建组：{}".format(result["group"])
    )
    require(
        result["target"] == cmds.ls(locator, long=True)[0],
        u"drive_group=False 应驱动定位器：{}".format(result["target"])
    )
    require(
        result["relative_space"] == "custom",
        u"父级定位器没有使用 Custom 空间：{}".format(
            result["relative_space"]
        )
    )

    parent_connections = cmds.listConnections(
        result["node"] + ".relativeSpaceMatrix",
        source=True,
        destination=False,
        plugs=True
    ) or []

    require(
        any(
            connection.endswith(get_short_name(parent) + ".worldMatrix")
            or connection.endswith(
                get_short_name(parent) + ".worldMatrix[0]"
            )
            for connection in parent_connections
        ),
        u"relativeSpaceMatrix 没有接到父级：{}".format(
            parent_connections
        )
    )

    radius = get_distance_to_origin(get_world_position(locator))

    require(
        0.9 < radius < 1.05,
        u"父级定位器发生双重变换：{}".format(radius)
    )

    return u"父级 Custom 空间与双重变换防护正常"


def test_follows_transform():
    u"""模型移动后组跟随，定位器保持不动。"""

    sphere, shape = create_test_sphere()
    locator = create_test_locator(
        "muzi_uvpin_follow_locator",
        (1.0, 0.2, 0.1)
    )

    result = uv_pin_utils.create_uv_pin(shape, locator)
    group = result["target"]
    driver_before = get_world_position(locator)

    before_position = get_world_position(group)
    cmds.setAttr(sphere + ".translateY", 3.0)
    after_position = get_world_position(group)

    delta_y = after_position[1] - before_position[1]

    require(
        abs(delta_y - 3.0) < 0.001,
        u"组没有跟随模型：{}".format(delta_y)
    )
    require(
        positions_close(get_world_position(locator), driver_before),
        u"定位器不应跟随模型"
    )

    return u"模型变换后组跟随，定位器不动"


def test_parent_constraint_output():
    u"""约束输出模式：组被拉到表面。"""

    sphere, shape = create_test_sphere()
    locator = create_test_locator(
        "muzi_uvpin_constraint_locator",
        (1.2, 0.2, 0.05)
    )

    result = uv_pin_utils.create_uv_pin(
        shape,
        locator,
        output_mode=uv_pin_utils.OUTPUT_PARENT_CONSTRAINT,
        maintain_offset=False
    )

    require(
        result["constraint"],
        u"parentConstraint 没有创建"
    )
    require(
        cmds.objExists(result["constraint"]),
        u"约束节点不存在：{}".format(result["constraint"])
    )
    require(
        result["target"] == result["group"],
        u"约束应驱动组：{}".format(result["target"])
    )

    radius = get_distance_to_origin(
        get_world_position(result["group"])
    )

    require(
        0.9 < radius < 1.05,
        u"约束模式没有把组拉到表面：{}".format(radius)
    )

    return u"parentConstraint 输出模式正常"


def test_point_constraint_offset():
    u"""pointConstraint + maintainOffset 保留组偏移并跟随模型。"""

    sphere, shape = create_test_sphere()
    locator = create_test_locator(
        "muzi_uvpin_point_locator",
        (1.2, 0.2, 0.05)
    )

    before = get_world_position(locator)

    result = uv_pin_utils.create_uv_pin(
        shape,
        locator,
        output_mode=uv_pin_utils.OUTPUT_POINT_CONSTRAINT,
        maintain_offset=True
    )

    group = result["group"]

    require(
        result["constraint"],
        u"pointConstraint 没有创建"
    )
    require(
        positions_close(get_world_position(group), before),
        u"保持偏移没有保留组的位置：{} -> {}".format(
            before,
            get_world_position(group)
        )
    )

    cmds.setAttr(sphere + ".translateY", 2.0)
    after_move = get_world_position(group)

    require(
        abs((after_move[1] - before[1]) - 2.0) < 0.001,
        u"pointConstraint 没有跟随模型：{}".format(after_move)
    )

    return u"pointConstraint + 保持偏移正常"


def test_constraint_merged():
    u"""约束模式合并后，一个节点约束多个组。"""

    sphere, shape = create_test_sphere()
    drivers = [
        create_test_locator("muzi_uvpin_cmerge_0", (1.1, 0.1, 0.05)),
        create_test_locator("muzi_uvpin_cmerge_1", (0.1, 1.15, -0.05)),
    ]

    result = uv_pin_utils.create_uv_pins(
        shape,
        drivers,
        output_mode=uv_pin_utils.OUTPUT_PARENT_CONSTRAINT
    )

    require(
        len(result["nodes"]) == 1,
        u"约束模式也应合并为 1 个节点：{}".format(result["nodes"])
    )
    require(
        len(result["created"]) == 2,
        u"约束模式创建数量错误：{}".format(len(result["created"]))
    )

    for item in result["created"]:
        require(
            item["constraint"],
            u"组没有约束：{}".format(item["group"])
        )
        require(
            0.9 < get_distance_to_origin(
                get_world_position(item["target"])
            ) < 1.05,
            u"约束后的组没有落到球面：{}".format(item["target"])
        )

    return u"约束模式合并且每个组都被约束"


def test_different_parents_merge():
    u"""drive_group=False 时不同父级按空间分组。"""

    sphere, shape = create_test_sphere()

    parent = cmds.createNode(
        "transform",
        name="muzi_uvpin_multi_parent"
    )

    locator_world = create_test_locator(
        "muzi_uvpin_world_locator",
        (1.0, 1.0, 0.0)
    )

    locator_child = cmds.spaceLocator(
        name="muzi_uvpin_child_locator"
    )[0]
    cmds.parent(locator_child, parent, absolute=True)
    cmds.setAttr(
        locator_child + ".translate",
        1.0,
        1.0,
        0.0,
        type="double3"
    )

    result = uv_pin_utils.create_uv_pins(
        shape,
        [locator_world, locator_child],
        drive_group=False,
        merge=True
    )

    require(
        len(result["nodes"]) == 2,
        u"不同父级应分成 2 个节点：{}".format(result["nodes"])
    )
    require(
        len(result["created"]) == 2,
        u"不同父级创建数量错误：{}".format(len(result["created"]))
    )

    for driver in (locator_world, locator_child):
        radius = get_distance_to_origin(get_world_position(driver))

        require(
            0.9 < radius < 1.05,
            u"定位器没有落到球面：{} / {}".format(driver, radius)
        )

    return u"不同父级按空间分组正常"


def test_axis_conflict():
    u"""法线轴与切线轴同轴时拒绝创建。"""

    sphere, shape = create_test_sphere()
    locator = create_test_locator(
        "muzi_uvpin_axis_locator",
        (1.0, 0.0, 0.0)
    )

    try:
        uv_pin_utils.create_uv_pin(
            shape,
            locator,
            normal_axis=0,
            tangent_axis=3
        )
    except RuntimeError:
        return u"同轴参数被正确拒绝"

    raise RuntimeError(u"法线轴与切线轴同轴时仍然创建了 UV Pin。")


def test_invalid_uv_set():
    u"""不存在的 UV Set 被拒绝。"""

    sphere, shape = create_test_sphere()
    locator = create_test_locator(
        "muzi_uvpin_uvset_locator",
        (1.0, 0.0, 0.0)
    )

    try:
        uv_pin_utils.create_uv_pin(
            shape,
            locator,
            uv_set="muzi_missing_uv_set"
        )
    except RuntimeError:
        return u"非法 UV Set 被正确拒绝"

    raise RuntimeError(u"不存在的 UV Set 仍然创建了 UV Pin。")


# =============================================================================
# Runner
# =============================================================================

def get_test_cases():
    u"""返回测试用例列表。"""

    return [
        ("Zero Group", test_zero_group),
        ("Batch Merged", test_batch_merged),
        ("Merge Disabled", test_merge_disabled),
        ("Parent Space", test_parent_space),
        ("Follows Transform", test_follows_transform),
        ("Parent Constraint", test_parent_constraint_output),
        ("Point Constraint Offset", test_point_constraint_offset),
        ("Constraint Merged", test_constraint_merged),
        ("Different Parents", test_different_parents_merge),
        ("Axis Conflict", test_axis_conflict),
        ("Invalid UV Set", test_invalid_uv_set),
    ]


def run():
    u"""运行 UV Pin Maya 冒烟测试。

    Returns:
        dict: ``results``、``passed``、``failed``。
    """

    print("=" * 78)
    print("Muzi Rig Tool - UV Pin Maya Smoke Test")
    print("=" * 78)

    current_namespace = cmds.namespaceInfo(
        currentNamespace=True
    ) or ":"
    namespace = create_namespace()
    results = []
    passed_count = 0
    failed_count = 0

    try:
        for name, test_function in get_test_cases():
            try:
                message = test_function()
                results.append({
                    "name": name,
                    "passed": True,
                    "message": message,
                    "traceback": "",
                })
                passed_count += 1
                print(u"[PASS] {} | {}".format(name, message))
            except Exception as error:
                results.append({
                    "name": name,
                    "passed": False,
                    "message": str(error),
                    "traceback": traceback.format_exc(),
                })
                failed_count += 1
                print(u"[FAIL] {} | {}".format(name, error))
                print(traceback.format_exc())
    finally:
        try:
            cmds.namespace(set=current_namespace)
        except Exception:
            pass

        remove_namespace(namespace)

    print("-" * 78)
    print(
        "Passed: {} | Failed: {}".format(
            passed_count,
            failed_count
        )
    )
    print("=" * 78)

    return {
        "results": results,
        "passed": passed_count,
        "failed": failed_count,
    }


if __name__ == "__main__":
    try:
        import maya.standalone

        maya.standalone.initialize(name="python")
    except Exception:
        pass

    test_result = run()

    if test_result["failed"]:
        raise SystemExit(1)

    raise SystemExit(0)
