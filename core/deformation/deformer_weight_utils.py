# coding=utf-8
u"""变形器权重转蒙皮权重。

把变形器上已经画好的 per-vertex 权重，搬到 skinCluster 里指定的骨骼上。
典型场景：用 cluster / blendShape 做局部修型，画完权重后想改成骨骼驱动，
方便导出到不认变形器的引擎。

流程：

    读变形器权重 -> 对齐 SkinCluster 的影响列 -> 按模式混合进整张权重表
    -> 归一化 -> MFnSkinCluster.setWeights 一次写回

为什么写整张表：setWeights 只认「按 influenceObjects 列顺序的扁平数组」，
逐顶点 setAttr 在几万顶点时会慢到不可用。

变形器权重的来源分两类：

    blendShape     inputTarget[g].inputTargetGroup[t].targetWeights
    其它变形器      weightList[g].weights

lattice 的 weightList 按控制点存，长度和 mesh 顶点数对不上，会被长度检查拦下。
"""

from maya import cmds
from maya.api import OpenMaya as om
from maya.api import OpenMayaAnim as oma

from . import skin_utils
from . import weight_math
from ..common import scene_utils


def is_deformer(node):
    u"""判断节点是不是变形器。

    用 outputGeometry 属性识别，比维护类型白名单稳，
    自定义变形器（MPxDeformerNode 派生）也能认出来。
    """

    if not node or not cmds.objExists(node):
        return False

    if cmds.nodeType(node) in ("mesh", "transform"):
        return False

    try:
        return bool(cmds.attributeQuery("outputGeometry", node=node, exists=True))
    except RuntimeError:
        return False


def get_mesh_shape(mesh):
    u"""返回模型对应的 mesh shape。

    Args:
        mesh (str): transform 或 shape。

    Returns:
        str: mesh shape 的长名。

    Raises:
        RuntimeError: 节点不存在、不是网格，或一个 transform 下挂了多个 shape。
    """

    scene_utils.validate_node(mesh, u"模型")

    if cmds.nodeType(mesh) == "mesh":
        return mesh

    shapes = cmds.listRelatives(
        mesh,
        shapes=True,
        type="mesh",
        noIntermediate=True,
        fullPath=True,
    ) or []

    if not shapes:
        raise RuntimeError(u"不是网格模型，收到：{}".format(mesh))

    if len(shapes) > 1:
        raise RuntimeError(
            u"模型有多个 mesh shape，无法确定目标，收到：{}".format(shapes)
        )

    return shapes[0]


def get_vertex_count(mesh):
    u"""返回网格顶点数。"""

    shape = get_mesh_shape(mesh)

    return cmds.polyEvaluate(shape, vertex=True)


def is_deformer_of(deformer, mesh):
    u"""判断变形器是否作用于该模型。

    查询不到 deformer 列表时放行，避免因为历史节点异常把功能卡死。
    """

    deformers = cmds.deformer(mesh, query=True) or []

    if not deformers:
        return True

    deformer_long = (cmds.ls(deformer, long=True) or [deformer])[0]

    for item in deformers:
        item_long = (cmds.ls(item, long=True) or [item])[0]

        if item_long == deformer_long:
            return True

    return False


def read_deformer_weights(
    deformer,
    vertex_count=None,
    target_index=0,
    geometry_index=0,
):
    u"""读变形器的 per-vertex 权重。

    Args:
        deformer (str): 变形器节点。
        vertex_count (int): 期望的顶点数，用于校验；None 时跳过。
        target_index (int): blendShape 的 target 序号，其它变形器忽略。
        geometry_index (int): 变形器输入几何的序号，单模型时保持 0。

    Returns:
        list: 每个顶点一个权重值。

    Raises:
        RuntimeError: 节点不是变形器、读不到权重，或长度与顶点数不一致。
    """

    scene_utils.validate_node(deformer, u"变形器")

    if not is_deformer(deformer):
        raise RuntimeError(u"不是变形器节点，收到：{}".format(deformer))

    if cmds.nodeType(deformer) == "blendShape":
        plug = "{}.inputTarget[{}].inputTargetGroup[{}].targetWeights".format(
            deformer, geometry_index, target_index
        )
    else:
        plug = "{}.weightList[{}].weights".format(deformer, geometry_index)

    try:
        values = cmds.getAttr(plug)
    except (RuntimeError, ValueError):
        raise RuntimeError(
            u"读不到变形器权重，检查节点是否还有几何输入：{}".format(plug)
        ) from None

    if values is None:
        values = []

    values = _flatten_weight_values(values)

    if vertex_count is not None and len(values) != vertex_count:
        raise RuntimeError(
            u"变形器权重数量与顶点数不一致，收到：{} 个权重，{} 个顶点。"
            u"lattice 这类按控制点存权重的变形器不能直接转换。".format(
                len(values), vertex_count
            )
        )

    return values


