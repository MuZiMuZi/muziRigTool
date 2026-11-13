# coding=utf-8
u"""Jntbas 基础操作。

为次级控制器链里的每根 ``jnt_*`` 在 ``zero_*`` 下创建同位置的
``jntbas_*``，并把 ``jntbas.worldInverseMatrix`` 连接到对应
``skinCluster.bindPreMatrix[i]``。

目的：让父级（zero / uvpin）移动时，``bindPreMatrix`` 与
``matrix`` 保持互逆，从而消掉双倍位移；只有骨骼自己的局部运动才变形。
"""

from maya import cmds

try:
    from maya.api import OpenMaya as om2
except ImportError:
    om2 = None


def get_bare_name(node):
    u"""返回不含 Namespace 和 DAG 路径的裸名。

        和 rename_utils.get_short_name 的区别（两个都叫 short_name 容易混）：

            rename_utils.get_short_name   只去 DAG 路径
                ns:jnt_lf_arm_001  ->  ns:jnt_lf_arm_001
            get_bare_name                 连 Namespace 一起去
                ns:jnt_lf_arm_001  ->  jnt_lf_arm_001

        本模块要用这个名字生成 jntbas_ 名称，必须拿到不带 Namespace 的干净短名，
        所以单独用一个名字，不要和 rename_utils 那个混用。
        """

    return node.rsplit("|", 1)[-1].rsplit(":", 1)[-1]


def find_ancestor(node, prefix):
    u"""沿父级向上查找第一个短名以 prefix 开头的节点。

    Args:
        node (str): 起始节点。
        prefix (str): 名称前缀，例如 ``zero_``。

    Returns:
        str | None: 找到的节点 Long Path；没有时返回 None。
    """

    if not node or not cmds.objExists(node):
        return None

    current = cmds.ls(node, long=True)[0]

    while current:
        if get_bare_name(current).startswith(prefix):
            return current

        parents = cmds.listRelatives(
            current,
            parent=True,
            fullPath=True
        ) or []

        current = parents[0] if parents else None

    return None


def build_skin_index(skins=None):
    u"""一次性建立「骨骼 Long Path -> [(skinCluster, influenceIndex)]」索引。

    为什么要索引：原来的实现每查一根骨骼，都要把所有 skinCluster 的所有
    influence 遍历一遍，而且每个 influence 还要单独 ls 一次 Long Path。
    批量处理 N 根骨骼时复杂度是

        O(关节数 × skinCluster 数 × influence 数)

    一根 200 关节的角色能到十万次 Maya 调用。建一次索引后，整批查询
    都是字典查找，Long Path 也只解析一次。

    Args:
        skins (list | None): 要扫描的 skinCluster；None 表示扫全场景。

    Returns:
        dict: 键是骨骼 Long Path，值是 ``[(skinCluster, influenceIndex), ...]``。
    """

    if skins is None:
        skins = cmds.ls(type="skinCluster") or []

    index = {}
    long_cache = {}

    for skin in skins:
        influences = cmds.skinCluster(
            skin,
            query=True,
            influence=True
        ) or []

        for position, influence in enumerate(influences):
            long_name = long_cache.get(influence)

            # 同一根骨骼会出现在多个 skinCluster 里，Long Path 只解析一次。
            if long_name is None:
                matches = cmds.ls(influence, long=True) or []
                long_name = matches[0] if matches else influence
                long_cache[influence] = long_name

            index.setdefault(long_name, []).append((skin, position))

    return index


def get_skin_bindings(joint, skins=None, index=None):
    u"""返回骨骼在哪些 skinCluster 里、以及对应的 influence 索引。

    Args:
        joint (str): ``jnt_*`` 骨骼。
        skins (list | None): 可选的 skinCluster 列表；None 时扫全场景。
            只有 index 为 None 时才会用到。
        index (dict | None): 已有的 ``build_skin_index()`` 结果。
            批量处理时务必传进来，否则每根骨骼都要重建一次索引。

    Returns:
        list[tuple[str, int]]: ``(skinCluster, influenceIndex)``。
    """

    matches = cmds.ls(joint, long=True) or []

    if not matches:
        return []

    if index is None:
        index = build_skin_index(skins)

    return list(index.get(matches[0], []))


