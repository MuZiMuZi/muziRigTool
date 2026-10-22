# coding=utf-8
u"""蒙皮操作。

    查询      SkinCluster、影响骨骼
    复制      把源模型的权重复制到多个目标
    归一化    强制归一化权重
    选择      选中所有影响骨骼

复制权重的流程：

    源 SkinCluster -> 取影响骨骼 -> 删目标旧 SkinCluster
    -> 用同一组骨骼重建 -> copySkinWeights(closestPoint, OneToOne)

旧库还有权重文件的导入导出（XML / JSON），这里是精简版，只做核心操作。
"""

import maya.mel as mel

from maya import cmds


def find_skin_cluster(geometry):
    u"""返回模型对应的 SkinCluster；没有则返回 None。

    先用 Maya 自带的 findRelatedSkinCluster，
    查不到再从 history 里兜底。

    Args:
        geometry (str): 模型 transform 或 shape。

    Returns:
        str | None: skinCluster 名。
    """

    if not geometry or not cmds.objExists(geometry):
        return None

    try:
        skin_cluster = mel.eval(
            'findRelatedSkinCluster("{}")'.format(geometry)
        )
    except Exception:
        skin_cluster = None

    if skin_cluster:
        return skin_cluster

    history = cmds.listHistory(geometry) or []
    skin_clusters = cmds.ls(history, type="skinCluster") or []

    if skin_clusters:
        return skin_clusters[0]

    return None


def get_influences(geometry_or_skin_cluster):
    u"""返回影响骨骼列表。

    Args:
        geometry_or_skin_cluster (str): 模型或 skinCluster。

    Returns:
        list: 影响骨骼名。
    """

    if not cmds.objExists(geometry_or_skin_cluster):
        return []

    skin_cluster = geometry_or_skin_cluster

    if cmds.nodeType(skin_cluster) != "skinCluster":
        skin_cluster = find_skin_cluster(geometry_or_skin_cluster)

    if not skin_cluster:
        return []

    influences = cmds.skinCluster(
        skin_cluster,
        query=True,
        influence=True
    )

    return influences or []


def bind_skin(joints, geometry):
    u"""给模型绑定蒙皮。

    Args:
        joints (list): 骨骼列表。
        geometry (str): 模型。

    Returns:
        str: 新建的 skinCluster。

    Raises:
        RuntimeError: 骨骼或模型无效。
    """

    if not joints:
        raise RuntimeError(u"至少需要一个骨骼。")

    if not geometry or not cmds.objExists(geometry):
        raise RuntimeError(u"模型无效：{}".format(geometry))

    skin_cluster = cmds.skinCluster(
        joints,
        geometry,
        toSelectedBones=True,
        normalizeWeights=1
    )[0]

    return skin_cluster


def copy_skin_weights(source, targets):
    u"""把源模型的权重复制给多个目标。

    Args:
        source (str): 源模型。
        targets (list): 目标模型列表。

    Returns:
        list: 新建的目标 SkinCluster。

    Raises:
        RuntimeError: 源模型没有蒙皮或没有影响骨骼。
    """

    source_skin = find_skin_cluster(source)

    if not source_skin:
        raise RuntimeError(u"源模型没有 SkinCluster：{}".format(source))

    influences = get_influences(source_skin)

    if not influences:
        raise RuntimeError(u"源 SkinCluster 没有影响骨骼。")

    results = []

    cmds.undoInfo(openChunk=True, chunkName="CopySkinWeights")

    try:
        for target in targets:
            if not cmds.objExists(target):
                cmds.warning(u"目标不存在，跳过：{}".format(target))
                continue

            # 删掉目标旧蒙皮，避免两套权重叠加
            target_skin = find_skin_cluster(target)

            if target_skin:
                cmds.delete(target_skin)

            target_skin = cmds.skinCluster(
                influences,
                target,
                toSelectedBones=True,
                normalizeWeights=1
            )[0]

            cmds.copySkinWeights(
                sourceSkin=source_skin,
                destinationSkin=target_skin,
                noMirror=True,
                surfaceAssociation="closestPoint",
                influenceAssociation="oneToOne"
            )

            results.append(target_skin)
    finally:
        cmds.undoInfo(closeChunk=True)

    return results


def normalize_skin_weights(geometry_or_skin_cluster):
    u"""强制归一化一个 SkinCluster。

    Args:
        geometry_or_skin_cluster (str): 模型或 skinCluster。

    Returns:
        bool: 归一化成功返回 True。
    """

    if not cmds.objExists(geometry_or_skin_cluster):
        return False

    skin_cluster = geometry_or_skin_cluster

    if cmds.nodeType(skin_cluster) != "skinCluster":
        skin_cluster = find_skin_cluster(geometry_or_skin_cluster)

    if not skin_cluster:
        return False

    cmds.skinCluster(
        skin_cluster,
        edit=True,
        forceNormalizeWeights=True
    )

    return True


def select_influences(geometries):
    u"""选中这些模型的全部影响骨骼。

    Args:
        geometries (list): 模型列表。

    Returns:
        list: 选中的骨骼。
    """

    influences = []

    for geometry in geometries:
        for influence in get_influences(geometry):
            if influence not in influences:
                influences.append(influence)

    if influences:
        cmds.select(influences, replace=True)

    return influences