def get_influence_names(skin_cluster):
    u"""按 weightList 的列顺序返回影响骨骼的全名。

    列顺序以 MFnSkinCluster.influenceObjects 为准，
    不要用 cmds.skinCluster(q=True) 的名字顺序去猜。
    """

    skin_fn = oma.MFnSkinCluster(_to_mobject(skin_cluster))

    return [path.fullPathName() for path in skin_fn.influenceObjects()]


def find_influence_index(skin_cluster, joint):
    u"""返回关节在 weightList 里的列号。

    Raises:
        RuntimeError: 关节不在影响列表里。
    """

    joint_long = _long_name(joint)

    for index, name in enumerate(get_influence_names(skin_cluster)):
        if name == joint_long:
            return index

    raise RuntimeError(
        u"关节不在 SkinCluster 的影响列表里，收到：{}".format(joint)
    )


def read_skin_matrix(shape, skin_cluster, vertex_count):
    u"""读出 SkinCluster 的整张权重表。

    Returns:
        tuple: (rows, influence_count)
    """

    dag = _to_dag_path(shape)
    skin_fn = oma.MFnSkinCluster(_to_mobject(skin_cluster))
    component = _all_vertices_component(vertex_count)

    result = skin_fn.getWeights(dag, component)

    # Maya 各版本返回过 MDoubleArray 或 (MDoubleArray, influenceCount)
    if isinstance(result, tuple):
        weights, influence_count = result
    else:
        weights = result
        influence_count = len(skin_fn.influenceObjects())

    rows = weight_math.to_rows(list(weights), vertex_count, influence_count)

    return rows, influence_count


def write_skin_matrix(shape, skin_cluster, rows, influence_count):
    u"""一次写回整张权重表。

    传 normalize=False：调用方已经自己归一化过，
    再让 Maya 归一化会和锁定权重、Hold Weights 打架。
    """

    dag = _to_dag_path(shape)
    skin_fn = oma.MFnSkinCluster(_to_mobject(skin_cluster))
    component = _all_vertices_component(len(rows))

    skin_fn.setWeights(
        dag,
        component,
        om.MIntArray(list(range(influence_count))),
        om.MDoubleArray(weight_math.to_flat(rows)),
        False,
    )


