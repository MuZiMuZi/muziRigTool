# coding=utf-8
u"""场景清理与查询。

六类清理：

    空组     没有 shape、没有子级的 transform
    历史     Construction History
    冻结     makeIdentity
    解锁     标准 transform 通道
    Pivot    几何中心
    Unknown  未知节点

安全保护（命中即跳过）：

    默认相机、Reference 节点、动画曲线输入、约束输入、Deformer 历史

所有批量操作都包在 undo_chunk 里，一次 Ctrl+Z 回退整批。
"""

import functools

from maya import cmds


anim_curve_types = [
    "animCurveTA",
    "animCurveTL",
    "animCurveTT",
    "animCurveTU",
]

constraint_types = [
    "parentConstraint",
    "pointConstraint",
    "orientConstraint",
    "scaleConstraint",
    "aimConstraint",
    "poleVectorConstraint",
]

rig_history_types = [
    "skinCluster",
    "blendShape",
    "cluster",
    "wire",
    "ffd",
    "lattice",
    "nonLinear",
    "deltaMush",
    "tension",
    "wrap",
    "proximityWrap",
]

default_cameras = [
    "persp",
    "top",
    "front",
    "side",
]


def undo_chunk(function):
    u"""把一次批量清理包进一个 Undo Chunk。"""

    @functools.wraps(function)
    def wrapper(*args, **kwargs):
        cmds.undoInfo(openChunk=True)

        try:
            return function(*args, **kwargs)
        finally:
            cmds.undoInfo(closeChunk=True)

    return wrapper


# ----------------------------------------------------------------------
# 查询
# ----------------------------------------------------------------------

def existing_nodes(nodes):
    u"""过滤掉场景里不存在的节点，并统一成长名。

    Args:
        nodes (list): 节点名列表。

    Returns:
        list: 存在节点的长名，去重。
    """

    result = []

    for node in nodes or []:
        if not cmds.objExists(node):
            continue

        long_names = cmds.ls(node, long=True) or []

        if not long_names:
            continue

        long_name = long_names[0]

        if long_name not in result:
            result.append(long_name)

    return result


def all_transform_nodes():
    u"""返回场景里所有 transform 的长名。"""

    return cmds.ls(transforms=True, long=True) or []


def sort_child_first(nodes):
    u"""按 DAG 深度从深到浅排序，先处理子级。"""

    unique = []

    for node in nodes:
        if node not in unique:
            unique.append(node)

    unique.sort(key=lambda node: node.count("|"), reverse=True)

    return unique


def is_default_camera(node):
    u"""判断是否为 Maya 默认四个相机。"""

    return node.split("|")[-1] in default_cameras


def is_referenced(node):
    u"""判断节点是否来自 Reference。"""

    try:
        return bool(cmds.referenceQuery(node, isNodeReferenced=True))
    except Exception:
        return False


# ----------------------------------------------------------------------
# 安全判断
# ----------------------------------------------------------------------

def has_incoming_animation(node):
    u"""判断是否有动画曲线输入。"""

    for anim_type in anim_curve_types:
        connections = cmds.listConnections(
            node,
            source=True,
            destination=False,
            type=anim_type
        ) or []

        if connections:
            return True

    return False


def has_constraint(node):
    u"""判断是否有常见约束输入。"""

    connections = cmds.listConnections(
        node,
        source=True,
        destination=False
    ) or []

    for connection in connections:
        try:
            node_type = cmds.nodeType(connection)
        except Exception:
            continue

        if node_type in constraint_types:
            return True

    return False


def has_rig_history(node):
    u"""判断历史里是否有受保护的 Deformer。"""

    history = cmds.listHistory(node, pruneDagObjects=True) or []

    for history_node in history:
        try:
            node_type = cmds.nodeType(history_node)
        except Exception:
            continue

        if node_type in rig_history_types:
            return True

        # 没列进白名单的 geometryFilter 也按 Deformer 保护
        try:
            if cmds.objectType(history_node, isAType="geometryFilter"):
                return True
        except Exception:
            pass

    return False


def can_modify_transform(node):
    u"""判断节点是否允许进入 transform 类清理。"""

    if not cmds.objExists(node):
        return False

    if is_default_camera(node):
        return False

    if is_referenced(node):
        return False

    if cmds.nodeType(node) != "transform":
        return False

    return True


# ----------------------------------------------------------------------
# 清理
# ----------------------------------------------------------------------

def _collect_parent_candidates(nodes):
    u"""收集候选节点的所有父级。

    删掉子级后，原本非空的父级可能变成空组，所以要一起检查。
    """

    candidates = []

    for node in nodes:
        parents = cmds.listRelatives(node, parent=True, fullPath=True) or []

        while parents:
            parent = parents[0]

            if parent not in candidates:
                candidates.append(parent)

            parents = cmds.listRelatives(parent, parent=True, fullPath=True) or []

    return candidates


def delete_empty_groups(nodes=None):
    u"""递归删除空 transform 组。

    Args:
        nodes (list | None): 候选范围；None 表示全场景。

    Returns:
        int: 删除数量。
    """

    if nodes is None:
        candidates = all_transform_nodes()
    else:
        candidates = existing_nodes(nodes)

        for parent in _collect_parent_candidates(candidates):
            if parent not in candidates:
                candidates.append(parent)

    deleted_count = 0
    changed = True

    # 子级删掉后父级可能变空，所以循环到不再变化为止
    while changed:
        changed = False

        current = [node for node in candidates if cmds.objExists(node)]
        current = sort_child_first(current)

        for node in current:
            if not can_modify_transform(node):
                continue

            shapes = cmds.listRelatives(node, shapes=True, fullPath=True) or []
            children = cmds.listRelatives(node, children=True, fullPath=True) or []

            if shapes or children:
                continue

            try:
                cmds.delete(node)
                deleted_count += 1
                changed = True
            except Exception as error:
                cmds.warning(u"无法删除空组 {}：{}".format(node, error))

    return deleted_count


