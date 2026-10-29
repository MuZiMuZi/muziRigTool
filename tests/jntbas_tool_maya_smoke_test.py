# coding=utf-8
u"""Jntbas 基准关节工具 Maya 2023 冒烟测试。

验证：

1. 在 zero_* 下创建同位置的 jntbas_*；
2. jntbas.worldInverseMatrix 正确接到 skinCluster.bindPreMatrix；
3. 移动 zero_* 后 bindPreMatrix 会跟着更新；
4. 只处理选中的 jnt_*；
5. 已有 bindPreMatrix 连接时不覆盖；
6. 没有 zero_* 父级的骨骼被跳过。

运行方式（Maya Script Editor）：

    from muziRigTool.tests import jntbas_tool_maya_smoke_test

    result = jntbas_tool_maya_smoke_test.run()

运行方式（mayapy，从 scripts 目录）：

    mayapy -m muziRigTool.tests.jntbas_tool_maya_smoke_test
"""

import traceback
import uuid

import maya.cmds as cmds

from ..core.rigging import jntbas_utils


# =============================================================================
# Helpers
# =============================================================================

def create_namespace():
    u"""创建独立 Smoke Namespace，并返回绝对路径。"""

    token = uuid.uuid4().hex[:8]
    namespace = "muziJntbasSmoke_{}".format(token)
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


def get_short_name(node):
    u"""返回不含 Namespace 和 DAG 路径的短名。"""

    return node.rsplit("|", 1)[-1].rsplit(":", 1)[-1]


def get_parents(node):
    u"""返回父级短名列表。"""

    parents = cmds.listRelatives(
        node,
        parent=True,
        fullPath=True
    ) or []

    return [get_short_name(parent) for parent in parents]


def get_world_position(node):
    u"""返回世界平移。"""

    return cmds.xform(
        node,
        query=True,
        worldSpace=True,
        translation=True
    )


def matrices_close(first, second, tolerance=0.0001):
    u"""判断两个矩阵是否接近。"""

    if first is None or second is None:
        return False

    if len(first) != len(second):
        return False

    return all(
        abs(start - end) <= tolerance
        for start, end in zip(first, second)
    )


def create_chain(suffix, position=(1.0, 1.0, 0.0)):
    u"""创建 zero_* + jnt_* + 测试网格 + skinCluster。"""

    zero = cmds.createNode(
        "transform",
        name="zero_{}".format(suffix)
    )
    joint = cmds.createNode(
        "joint",
        name="jnt_{}".format(suffix),
        parent=zero
    )
    cmds.setAttr(
        joint + ".translate",
        position[0],
        position[1],
        position[2],
        type="double3"
    )

    sphere = cmds.polySphere(
        name="muzi_jntbas_mesh_{}".format(suffix),
        radius=0.5
    )[0]
    skin = cmds.skinCluster(joint, sphere)[0]

    return zero, joint, skin


# =============================================================================
# Test Cases
# =============================================================================

def test_build_single():
    u"""单根骨骼：jntbas 创建、位置、父级、bindPreMatrix 连接。"""

    zero, joint, skin = create_chain("lf_cuff_sub_001")
    result = jntbas_utils.build_jntbas()

    require(
        result["created"],
        u"jntbas 没有创建：{}".format(result)
    )

    bas = result["created"][0]

    require(
        get_short_name(bas) == "jntbas_lf_cuff_sub_001",
        u"jntbas 名称错误：{}".format(bas)
    )
    require(
        get_parents(bas) == [get_short_name(zero)],
        u"jntbas 父级不是 zero：{}".format(get_parents(bas))
    )
    require(
        matrices_close(
            cmds.xform(bas, query=True, worldSpace=True, matrix=True),
            cmds.xform(joint, query=True, worldSpace=True, matrix=True)
        ),
        u"jntbas 与 jnt 的世界矩阵不一致"
    )
    require(
        len(result["created"]) == 1,
        u"created 数量错误：{}".format(result["created"])
    )

    plug = "{}.bindPreMatrix[0]".format(skin)
    sources = cmds.listConnections(
        plug,
        source=True,
        destination=False,
        plugs=True
    ) or []

    require(
        any(
            source.endswith(
                "jntbas_lf_cuff_sub_001.worldInverseMatrix"
            )
            or source.endswith(
                "jntbas_lf_cuff_sub_001.worldInverseMatrix[0]"
            )
            for source in sources
        ),
        u"bindPreMatrix 没有接到 jntbas：{}".format(sources)
    )
    require(
        len(result["linked"]) == 1,
        u"linked 数量错误：{}".format(result["linked"])
    )

    return u"jntbas 创建与 bindPreMatrix 连接正常"


