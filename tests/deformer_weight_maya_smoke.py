# coding=utf-8
u"""变形器权重转蒙皮的真机冒烟测试。

文件名不是 test_ 开头，unittest discover 不会收集它，
因为它依赖 Maya，只能在 mayapy 里跑：

    "C:\\Program Files\\Autodesk\\Maya2023\\bin\\mayapy.exe" ^
        tests\\deformer_weight_maya_smoke.py

覆盖：单骨骼写入、批量配对、自动加影响、归一化、错误输入。
"""

import os
import sys


SCRIPTS_DIR = os.path.dirname(
    os.path.dirname(
        os.path.dirname(os.path.abspath(__file__))
    )
)

if SCRIPTS_DIR not in sys.path:
    sys.path.insert(0, SCRIPTS_DIR)


import maya.standalone

maya.standalone.initialize(name="python")

from maya import cmds

from muziRigTool.core.deformation import deformer_weight_utils


def set_vertex_weights(deformer, values):
    u"""逐索引写 per-vertex 权重。

    weightList[0].weights 是 mult 子属性，不能整段 setAttr。
    """

    for index, value in enumerate(values):
        cmds.setAttr(
            "{}.weightList[0].weights[{}]".format(deformer, index),
            value
        )


def build_scene():
    u"""建一个带蒙皮和 cluster 的方块，返回 (mesh, skin, cluster, joints)。"""

    cmds.file(new=True, force=True)

    mesh = cmds.polyCube(
        name="mesh_md_body_main_001",
        width=4,
        height=8,
        depth=4,
        sx=3,
        sy=4,
        sz=3,
    )[0]

    root = cmds.joint(name="jnt_md_root_bind_001", position=(0, -4, 0))
    tip = cmds.joint(name="jnt_md_tip_bind_001", position=(0, 4, 0))

    skin = cmds.skinCluster(
        root,
        tip,
        mesh,
        toSelectedBones=True,
        normalizeWeights=1,
    )[0]

    cmds.select(clear=True)

    cluster = cmds.cluster(mesh, name="cluster_md_body_main_001")[0]

    vertex_count = cmds.polyEvaluate(mesh, vertex=True)

    # 前一半顶点权重 1，后一半 0，方便按索引断言
    values = [
        1.0 if index < vertex_count // 2 else 0.0
        for index in range(vertex_count)
    ]

    set_vertex_weights(cluster, values)

    return mesh, skin, cluster, [root, tip], values


def read_matrix(skin, mesh, vertex_count):
    u"""用 MFnSkinCluster.getWeights 读回 dense 矩阵。

    不用 getAttr("weightList[v].weights")：写入 0 权重后，
    Maya 会把该影响从顶点的 weightList 里剔除，行长度变成可变的，
    按列取会越界。getWeights 永远返回「顶点数 × 影响数」的完整矩阵。
    """

    shape = deformer_weight_utils.get_mesh_shape(mesh)

    rows, _ = deformer_weight_utils.read_skin_matrix(
        shape, skin, vertex_count
    )

    return rows


def read_column(skin, mesh, vertex_count, column):
    u"""读出某一列的影响权重。"""

    return [row[column] for row in read_matrix(skin, mesh, vertex_count)]


def check_read_length():
    u"""读变形器权重：长度应与顶点数一致，值应与写入一致。"""

    mesh, skin, cluster, joints, expected = build_scene()

    vertex_count = cmds.polyEvaluate(mesh, vertex=True)
    values = deformer_weight_utils.read_deformer_weights(cluster, vertex_count)

    assert len(values) == vertex_count, (
        u"权重长度不对：{} != {}".format(len(values), vertex_count)
    )

    assert values == expected, u"读回的 cluster 权重与写入不一致"

    print(u"[ok] 读取变形器权重：{} 个顶点".format(vertex_count))


def check_replace_without_normalize():
    u"""覆盖模式且不归一化时，权重应逐值相等。"""

    mesh, skin, cluster, joints, expected = build_scene()

    target = joints[1]

    result = deformer_weight_utils.apply_deformer_weights(
        mesh,
        cluster,
        target,
        mode="replace",
        normalize=False,
    )

    actual = read_column(
        skin,
        mesh,
        result["vertex_count"],
        result["column"],
    )

    for index, (got, want) in enumerate(zip(actual, expected)):
        assert abs(got - want) < 1e-5, (
            u"顶点 {} 权重不对：{} != {}".format(index, got, want)
        )

    print(u"[ok] 覆盖写入：{} 个顶点逐值一致".format(len(actual)))