def delete_history(nodes):
    u"""删除安全范围内的 Construction History。

    Returns:
        tuple: (processed, skipped)
    """

    deleted_count = 0
    skipped_count = 0

    for node in existing_nodes(nodes):
        if not can_modify_transform(node):
            skipped_count += 1
            continue

        shapes = cmds.listRelatives(
            node, shapes=True, noIntermediate=True, fullPath=True
        ) or []

        if not shapes:
            continue

        # Deformer 比建模历史重要，发现就整个跳过
        if has_rig_history(node):
            skipped_count += 1
            continue

        try:
            cmds.delete(node, constructionHistory=True)
            deleted_count += 1
        except Exception as error:
            cmds.warning(u"无法删除历史 {}：{}".format(node, error))

    return deleted_count, skipped_count


def freeze_transformations(nodes):
    u"""Freeze 安全范围内的 transform。

    有动画、约束或 Deformer 的节点一律跳过。

    Returns:
        tuple: (processed, skipped)
    """

    frozen_count = 0
    skipped_count = 0

    for node in existing_nodes(nodes):
        if not can_modify_transform(node):
            skipped_count += 1
            continue

        if has_incoming_animation(node):
            skipped_count += 1
            continue

        if has_constraint(node):
            skipped_count += 1
            continue

        if has_rig_history(node):
            skipped_count += 1
            continue

        try:
            cmds.makeIdentity(
                node,
                apply=True,
                translate=True,
                rotate=True,
                scale=True,
                normal=False,
                preserveNormals=True
            )
            frozen_count += 1
        except Exception as error:
            cmds.warning(u"无法冻结变换 {}：{}".format(node, error))

    return frozen_count, skipped_count


def unlock_and_show_attributes(nodes):
    u"""解锁并显示标准 transform 通道。

    Returns:
        int: 修改的属性数量。
    """

    attrs = ["tx", "ty", "tz", "rx", "ry", "rz", "sx", "sy", "sz", "v"]
    changed_count = 0

    for node in existing_nodes(nodes):
        if is_referenced(node):
            continue

        for attr in attrs:
            if not cmds.attributeQuery(attr, node=node, exists=True):
                continue

            plug = "{}.{}".format(node, attr)

            try:
                cmds.setAttr(plug, lock=False)
                cmds.setAttr(plug, keyable=True)
                changed_count += 1
            except Exception:
                pass

    return changed_count


def center_pivot(nodes):
    u"""把带 shape 的 transform 的 pivot 居中。

    Returns:
        int: 处理数量。
    """

    centered_count = 0

    for node in existing_nodes(nodes):
        if not can_modify_transform(node):
            continue

        shapes = cmds.listRelatives(
            node, shapes=True, noIntermediate=True, fullPath=True
        ) or []

        if not shapes:
            continue

        try:
            cmds.xform(node, centerPivots=True)
            centered_count += 1
        except Exception:
            pass

    return centered_count


def delete_unknown_nodes(nodes=None):
    u"""删除非 Reference 的 unknown 节点。

    Args:
        nodes (list | None): 候选范围；None 表示全场景。

    Returns:
        int: 删除数量。
    """

    if nodes is None:
        unknown_nodes = cmds.ls(type="unknown", long=True) or []
    else:
        unknown_nodes = [
            node for node in existing_nodes(nodes)
            if cmds.nodeType(node) == "unknown"
        ]

    deleted_count = 0

    for node in unknown_nodes:
        if is_referenced(node):
            continue

        try:
            cmds.delete(node)
            deleted_count += 1
        except Exception as error:
            cmds.warning(u"无法删除 unknown 节点 {}：{}".format(node, error))

    return deleted_count


@undo_chunk
def run_cleanup(
    nodes,
    selected_only=True,
    delete_empty=True,
    delete_history_enabled=False,
    freeze_enabled=False,
    unlock_enabled=False,
    center_pivot_enabled=False,
    delete_unknown_enabled=True
):
    u"""按配置执行一次安全清理。

    Args:
        nodes (list): 处理范围。
        selected_only (bool): 是否只处理当前选择。
        delete_empty (bool): 删除空组。
        delete_history_enabled (bool): 删除历史。
        freeze_enabled (bool): 冻结变换。
        unlock_enabled (bool): 解锁通道。
        center_pivot_enabled (bool): 居中 pivot。
        delete_unknown_enabled (bool): 删除 unknown。

    Returns:
        dict: 各类清理的统计结果。
    """

    result = {}

    if delete_empty:
        # 空组和 unknown 可以全场景扫描，其他操作只针对明确传入的节点
        empty_scope = nodes if selected_only else None
        result["empty_groups"] = delete_empty_groups(empty_scope)

    if delete_history_enabled:
        deleted_count, skipped_count = delete_history(nodes)
        result["history"] = {
            "processed": deleted_count,
            "skipped": skipped_count,
        }

    if freeze_enabled:
        frozen_count, skipped_count = freeze_transformations(nodes)
        result["freeze"] = {
            "processed": frozen_count,
            "skipped": skipped_count,
        }

    if unlock_enabled:
        result["attributes"] = unlock_and_show_attributes(nodes)

    if center_pivot_enabled:
        result["pivot"] = center_pivot(nodes)

    if delete_unknown_enabled:
        unknown_scope = nodes if selected_only else None
        result["unknown"] = delete_unknown_nodes(unknown_scope)

    return result