def test_selected_only():
    u"""只处理选中的 jnt_*，不影响同场景另一条链。"""

    zero_a, joint_a, skin_a = create_chain("lf_a")
    zero_b, joint_b, skin_b = create_chain("lf_b")

    result = jntbas_utils.build_jntbas([joint_a])

    require(
        result["created"],
        u"选中的 jntbas_lf_a 没有创建：{}".format(result)
    )
    require(
        get_short_name(result["created"][0]) == "jntbas_lf_a",
        u"jntbas 名称错误：{}".format(result["created"])
    )

    bas_b_nodes = [
        node for node in (cmds.ls(type="transform") or [])
        if get_short_name(node) == "jntbas_lf_b"
    ]

    require(
        not bas_b_nodes,
        u"未选中的 jntbas_lf_b 不应该创建"
    )
    require(
        len(result["created"]) == 1,
        u"created 数量错误：{}".format(result["created"])
    )

    return u"只处理选中 jnt_* 正常"


def test_zero_move_updates_bind():
    u"""zero_* 移动后 jntbas.worldInverseMatrix 与 bindPreMatrix 同步。"""

    zero, joint, skin = create_chain("lf_move")
    result = jntbas_utils.build_jntbas()

    require(
        result["created"],
        u"jntbas 没有创建：{}".format(result)
    )

    bas = result["created"][0]
    plug = "{}.bindPreMatrix[0]".format(skin)
    before_bind = cmds.getAttr(plug)

    cmds.setAttr(zero + ".translateY", 2.0)

    after_bind = cmds.getAttr(plug)
    bas_inverse = cmds.getAttr(bas + ".worldInverseMatrix[0]")

    require(
        matrices_close(after_bind, bas_inverse),
        u"bindPreMatrix 没有跟随 jntbas 更新"
    )
    require(
        not matrices_close(before_bind, after_bind),
        u"bindPreMatrix 没有变化"
    )

    position = get_world_position(bas)

    require(
        abs(position[1] - 3.0) < 0.001,
        u"jntbas 没有跟随 zero 移动：{}".format(position)
    )

    return u"zero 移动后 bindPreMatrix 动态更新正常"


def test_existing_connection_is_skipped():
    u"""bindPreMatrix 已有其他连接时不覆盖，记录冲突。"""

    zero, joint, skin = create_chain("lf_conflict")
    plug = "{}.bindPreMatrix[0]".format(skin)

    mult = cmds.createNode("multMatrix")
    cmds.connectAttr(mult + ".matrixSum", plug)

    result = jntbas_utils.build_jntbas([joint])

    require(
        len(result["conflicts"]) == 1,
        u"冲突数量错误：{}".format(result["conflicts"])
    )
    require(
        not result["linked"],
        u"不应建立新的 bindPreMatrix 连接"
    )

    sources = cmds.listConnections(
        plug,
        source=True,
        destination=False,
        plugs=True
    ) or []

    require(
        any(source.endswith("multMatrix1.matrixSum") for source in sources),
        u"原连接被覆盖：{}".format(sources)
    )

    return u"已有 bindPreMatrix 连接被正确跳过"


def test_no_zero_is_skipped():
    u"""没有 zero_* 父级的 jnt_* 被跳过。"""

    joint = cmds.createNode(
        "joint",
        name="jnt_no_zero"
    )
    cmds.setAttr(
        joint + ".translate",
        2.0,
        0.0,
        0.0,
        type="double3"
    )
    sphere = cmds.polySphere(
        name="muzi_jntbas_no_zero_mesh",
        radius=0.5
    )[0]
    skin = cmds.skinCluster(joint, sphere)[0]

    result = jntbas_utils.build_jntbas()

    require(
        any(
            item["joint"].endswith("jnt_no_zero")
            for item in result["skipped"]
        ),
        u"没有 zero 的骨骼没有被跳过：{}".format(result["skipped"])
    )
    bas_nodes = [
        node for node in (cmds.ls(type="transform") or [])
        if get_short_name(node) == "jntbas_no_zero"
    ]

    require(
        not bas_nodes,
        u"没有 zero 的骨骼仍然创建了 jntbas"
    )

    return u"没有 zero_* 父级的骨骼被跳过"


# =============================================================================
# Runner
# =============================================================================

def get_test_cases():
    u"""返回测试用例列表。"""

    return [
        ("Build Single", test_build_single),
        ("Selected Only", test_selected_only),
        ("Zero Move Updates Bind", test_zero_move_updates_bind),
        ("Existing Connection", test_existing_connection_is_skipped),
        ("No Zero Skipped", test_no_zero_is_skipped),
    ]


def run():
    u"""运行 Jntbas Maya 冒烟测试。

    Returns:
        dict: ``results``、``passed``、``failed``。
    """

    print("=" * 78)
    print("Muzi Rig Tool - Jntbas Maya Smoke Test")
    print("=" * 78)

    current_namespace = cmds.namespaceInfo(
        currentNamespace=True
    ) or ":"
    results = []
    passed_count = 0
    failed_count = 0

    for name, test_function in get_test_cases():
        namespace = create_namespace()

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
            remove_namespace(namespace)

            try:
                cmds.namespace(set=current_namespace)
            except Exception:
                pass

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