def check_normalize_keeps_row_sum():
    u"""归一化后每行权重和应为 1。"""

    mesh, skin, cluster, joints, expected = build_scene()

    result = deformer_weight_utils.apply_deformer_weights(
        mesh,
        cluster,
        joints[1],
        mode="add",
        scale=0.5,
        normalize=True,
    )

    vertex_count = result["vertex_count"]
    influence_count = len(
        cmds.skinCluster(skin, query=True, influence=True) or []
    )

    rows = read_matrix(skin, mesh, vertex_count)

    for vertex, row in enumerate(rows):
        total = sum(row)

        assert abs(total - 1.0) < 1e-4, (
            u"顶点 {} 行和不是 1：{}".format(vertex, total)
        )

        assert len(row) == influence_count, u"影响列数不一致"

    assert result["zero_rows"] == [], u"不应出现全零行"

    print(u"[ok] 归一化：{} 个顶点行和为 1".format(vertex_count))


def check_auto_add_influence():
    u"""目标骨骼不在影响列表时应自动加入。"""

    mesh, skin, cluster, joints, expected = build_scene()

    extra = cmds.joint(name="jnt_md_extra_bind_001", position=(2, 0, 0))

    before = cmds.skinCluster(skin, query=True, influence=True) or []
    assert extra not in before, u"测试前提不成立：新骨骼已在影响列表里"

    result = deformer_weight_utils.apply_deformer_weights(
        mesh,
        cluster,
        extra,
        mode="replace",
        normalize=False,
    )

    after = cmds.skinCluster(skin, query=True, influence=True) or []

    assert len(after) == len(before) + 1, (
        u"影响数量没有增加：{} -> {}".format(len(before), len(after))
    )

    actual = read_column(skin, mesh, result["vertex_count"], result["column"])

    for got, want in zip(actual, expected):
        assert abs(got - want) < 1e-5, u"自动加影响后权重不对"

    print(u"[ok] 自动添加影响：{} -> {}".format(len(before), len(after)))


def check_batch_pairing():
    u"""两个变形器按顺序写到两根骨骼。"""

    cmds.file(new=True, force=True)

    mesh = cmds.polyCube(name="mesh_md_body_main_001", sx=3, sy=3, sz=3)[0]

    root = cmds.joint(name="jnt_md_root_bind_001", position=(0, -4, 0))
    tip = cmds.joint(name="jnt_md_tip_bind_001", position=(0, 4, 0))

    skin = cmds.skinCluster(
        root, tip, mesh, toSelectedBones=True, normalizeWeights=1
    )[0]

    cmds.select(clear=True)

    cluster_a = cmds.cluster(mesh, name="cluster_md_a_main_001")[0]
    cluster_b = cmds.cluster(mesh, name="cluster_md_b_main_001")[0]

    vertex_count = cmds.polyEvaluate(mesh, vertex=True)

    values_a = [1.0] * vertex_count
    values_b = [0.25] * vertex_count

    set_vertex_weights(cluster_a, values_a)
    set_vertex_weights(cluster_b, values_b)

    results = deformer_weight_utils.apply_deformer_weights_batch(
        mesh,
        [cluster_a, cluster_b],
        [root, tip],
        mode="replace",
        normalize=False,
    )

    assert len(results) == 2, u"批量结果数量不对"

    root_values = read_column(skin, mesh, vertex_count, results[0]["column"])
    tip_values = read_column(skin, mesh, vertex_count, results[1]["column"])

    for got in root_values:
        assert abs(got - 1.0) < 1e-5, u"根骨骼权重不对"

    for got in tip_values:
        assert abs(got - 0.25) < 1e-5, u"末端骨骼权重不对"

    print(u"[ok] 批量配对：2 个变形器 -> 2 根骨骼")


def check_remove_deformer():
    u"""勾选删除后，变形器应消失。"""

    mesh, skin, cluster, joints, expected = build_scene()

    deformer_weight_utils.apply_deformer_weights(
        mesh,
        cluster,
        joints[1],
        mode="replace",
        normalize=False,
        remove_deformer=True,
    )

    assert not cmds.objExists(cluster), u"变形器没有被删除"

    print(u"[ok] 删除变形器")


def check_bad_input():
    u"""错误输入要抛 RuntimeError，而不是静默写坏权重。"""

    mesh, skin, cluster, joints, expected = build_scene()

    # 骨骼不在场景里
    try:
        deformer_weight_utils.apply_deformer_weights(
            mesh, cluster, "jnt_md_missing_bind_001"
        )
    except RuntimeError:
        pass
    else:
        raise AssertionError(u"不存在的骨骼没有报错")

    # 变形器不作用于该模型
    other = cmds.polyCube(name="mesh_md_other_main_001")[0]
    cmds.select(clear=True)
    other_cluster = cmds.cluster(other, name="cluster_md_other_main_001")[0]

    try:
        deformer_weight_utils.apply_deformer_weights(
            mesh, other_cluster, joints[1]
        )
    except RuntimeError:
        pass
    else:
        raise AssertionError(u"跨模型的变形器没有报错")

    print(u"[ok] 错误输入被拦下")


def main():
    u"""依次跑所有检查。"""

    check_read_length()
    check_replace_without_normalize()
    check_normalize_keeps_row_sum()
    check_auto_add_influence()
    check_batch_pairing()
    check_remove_deformer()
    check_bad_input()

    print(u"\n全部通过")


if __name__ == "__main__":
    main()
