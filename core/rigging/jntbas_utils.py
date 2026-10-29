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


def get_short_name(node):
    u"""返回不含 Namespace 和 DAG 路径的短名。"""

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
        if get_short_name(current).startswith(prefix):
            return current

        parents = cmds.listRelatives(
            current,
            parent=True,
            fullPath=True
        ) or []

        current = parents[0] if parents else None

    return None


def get_skin_bindings(joint, skins=None):
    u"""返回骨骼在哪些 skinCluster 里、以及对应的 influence 索引。

    Args:
        joint (str): ``jnt_*`` 骨骼。
        skins (list | None): 可选的 skinCluster 列表；None 时扫全场景。

    Returns:
        list[tuple[str, int]]: ``(skinCluster, influenceIndex)``。
    """

    joint_long = cmds.ls(joint, long=True)[0]
    bindings = []

    if skins is None:
        skins = cmds.ls(type="skinCluster") or []

    for skin in skins:
        influences = cmds.skinCluster(
            skin,
            query=True,
            influence=True
        ) or []

        for index, influence in enumerate(influences):
            matches = cmds.ls(influence, long=True) or []

            if matches and matches[0] == joint_long:
                bindings.append((skin, index))
                break

    return bindings


def get_bind_world_matrix(joint, skins=None):
    u"""从 ``bindPreMatrix`` 反推出骨骼绑定姿态的世界矩阵。

    如果该 bindPreMatrix 已经被连接（例如已经接过 jntbas），
    则跳过，返回 None，避免拿到当前被补偿后的值。

    Args:
        joint (str): ``jnt_*`` 骨骼。
        skins (list | None): 可选的 skinCluster 列表。

    Returns:
        list[float] | None: 16 个浮点数的世界矩阵；取不到时返回 None。
    """

    if om2 is None:
        return None

    bindings = get_skin_bindings(joint, skins)

    for skin, index in bindings:
        plug = "{}.bindPreMatrix[{}]".format(skin, index)
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


def create_jntbas(joint, zero=None, name=None):
    u"""在 ``zero_*`` 下创建与 jnt 同位置的 ``jntbas_*`` 关节。

    Args:
        joint (str): ``jnt_*`` 骨骼。
        zero (str | None): 目标 zero 组；None 时自动向上查找。
        name (str | None): 名称；None 时用 ``jntbas_`` + jnt 后缀。

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
            u"找不到 {} 的 zero_* 父级。".format(get_short_name(joint))
        )

    zero = cmds.ls(zero, long=True)[0]

    if not name:
        short_name = get_short_name(joint)

        if short_name.startswith("jnt_"):
            name = "jntbas_{}".format(short_name[len("jnt_"):])
        else:
            name = "jntbas_{}".format(short_name)

    existing = cmds.ls(name, long=True) or []

    if existing:
        bas = existing[0]
        parents = cmds.listRelatives(
            bas,
            parent=True,
            fullPath=True
        ) or []

        if not parents or get_short_name(parents[0]) != get_short_name(zero):
            raise RuntimeError(
                u"{} 已存在，但不在 {} 下。".format(
                    name,
                    get_short_name(zero)
                )
            )

        return bas

    bind_world = get_bind_world_matrix(joint)

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
            if get_short_name(joint).startswith("jnt_")
        ]
    else:
        candidates = []

        for joint in joints:
            if not joint or not cmds.objExists(joint):
                continue

            if cmds.nodeType(joint) != "joint":
                continue

            candidates.append(cmds.ls(joint, long=True)[0])

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

            bindings = get_skin_bindings(joint)

            if not bindings:
                skipped.append({
                    "joint": joint,
                    "reason": u"没有被任何 skinCluster 使用",
                })
                continue

            short_name = get_short_name(joint)
            bas_name = "jntbas_{}".format(
                short_name[len("jnt_"):]
                if short_name.startswith("jnt_")
                else short_name
            )
            existed = bool(cmds.ls(bas_name, long=True))
            bas = create_jntbas(joint, zero=zero, name=bas_name)

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
                        get_short_name(src)
                        == "{}.worldInverseMatrix[0]".format(
                            get_short_name(bas)
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