def get_bind_world_matrix(joint, skins=None, index=None):
    u"""从 ``bindPreMatrix`` 反推出骨骼绑定姿态的世界矩阵。

    如果该 bindPreMatrix 已经被连接（例如已经接过 jntbas），
    则跳过，返回 None，避免拿到当前被补偿后的值。

    Args:
        joint (str): ``jnt_*`` 骨骼。
        skins (list | None): 可选的 skinCluster 列表。
        index (dict | None): 已有的 ``build_skin_index()`` 结果；批量处理时传入。

    Returns:
        list[float] | None: 16 个浮点数的世界矩阵；取不到时返回 None。
    """

    if om2 is None:
        return None

    bindings = get_skin_bindings(joint, skins, index=index)

    # 循环变量不能叫 index：会遮蔽上面的 index 参数（索引字典）。
    for skin, influence_index in bindings:
        plug = "{}.bindPreMatrix[{}]".format(skin, influence_index)
        connections = cmds.listConnections(
            plug,
            source=True,
            destination=False,
            plugs=True
        ) or []

        if connections:
            continue

        values = cmds.getAttr(plug)

        if not values or len(values) != 16:
            continue

        bind_world = om2.MMatrix(values).inverse()

        return [float(value) for value in bind_world]

    return None


def find_jntbas_under(zero, name):
    u"""在指定 zero 下查找裸名匹配的 jntbas 关节。

    为什么不用 ``cmds.ls(name)``：短名会匹配到别的层级下的同名节点，
    同一个场景里放两套 rig 时，会把「复用旧的」和「新建的」判断反。

    Args:
        zero (str): 目标 ``zero_*`` 组。
        name (str): jntbas 的裸名。

    Returns:
        str | None: 找到时返回 Long Path；没有时返回 None。
    """

    children = cmds.listRelatives(
        zero,
        children=True,
        type="joint",
        fullPath=True
    ) or []

    for child in children:
        if get_bare_name(child) == name:
            return child

    return None


def create_jntbas(joint, zero=None, name=None, skin_index=None):
    u"""在 ``zero_*`` 下创建与 jnt 同位置的 ``jntbas_*`` 关节。

    Args:
        joint (str): ``jnt_*`` 骨骼。
        zero (str | None): 目标 zero 组；None 时自动向上查找。
        name (str | None): 名称；None 时用 ``jntbas_`` + jnt 后缀。
        skin_index (dict | None): 已有的 ``build_skin_index()`` 结果；
            批量处理时传入，避免每根骨骼重建索引。

    Returns:
        str: ``jntbas_*`` 的 Long Path。

    Raises:
        RuntimeError: 找不到 zero、名称冲突，或 jnt 不是关节。
    """

    if not joint or not cmds.objExists(joint):
        raise RuntimeError(u"骨骼不存在：{}".format(joint))

    joint = cmds.ls(joint, long=True)[0]

    if cmds.nodeType(joint) != "joint":
        raise RuntimeError(u"不是关节：{}".format(joint))

    if zero is None:
        zero = find_ancestor(joint, "zero_")

    if not zero:
        raise RuntimeError(
            u"找不到 {} 的 zero_* 父级。".format(get_bare_name(joint))
        )

    zero = cmds.ls(zero, long=True)[0]

    if not name:
        short_name = get_bare_name(joint)

        if short_name.startswith("jnt_"):
            name = "jntbas_{}".format(short_name[len("jnt_"):])
        else:
            name = "jntbas_{}".format(short_name)

    # 只认「这个 zero 下面、裸名一致」的关节。
    found = find_jntbas_under(zero, name)

    if found:
        return found

    # 同名节点在别的层级下：报清楚，不要静默拿错那个。
    existing = cmds.ls(name, long=True) or []

    if existing:
        raise RuntimeError(
            u"{} 已存在，但不在 {} 下：{}".format(
                name,
                get_bare_name(zero),
                existing[0]
            )
        )

    bind_world = get_bind_world_matrix(joint, index=skin_index)

    if bind_world is None:
        bind_world = cmds.xform(
            joint,
            query=True,
            worldSpace=True,
            matrix=True
        )

    bas = cmds.createNode(
        "joint",
        name=name,
        parent=zero
    )
    cmds.xform(
        bas,
        worldSpace=True,
        matrix=bind_world
    )

    return cmds.ls(bas, long=True)[0]