def apply_deformer_weights(
    mesh,
    deformer,
    joint,
    mode=weight_math.mode_replace,
    scale=1.0,
    normalize=True,
    target_index=0,
    geometry_index=0,
    add_influence=True,
    remove_deformer=False,
):
    u"""把一个变形器的权重写到一根骨骼上。

    Args:
        mesh (str): 带 SkinCluster 的模型。
        deformer (str): 权重来源。
        joint (str): 接收权重的骨骼。
        mode (str): 覆盖 / 叠加 / 相乘，见 weight_math.mode_list。
        scale (float): 写入前的缩放，用于整体减弱影响。
        normalize (bool): 写入后是否归一化每一行。
        target_index (int): blendShape 的 target 序号。
        geometry_index (int): 变形器输入几何序号。
        add_influence (bool): 骨骼不在影响列表时是否自动添加。
        remove_deformer (bool): 写完是否删除变形器。

    Returns:
        dict: 本次转换的统计信息，含 zero_rows（归一化失败的顶点）。

    Raises:
        RuntimeError: 模型没有蒙皮、变形器不作用于模型、目标不是关节等。
    """

    shape = get_mesh_shape(mesh)

    skin_cluster = skin_utils.find_skin_cluster(shape)

    if not skin_cluster:
        raise RuntimeError(u"模型没有 SkinCluster，收到：{}".format(mesh))

    if not is_deformer(deformer):
        raise RuntimeError(u"不是变形器节点，收到：{}".format(deformer))

    if not is_deformer_of(deformer, mesh):
        raise RuntimeError(
            u"变形器不作用于该模型，收到：{} / {}".format(deformer, mesh)
        )

    scene_utils.validate_node(joint, u"目标骨骼")

    if cmds.nodeType(joint) != "joint":
        raise RuntimeError(u"目标不是关节，收到：{}".format(joint))

    vertex_count = get_vertex_count(shape)

    values = read_deformer_weights(
        deformer,
        vertex_count,
        target_index=target_index,
        geometry_index=geometry_index,
    )

    cmds.undoInfo(openChunk=True, chunkName="DeformerWeightToSkin")

    try:
        if _long_name(joint) not in get_influence_names(skin_cluster):
            if not add_influence:
                raise RuntimeError(
                    u"关节不在 SkinCluster 的影响列表里，收到：{}".format(joint)
                )

            cmds.skinCluster(
                skin_cluster,
                edit=True,
                addInfluence=joint,
                weight=0.0,
            )

        column = find_influence_index(skin_cluster, joint)

        rows, influence_count = read_skin_matrix(
            shape, skin_cluster, vertex_count
        )

        weight_math.apply_column(rows, column, values, mode, scale)

        zero_rows = []

        if normalize:
            zero_rows = weight_math.normalize_rows(rows)

        write_skin_matrix(shape, skin_cluster, rows, influence_count)

        if remove_deformer:
            cmds.delete(deformer)

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.dgdirty(shape)

    return {
        "mesh": mesh,
        "shape": shape,
        "skin_cluster": skin_cluster,
        "deformer": deformer,
        "joint": joint,
        "column": column,
        "vertex_count": vertex_count,
        "zero_rows": zero_rows,
        "removed": bool(remove_deformer),
    }


def apply_deformer_weights_batch(mesh, deformers, joints, **kwargs):
    u"""按顺序把多个变形器分别写到多根骨骼上。

    变形器与关节必须一一对应；数量不一致直接报错，
    避免默默写错骨骼。

    Returns:
        list: 每个 (变形器, 关节) 的统计信息。
    """

    pairs = weight_math.pair_names(list(deformers), list(joints))

    results = []

    cmds.undoInfo(openChunk=True, chunkName="DeformerWeightToSkinBatch")

    try:
        for deformer, joint in pairs:
            results.append(
                apply_deformer_weights(mesh, deformer, joint, **kwargs)
            )
    finally:
        cmds.undoInfo(closeChunk=True)

    return results


# ----------------------------------------------------------------------
# 内部
# ----------------------------------------------------------------------

def _flatten_weight_values(values):
    u"""把 getAttr 的返回值摊平成 float 列表。

    weightList[0].weights 是 mult 子属性，getAttr 返回 [(值,), ...]；
    blendShape 的 targetWeights 是普通 doubleArray，返回 [值, ...]。
    两种都要能读。
    """

    flattened = []

    for value in values:
        if isinstance(value, (tuple, list)):
            flattened.extend(float(item) for item in value)
        else:
            flattened.append(float(value))

    return flattened


def _long_name(node):
    u"""返回节点的全名，取不到就原样返回。"""

    names = cmds.ls(node, long=True) or []

    return names[0] if names else node


def _to_mobject(node):
    u"""节点名转 MObject。"""

    selection = om.MSelectionList()
    selection.add(_long_name(node))

    return selection.getDependNode(0)


def _to_dag_path(node):
    u"""节点名转 MDagPath。"""

    selection = om.MSelectionList()
    selection.add(_long_name(node))

    return selection.getDagPath(0)


def _all_vertices_component(vertex_count):
    u"""构造包含全部顶点的组件。"""

    component_fn = om.MFnSingleIndexedComponent()
    component = component_fn.create(om.MFn.kMeshVertComponent)
    component_fn.addElements(list(range(vertex_count)))

    return component