def build_jntbas(joints=None):
    u"""批量创建 jntbas，并连接对应 skinCluster 的 bindPreMatrix。

    Args:
        joints (list | None): 要处理的 ``jnt_*``；None 时扫描全场 ``jnt_*``。

    Returns:
        dict: ``created`` / ``reused`` / ``linked`` / ``conflicts`` /
        ``skipped`` / ``failed`` 统计。
    """

    if joints is None:
        candidates = [
            joint for joint in (cmds.ls(type="joint") or [])
            if get_bare_name(joint).startswith("jnt_")
        ]
    else:
        candidates = []

        for joint in joints:
            if not joint or not cmds.objExists(joint):
                continue

            if cmds.nodeType(joint) != "joint":
                continue

            candidates.append(cmds.ls(joint, long=True)[0])

    # 整批只建一次骨骼 -> skinCluster 索引。
    # 原来每根关节都要重扫所有 skinCluster，是这一批操作里最贵的地方。
    skin_index = build_skin_index()

    seen = set()
    created = []
    reused = []
    linked = []
    conflicts = []
    skipped = []
    failed = []

    for joint in candidates:
        joint = cmds.ls(joint, long=True)[0]

        if joint in seen:
            continue

        seen.add(joint)

        try:
            zero = find_ancestor(joint, "zero_")

            if not zero:
                skipped.append({
                    "joint": joint,
                    "reason": u"没有 zero_* 父级",
                })
                continue

            bindings = get_skin_bindings(joint, index=skin_index)

            if not bindings:
                skipped.append({
                    "joint": joint,
                    "reason": u"没有被任何 skinCluster 使用",
                })
                continue

            short_name = get_bare_name(joint)
            bas_name = "jntbas_{}".format(
                short_name[len("jnt_"):]
                if short_name.startswith("jnt_")
                else short_name
            )
            # 只在目标 zero 下判断是否已存在，避免别的零一 rig 的同名节点干扰统计。
            existed = find_jntbas_under(zero, bas_name) is not None
            bas = create_jntbas(
                joint,
                zero=zero,
                name=bas_name,
                skin_index=skin_index
            )

            if existed:
                reused.append(bas)
            else:
                created.append(bas)

            for skin, index in bindings:
                plug = "{}.bindPreMatrix[{}]".format(skin, index)
                existing = cmds.listConnections(
                    plug,
                    source=True,
                    destination=False,
                    plugs=True
                ) or []

                if existing:
                    already = any(
                        get_bare_name(src)
                        == "{}.worldInverseMatrix[0]".format(
                            get_bare_name(bas)
                        )
                        for src in existing
                    )

                    if already:
                        continue

                    conflicts.append({
                        "joint": joint,
                        "skin": skin,
                        "index": index,
                        "existing": existing,
                    })
                    continue

                cmds.connectAttr(
                    "{}.worldInverseMatrix[0]".format(bas),
                    plug
                )
                linked.append({
                    "joint": joint,
                    "jntbas": bas,
                    "skin": skin,
                    "index": index,
                })
        except Exception as error:
            failed.append({
                "joint": joint,
                "error": str(error),
            })

    return {
        "created": created,
        "reused": reused,
        "linked": linked,
        "conflicts": conflicts,
        "skipped": skipped,
        "failed": failed,
    }
