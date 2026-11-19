# coding=utf-8
u"""姿态驱动修型的 Maya 层。

数学在 pose_gate_math，这里负责：

    解析        ADV / 五段式关节名 → side、part、大类
    归类        part → arm / spine / leg / finger
    建组        四个世界层级空 transform 汇总组
    建属性      分隔属性 + 8 个方向权重属性
    建网络      门控 DG 节点，输出接到组属性
    清理        按部位删除属性、节点与配置

属性命名：

    sep_<side>_<part>                分隔属性（锁定，Channel Box 显示）
    <side>_<part>_<方向大写><角度>     方向权重，例如 lf_shoulder_F90

配置以 JSON 字符串存在组上：{<side>_<part>: 部位配置}。
一个组可以装多个部位，每个部位各自一套节点与属性。
"""

import json
import math
import re

from maya import cmds
from maya.api import OpenMaya as om

from . import pose_gate_math
from . import hierarchy_utils


owner_value = "muziRigTool.poseDriver"

axis_list = ("rotateX", "rotateY", "rotateZ")
default_axes = ("rotateY", "rotateZ")
default_angle = 45.0

# 后摆方向默认更晚饱和：Shoulder / Thigh 往后 70° 才满门。
default_back_angle = 70.0

owner_attr = "poseDriverOwner"
config_attr = "poseDriverConfig"

group_names = {
    "arm": "grp_md_arm_pose_001",
    "spine": "grp_md_spine_pose_001",
    "leg": "grp_md_leg_pose_001",
    "finger": "grp_md_finger_pose_001",
}

# 裙子修型组：镜像腿部属性，再乘以 leg_follow（是否跟随腿部）。
skirt_group_name = "grp_md_skirt_pose_001"
skirt_follow_attr = "leg_follow"

# 四个汇总组统一收进这个总组。
master_group_name = "grp_md_all_pose_001"

# 组上只保留方向属性，默认 transform 属性不在 Channel Box 显示。
hidden_transform_attrs = (
    "translateX", "translateY", "translateZ",
    "rotateX", "rotateY", "rotateZ",
    "scaleX", "scaleY", "scaleZ",
    "visibility",
)

part_category = {
    "shoulder": "arm",
    "clavicle": "arm",
    "scapula": "arm",
    "arm": "arm",
    "elbow": "arm",
    "wrist": "arm",
    "hand": "arm",
    "hip": "leg",
    "thigh": "leg",
    "knee": "leg",
    "ankle": "leg",
    "toe": "leg",
    "spine": "spine",
    "spine1": "spine",
    "spine2": "spine",
    "spine3": "spine",
    "chest": "spine",
    "neck": "spine",
    "head": "spine",
    "finger": "finger",
    "thumb": "finger",
    "index": "finger",
    "middle": "finger",
    "ring": "finger",
    "pinky": "finger",
}

direction_suffix = {
    "up": "U90",
    "down": "D90",
    "front": "F90",
    "back": "B70",
    "front_up": "F45U45",
    "front_down": "F45D45",
    "back_up": "B45U45",
    "back_down": "B45D45",
}

# 按部位覆盖单轴方向的命名角度：手臂下压只需要 45°，不再叫 D90。
eight_direction_angle_overrides = {
    "shoulder": {"down": 45},
}

# 八方向每部位的方向定义：(方向名, 属性后缀, [(轴, 符号, 角度)])
# 轴 "a" = axes[0]（上下，默认 rotateY），"b" = axes[1]（前后，默认 rotateZ）
eight_direction_defs = {
    "shoulder": (
        ("up", "U90", (("a", -1, 90),)),
        ("down", "D45", (("a", 1, 45),)),
        ("front", "F90", (("b", 1, 90),)),
        ("back", "B70", (("b", -1, 70),)),
        # 实测：上抬 45° 时关节 rotateY ≈ -30；前摆 45° 时 rotateZ ≈ 54.74
        ("front_up_90", "F45U90", (("a", -1, 60), ("b", 1, 55))),
        ("front_up_45", "F45U45", (("a", -1, 30), ("b", 1, 55))),
        ("back_up_45", "B45U45", (("a", -1, 30), ("b", -1, 55))),
        ("back_up_90", "B45U90", (("a", -1, 60), ("b", -1, 55))),
    ),
    "hip": (
        ("up", "U90", (("a", -1, 90),)),
        ("front", "F90", (("b", 1, 90),)),
        ("back", "B70", (("b", -1, 70),)),
        # 实测斜外前姿态 local = [30, -54.74, 54.74]，阈值按实际分量定
        ("front_up_90", "F45U90", (("a", -1, 55), ("b", 1, 50))),
    ),
}

eight_direction_defs = dict(eight_direction_defs)
eight_direction_defs["arm"] = eight_direction_defs["shoulder"]
eight_direction_defs["thigh"] = eight_direction_defs["hip"]

# 八方向门控只适合两轴大范围摆动的部位：上臂（Shoulder）与大腿（Hip）。
# arm / thigh 是五段式命名下的等价写法，保留兼容。
eight_direction_parts = ("shoulder", "arm", "hip", "thigh")

# 四肢单轴多角度（前弯）：肘 / 膝。属性 F45 / F90 / F120，独立叠加。
multi_angle_parts = {
    "elbow": {"axis": "rotateZ", "sign": 1, "angles": (45, 90, 120)},
    # 实测 FKKnee_L 弯曲时 Knee_L.rotateZ 为负值（-84.45），是往后屈伸 → B45/B90/B120
    "knee": {
        "axis": "rotateZ",
        "sign": -1,
        "angles": (45, 90, 120),
        "letter": "B",
    },
}

# 单轴部位用骨骼链向量夹角驱动，IK / FK 都有效。
# elbow: angle(Shoulder→Elbow, Elbow→Wrist)
# knee:  angle(Hip→Knee, Knee→Ankle)
chain_parts = {
    "elbow": ("Shoulder", "Elbow", "Wrist"),
    "knee": ("Hip", "Knee", "Ankle"),
}

# 四肢四方向 + 双向扭转：腕 / 踝。
# directions: (方向名, 属性字母, 角度, 符号)
four_twist_parts = {
    "wrist": {
        # 手腕在 IK 下仍由手腕控制器驱动，直接读控制器通道
        "controller": "FKWrist",
        # 实测：上下（屈伸）走 rotateY，左右（尺桡偏）走 rotateZ
        "swing_axes": ("rotateY", "rotateZ"),
        "directions": (
            ("up", "U", 90, -1),
            ("down", "D", 90, 1),
            ("left", "L", 70, 1),
            ("right", "R", 70, -1),
        ),
        "twist_axis": "rotateX",
        "twist_angle": 179,
        "twist_gate_angle": 45.0,
    },
    "ankle": {
        "swing_axes": ("rotateY", "rotateZ"),
        "directions": (
            ("front", "F", 70, 1),
            ("up", "U", 70, -1),
            ("back", "B", 70, -1),
            ("down", "D", 70, 1),
        ),
        "twist_axis": "rotateX",
        "twist_angle": 179,
        "twist_gate_angle": 45.0,
    },
}

# 手指：ADV 命名 <Finger>Finger<节>_L/_R，节 1~4；修型只做 1/2/3 节。
finger_defs = {
    "thumb": "ThumbFinger",
    "index": "IndexFinger",
    "middle": "MiddleFinger",
    "ring": "RingFinger",
    "pinky": "PinkyFinger",
}

finger_angle = 90.0

finger_attribute_suffixes = ("1", "2", "3", "12", "23", "123")

# 脊柱：ADV 的驱动骨架是 *_M（deform），控制器同名带 FK 前缀。
spine_parts = ("spine1", "spine2", "chest")
spine_angle = 45.0
spine_controllers = {
    "spine1": "FKSpine1_M",
    "spine2": "FKSpine2_M",
    "chest": "FKChest_M",
}
swing_parts = {
    "clavicle": {
        "swing_axes": ("rotateY", "rotateZ"),
        "directions": (
            ("up", "U", 45, -1),
            ("front", "F", 45, 1),
            ("back", "B", 45, -1),
        ),
    },
    "scapula": {
        "swing_axes": ("rotateY", "rotateZ"),
        "directions": (
            ("up", "U", 45, -1),
            ("front", "F", 45, 1),
            ("back", "B", 45, -1),
        ),
    },
}

# 本轮支持一键生成的全部部位（手指按整指入口单独处理）。
supported_parts = (
    "shoulder", "arm", "hip", "thigh", "clavicle", "scapula",
    "elbow", "knee", "wrist", "ankle",
    "spine1", "spine2", "chest",
)

# ADV 标准骨架关节名 → (side, part, category)。
# 名称固定，直接按表生成，不靠解析猜。
# 当前只有 shoulder / hip 走八方向，其余条目保留给 v2。
adv_joint_map = {
    "Shoulder_L": ("lf", "shoulder", "arm"),
    "Shoulder_R": ("rt", "shoulder", "arm"),
    "Clavicle_L": ("lf", "clavicle", "arm"),
    "Clavicle_R": ("rt", "clavicle", "arm"),
    "Scapula_L": ("lf", "scapula", "arm"),
    "Scapula_R": ("rt", "scapula", "arm"),
    "Elbow_L": ("lf", "elbow", "arm"),
    "Elbow_R": ("rt", "elbow", "arm"),
    "Wrist_L": ("lf", "wrist", "arm"),
    "Wrist_R": ("rt", "wrist", "arm"),
    "Hand_L": ("lf", "hand", "arm"),
    "Hand_R": ("rt", "hand", "arm"),
    "Hip1_L": ("lf", "hip", "leg"),
    "Hip1_R": ("rt", "hip", "leg"),
    # 兼容旧命名：L_Thigh / R_Thigh 是静态皮肤关节，不再作为驱动源
    "Hip_L": ("lf", "hip", "leg"),
    "Hip_R": ("rt", "hip", "leg"),
    "Knee_L": ("lf", "knee", "leg"),
    "Knee_R": ("rt", "knee", "leg"),
    "Ankle_L": ("lf", "ankle", "leg"),
    "Ankle_R": ("rt", "ankle", "leg"),
    "Toe_L": ("lf", "toe", "leg"),
    "Toe_R": ("rt", "toe", "leg"),
    "Spine1_M": ("md", "spine1", "spine"),
    "Spine2_M": ("md", "spine2", "spine"),
    "Chest_M": ("md", "chest", "spine"),
    "Neck": ("md", "neck", "spine"),
    "Head": ("md", "head", "spine"),
    "Thumb_L": ("lf", "thumb", "finger"),
    "Thumb_R": ("rt", "thumb", "finger"),
    "Index_L": ("lf", "index", "finger"),
    "Index_R": ("rt", "index", "finger"),
    "Middle_L": ("lf", "middle", "finger"),
    "Middle_R": ("rt", "middle", "finger"),
    "Ring_L": ("lf", "ring", "finger"),
    "Ring_R": ("rt", "ring", "finger"),
    "Pinky_L": ("lf", "pinky", "finger"),
    "Pinky_R": ("rt", "pinky", "finger"),
}


# ----------------------------------------------------------------------
# 校验与解析
# ----------------------------------------------------------------------

def validate_joint(joint):
    u"""校验驱动源是一个关节。

    Args:
        joint (str): 关节节点名。

    Returns:
        str: 原样返回关节名。

    Raises:
        RuntimeError: 节点不存在，或类型不是 joint。
    """

    hierarchy_utils.validate_node(joint, u"驱动关节")

    if cmds.nodeType(joint) != "joint":
        raise RuntimeError(u"驱动源必须是关节，收到：{}".format(joint))

    return joint


def validate_axes(axes):
    u"""校验两根旋转轴。

    Args:
        axes (list): 两个 rotate 通道名。

    Returns:
        tuple: 规范化后的轴对。

    Raises:
        ValueError: 数量、名称或重复轴不合法。
    """

    axes = tuple(axes)

    if len(axes) != 2:
        raise ValueError(u"轴对必须正好两个，收到：{}".format(axes))

    for axis in axes:
        if axis not in axis_list:
            raise ValueError(u"未知的旋转轴，收到：{}".format(axis))

    if axes[0] == axes[1]:
        raise ValueError(u"两根轴不能相同，收到：{}".format(axes))

    return axes


def resolve_directions(directions):
    u"""校验并去重方向列表。

    Args:
        directions (iterable): 方向名；None 表示全部。

    Returns:
        list: 方向名列表。

    Raises:
        ValueError: 方向名非法，或一个方向都没有启用。
    """

    if directions is None:
        return list(pose_gate_math.direction_list)

    resolved = []

    for name in directions:
        if name not in pose_gate_math.direction_list:
            raise ValueError(u"未知方向：{}".format(name))

        if name not in resolved:
            resolved.append(name)

    if not resolved:
        raise ValueError(u"至少要启用一个方向。")

    return resolved


def parse_joint_identity(joint):
    u"""从关节名解析侧别、部位与大类。

    先按 ADV 命名解析（Shoulder_L / Spine1 / Index_R），
    失败再按五段式解析（jnt_lf_arm_bind_001）。

    Args:
        joint (str): 关节名，可带命名空间。

    Returns:
        tuple: (side, part, category)

    Raises:
        RuntimeError: 两种命名都解析不出部位。
    """

    short_name = joint.split("|")[-1].split(":")[-1]

    # 先精确匹配 ADV 名单（Spine1_M / Chest_M 这类带后缀的关节）
    if short_name in adv_joint_map:
        return adv_joint_map[short_name]

    parsed = _parse_adv_name(short_name) or _parse_five_part_name(short_name)

    if parsed:
        return parsed

    raise RuntimeError(
        u"无法从关节名解析部位，收到：{}。"
        u"支持 ADV 命名（Shoulder_L / Spine1）或五段式（jnt_lf_arm_bind_001）。".format(
            joint
        )
    )


def parse_finger_joint(joint):
    u"""解析 ADV 手指关节名，例如 IndexFinger1_L。

    Args:
        joint (str): 关节名。

    Returns:
        tuple | None: (side, finger, segment)；不是手指关节时返回 None。
    """

    short_name = joint.split("|")[-1].split(":")[-1]

    match = re.match(
        r"(Thumb|Index|Middle|Ring|Pinky)Finger([1-4])_([LR])$",
        short_name,
    )

    if not match:
        return None

    side = "lf" if match.group(3) == "L" else "rt"

    return side, match.group(1).lower(), int(match.group(2))


def get_rotate_value(joint, axis):
    u"""读关节某个旋转通道的当前值。"""

    return float(cmds.getAttr("{}.{}".format(joint, axis)))


def get_world_inverse(joint):
    u"""返回关节当前世界矩阵的逆矩阵（16 个元素）。

    Args:
        joint (str): 关节。

    Returns:
        list: 逆矩阵元素。
    """

    matrix = om.MMatrix(cmds.getAttr("{}.worldMatrix[0]".format(joint)))

    return list(matrix.inverse())


def get_neutral_rotate(joint, axes):
    u"""读取关节的世界旋转作为 neutral。

    ADV 的 FK 控制器通过约束驱动关节，关节自己的 rotate 通道可能不变，
    所以 neutral 与驱动量都按世界矩阵分解，才能反映实际姿态。

    Args:
        joint (str): 关节。
        axes (tuple): 需要的轴。

    Returns:
        dict: {轴: 世界旋转角度}
    """

    matrix = om.MMatrix(cmds.getAttr("{}.worldMatrix[0]".format(joint)))

    # decomposeMatrix 默认按 XYZ 分解，neutral 也固定用 XYZ，保持一致
    euler = om.MEulerRotation.decompose(matrix, om.MEulerRotation.kXYZ)

    degrees = [
        math.degrees(euler.x),
        math.degrees(euler.y),
        math.degrees(euler.z),
    ]

    mapping = {
        "rotateX": degrees[0],
        "rotateY": degrees[1],
        "rotateZ": degrees[2],
    }

    return {axis: mapping[axis] for axis in axes}


# ----------------------------------------------------------------------
# 汇总组
# ----------------------------------------------------------------------

def get_group_name(category):
    u"""返回大类对应的汇总组名。

    Raises:
        ValueError: 未知大类。
    """

    if category not in group_names:
        raise ValueError(u"未知部位大类，收到：{}".format(category))

    return group_names[category]


def get_or_create_group(category):
    u"""获取或创建大类汇总组。

    Args:
        category (str): arm / spine / leg / finger。

    Returns:
        str: 组名。

    Raises:
        RuntimeError: 同名节点已存在但不是本工具创建的组。
    """

    name = get_group_name(category)

    if cmds.objExists(name):
        _validate_group(name)
        return name

    group = cmds.createNode("transform", name=name)

    _add_owner_attrs(group)
    _hide_transform_attrs(group)

    return group


def get_or_create_master_group():
    u"""获取或创建总组。

    Returns:
        str: 总组名。

    Raises:
        RuntimeError: 同名节点已存在但不是本工具创建的组。
    """

    if cmds.objExists(master_group_name):
        _validate_group(master_group_name)
        _hide_transform_attrs(master_group_name)
        return master_group_name

    group = cmds.createNode("transform", name=master_group_name)

    _add_owner_attrs(group)
    _hide_transform_attrs(group)

    return group


def get_or_create_skirt_group():
    u"""获取或创建裙子修型组，并保证 leg_follow 属性存在。

    Returns:
        str: 组名。
    """

    master = get_or_create_master_group()

    if cmds.objExists(skirt_group_name):
        _validate_group(skirt_group_name)
        group = skirt_group_name
    else:
        group = cmds.createNode("transform", name=skirt_group_name)
        _add_owner_attrs(group)

    _hide_transform_attrs(group)

    if not cmds.attributeQuery(skirt_follow_attr, node=group, exists=True):
        cmds.addAttr(
            group,
            longName=skirt_follow_attr,
            attributeType="double",
            defaultValue=1.0,
            minValue=0.0,
            maxValue=1.0,
            keyable=True,
        )

    parents = cmds.listRelatives(group, parent=True, fullPath=True) or []
    current_parent = parents[0].split("|")[-1] if parents else None

    if current_parent != master:
        group = cmds.parent(group, master)[0]

    _hide_transform_attrs(group)

    return group


def build_skirt_links():
    u"""把腿组的部位属性 × leg_follow 连到裙子组。

    裙组属性名与腿组一致，只作为裙子修型的驱动源，不直接手 K。

    Returns:
        tuple: (裙组名, 新建的 multDoubleLinear 节点列表)。
    """

    skirt = get_or_create_skirt_group()
    leg_group = get_or_create_group("leg")
    leg_config = read_group_config(leg_group)

    _clear_skirt_links()

    created_nodes = []

    for part_key in sorted(leg_config):
        attributes = leg_config[part_key].get("attributes") or {}

        for suffix in sorted(attributes):
            attribute = attributes[suffix]
            mirror_attribute = "skirt_" + attribute

            if not cmds.attributeQuery(
                    mirror_attribute, node=skirt, exists=True
            ):
                _add_weight_attr(skirt, mirror_attribute)

            node = cmds.createNode(
                "multDoubleLinear",
                name="mult_{}_{}LegFollow_001".format(part_key, suffix),
            )
            cmds.connectAttr(leg_group + "." + attribute, node + ".input1")
            cmds.connectAttr(
                skirt + "." + skirt_follow_attr, node + ".input2"
            )
            cmds.connectAttr(
                node + ".output", skirt + "." + mirror_attribute
            )
            cmds.setAttr(
                skirt + "." + mirror_attribute,
                keyable=False,
                channelBox=True,
            )

            created_nodes.append(node)

    return skirt, created_nodes


def _clear_skirt_links():
    u"""清掉裙子组上的镜像属性与连接，保留组与 leg_follow。"""

    if not cmds.objExists(skirt_group_name):
        return

    for attribute in cmds.listAttr(
            skirt_group_name, userDefined=True
    ) or []:
        if attribute == skirt_follow_attr:
            continue

        plug = skirt_group_name + "." + attribute

        if not cmds.attributeQuery(attribute, node=skirt_group_name, exists=True):
            continue

        sources = cmds.listConnections(
            plug, source=True, destination=False
        ) or []

        if sources:
            cmds.delete(sources)

        try:
            cmds.setAttr(plug, lock=False)
        except RuntimeError:
            pass

        cmds.deleteAttr(plug)


def ensure_all_groups():
    u"""补齐总组与四个汇总组，并把汇总组收进总组。"""

    master = get_or_create_master_group()
    groups = []

    for name in group_names:
        group = get_or_create_group(name)
        _hide_transform_attrs(group)

        parents = cmds.listRelatives(group, parent=True, fullPath=True) or []
        current_parent = parents[0].split("|")[-1] if parents else None

        if current_parent != master:
            group = cmds.parent(group, master)[0]

        groups.append(group)

    get_or_create_skirt_group()

    return groups


def read_group_config(group):
    u"""读取组上的部位配置。

    Args:
        group (str): 汇总组。

    Returns:
        dict: {<side>_<part>: 部位配置}。
    """

    _validate_group(group)
    raw = cmds.getAttr(group + "." + config_attr)

    if not raw:
        return {}

    return json.loads(raw)


# ----------------------------------------------------------------------
# 构建
# ----------------------------------------------------------------------

# 大臂 RBF 样本（实测）：单轴 1:1；复合姿态是欧拉分解后的值
shoulder_rbf_samples = (
    ("U90", (0.0, -90.0, 0.0)),
    ("D45", (0.0, 45.0, 0.0)),
    ("F90", (0.0, 0.0, 90.0)),
    ("B70", (0.0, 0.0, -70.0)),
    ("F45U45", (15.79, -30.0, 54.74)),
    ("F45U90", (0.0, -90.0, 45.0)),
    ("B45U45", (0.0, -45.0, -45.0)),
    ("B45U90", (0.0, -90.0, -45.0)),
)


def _build_shoulder_rbf(joint, side, part, category):
    u"""大臂用 RBF 插值构建，属性与门控版同名（lf_shoulder_U90 等）。"""

    from . import rbf_pose_driver_utils

    ensure_all_groups()

    part_key = "{}_{}".format(side, part)
    group = get_or_create_group(category)
    config = read_group_config(group)

    # 先按 ADV 配置删掉旧的门控部位，避免属性/曲线残留
    if part_key in config:
        _remove_part(group, config, part_key)
        _write_config(group, config)

    item = {
        "joint": joint,
        "joints": [joint],
        "side": side,
        "part": part,
        "category": category,
        "samples": list(shoulder_rbf_samples),
        "sigma": 45.0,
    }

    result = rbf_pose_driver_utils.build_rbf_part(item)

    # 同步写进 ADV 配置，连接 BS / 删除全部时才找得到
    group = result["group"]
    separator = "sep_" + result["part_key"]
    _add_separator(group, separator)

    indicator = _create_indicator(
        joint, result["part_key"], result["nodes"]
    )
    result["indicator"] = indicator
    result["separator"] = separator

    config = read_group_config(group)
    config[result["part_key"]] = {
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "mode": "rbf",
        "attributes": dict(result["attributes"]),
        "indicator": indicator,
        "separator": separator,
        "nodes": list(result["nodes"]),
    }
    _write_config(group, config)

    return result


def build_network(
    joint,
    axes=default_axes,
    angle=default_angle,
    directions=None,
    neutral=None,
    angle_map=None,
    neutral_inverse=None,
    blendshape=None,
):
    u"""构建一个部位的驱动属性与门控网络。

    Args:
        joint (str): 驱动关节。
        axes (tuple): 两根旋转轴，第一根控制 up/down。
        angle (float): 默认阈值角度，被 angle_map 覆盖的方向除外。
        directions (iterable): 启用的方向；None 表示全部。
        neutral (dict): 中立姿态角度；None 时读当前旋转。
        angle_map (dict): 每方向阈值覆盖，例如 {"back": 70.0}；
            None 时使用默认后摆 70°、其余 45°。

    Returns:
        dict: 部位信息，含 group、part_key、attributes、nodes 等。

    Raises:
        RuntimeError: 关节非法、名字解析失败，或手指类本轮不支持。
        ValueError: 轴对、阈值或方向非法。
    """

    if joint == "md_legs":
        return _build_legs()

    validate_joint(joint)

    finger_info = parse_finger_joint(joint)

    if finger_info:
        side, finger, segment = finger_info

        if segment != 1:
            raise RuntimeError(
                u"手指请用 Finger1 关节生成整指，收到：{}".format(joint)
            )

        return _build_finger(joint, side, finger)

    side, part, category = parse_joint_identity(joint)

    if part in spine_parts:
        if neutral_inverse is None:
            neutral_inverse = get_world_inverse(joint)

        return _build_spine(joint, side, part, category, neutral_inverse)

    if part in swing_parts:
        return _build_swing(joint, side, part, category, neutral_inverse)

    if part in multi_angle_parts or part in four_twist_parts:
        return _build_limb_network(
            joint, side, part, category, neutral, neutral_inverse
        )

    axes = validate_axes(axes)
    angle = float(angle)

    if angle <= 0.0:
        raise ValueError(u"阈值角度必须大于 0，收到：{}".format(angle))

    # 八方向用每部位自己的方向定义；旧方向名做兼容映射。
    if directions is None:
        direction_names = None
    else:
        legacy_names = {
            "front_up": "front_up_45",
            "back_up": "back_up_45",
        }
        direction_names = set(
            legacy_names.get(name, name) for name in directions
        )

    angle_map = _resolve_angle_map(angle, angle_map)

    if category == "finger":
        raise RuntimeError(
            u"手指类部位本轮只创建空组，属性留到 v2，收到：{}".format(joint)
        )

    # 大臂走 RBF 插值：多轴组合不会跳变
    if part in ("shoulder", "arm"):
        return _build_shoulder_rbf(joint, side, part, category)

    # 实测大腿 local rotate 是干净单轴：前抬 +Z、后摆 -Z、外展 -Y，
    # 和手臂一样走八方向门控（夹角方案只在复合轴场景才需要）
    if part not in eight_direction_parts:
        raise RuntimeError(
            u"本轮八方向只支持 Shoulder / Hip（五段式的 arm / thigh），"
            u"其他部位等 v2 按各自模式做，收到：{}".format(joint)
        )

    part_key = "{}_{}".format(side, part)

    # 读关节 local rotate：ADV 约束驱动会改变形关节 local，
    # 父级旋转不会串进来（手肘动时手腕 local 不变）
    neutral = _read_joint_neutral(joint, axes)

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()

        group = get_or_create_group(category)
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        delta_a = _build_channel_delta(
            part_key, "a", joint + "." + axes[0], neutral[axes[0]],
            created_nodes
        )
        delta_b = _build_channel_delta(
            part_key, "b", joint + "." + axes[1], neutral[axes[1]],
            created_nodes
        )

        direction_defs = [
            item for item in eight_direction_defs[part]
            if direction_names is None or item[0] in direction_names
        ]

        gate_cache = {}

        def get_gate(axis, sign, gate_angle):
            key = (axis, sign, gate_angle)

            if key in gate_cache:
                return gate_cache[key]

            delta = delta_a if axis == "a" else delta_b
            gate = _build_gate(
                part_key,
                "{}s{}a{}".format(
                    axis, "p" if sign > 0 else "n", int(gate_angle)
                ),
                delta,
                sign,
                gate_angle,
                created_nodes,
            )
            gate_cache[key] = gate

            return gate

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attribute_names = {}

        for direction, suffix, components in direction_defs:
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attribute_names[direction] = attribute

        indicator = _create_indicator(joint, part_key, created_nodes)

        for direction, suffix, components in direction_defs:
            sources = [
                get_gate(axis, sign, gate_angle)
                for axis, sign, gate_angle in components
            ]

            if len(sources) == 1:
                combo_output = sources[0]
            else:
                combo = _create(
                    "mult_" + part_key + "_out" + _camel_case(direction) + "_001",
                    "multDoubleLinear",
                    created_nodes,
                )
                cmds.connectAttr(sources[0], combo + ".input1")
                cmds.connectAttr(sources[1], combo + ".input2")
                combo_output = combo + ".output"

            _create_driven_key(
                group + "." + attribute_names[direction],
                combo_output,
                part_key,
                suffix,
                created_nodes,
            )

        config[part_key] = {
            "joint": joint,
            "side": side,
            "part": part,
            "category": category,
            "axes": list(axes),
            "angle": angle,
            "angle_map": dict(angle_map),
            "directions": [item[0] for item in direction_defs],
            "neutral": neutral,
            "separator": separator,
            "attributes": attribute_names,
            "indicator": indicator,
            "nodes": list(created_nodes),
            "blendshape": blendshape,
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "axes": list(axes),
        "angle": angle,
        "angle_map": dict(angle_map),
        "directions": [item[0] for item in direction_defs],
        "neutral": dict(neutral),
        "separator": separator,
        "attributes": dict(attribute_names),
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


# ----------------------------------------------------------------------
# 四肢构建器
# ----------------------------------------------------------------------

def _build_limb_network(joint, side, part, category, neutral, neutral_inverse):
    u"""按四肢模式分派到具体构建器。"""

    if part in multi_angle_parts:
        return _build_multi_angle(
            joint, side, part, category, neutral, neutral_inverse
        )

    return _build_four_twist(
        joint, side, part, category, neutral, neutral_inverse
    )


def _build_chain_angle(part_key, part, side, nodes):
    u"""用骨骼链两段向量的夹角驱动单轴弯曲。

    ik / fk / 拉伸都有效：量的是骨骼实际朝向，不依赖关节旋转通道。

    Args:
        part_key (str): 部位 key，用于命名。
        part (str): elbow / knee。
        side (str): lf / rt。
        nodes (list): 节点清理清单。

    Returns:
        tuple: (delta plug, neutral 夹角)

    Raises:
        RuntimeError: 缺少链上关节，或 side 不是左右侧。
    """

    chain = chain_parts[part]

    suffix = {"lf": "_L", "rt": "_R"}.get(side)

    if not suffix:
        raise RuntimeError(
            u"骨骼链驱动需要左右侧关节，收到 side：{}".format(side)
        )

    names = [name + suffix for name in chain]

    for name in names:
        if not cmds.objExists(name):
            raise RuntimeError(
                u"骨骼链缺少关节，收到：{}".format(name)
            )

    positions = {}

    for role, name in zip(("root", "mid", "end"), names):
        decompose = _create(
            "decompose_" + part_key + "_" + role + "_001",
            "decomposeMatrix",
            nodes,
        )
        cmds.connectAttr(name + ".worldMatrix[0]", decompose + ".inputMatrix")
        positions[role] = decompose + ".outputTranslate"

    def make_vector(role, end_position, start_position):
        vector = _create(
            "plus_" + part_key + "_" + role + "Vec_001",
            "plusMinusAverage",
            nodes,
        )
        cmds.setAttr(vector + ".operation", 2)

        for component in ("X", "Y", "Z"):
            cmds.connectAttr(
                end_position + component,
                vector + ".input3D[0].input3D" + component.lower(),
            )
            cmds.connectAttr(
                start_position + component,
                vector + ".input3D[1].input3D" + component.lower(),
            )

        return vector

    vector_a = make_vector("a", positions["mid"], positions["root"])
    vector_b = make_vector("b", positions["end"], positions["mid"])

    angle = _create(
        "angleBetween_" + part_key + "_chain_001",
        "angleBetween",
        nodes,
    )

    for component in ("X", "Y", "Z"):
        cmds.connectAttr(
            vector_a + ".output3D" + component.lower(),
            angle + ".vector1" + component,
        )
        cmds.connectAttr(
            vector_b + ".output3D" + component.lower(),
            angle + ".vector2" + component,
        )

    neutral_angle = float(cmds.getAttr(angle + ".angle"))

    delta = _create(
        "plus_" + part_key + "_chainDelta_001",
        "plusMinusAverage",
        nodes,
    )
    cmds.setAttr(delta + ".operation", 2)
    cmds.connectAttr(angle + ".angle", delta + ".input1D[0]")
    cmds.setAttr(delta + ".input1D[1]", neutral_angle)

    return delta + ".output1D", neutral_angle


def _build_gate_between(part_key, role, delta_plug, start, width, nodes):
    u"""建一个从 start 到 start + width 的平滑门。"""

    shifted = _create(
        "plus_" + part_key + "_" + role + "From_001",
        "plusMinusAverage",
        nodes,
    )
    cmds.setAttr(shifted + ".operation", 2)
    cmds.connectAttr(delta_plug, shifted + ".input1D[0]")
    cmds.setAttr(shifted + ".input1D[1]", float(start))

    return _build_gate(
        part_key, role, shifted + ".output1D", 1, width, nodes
    )


def _build_subtract(part_key, role, first, second, nodes):
    u"""建 first − second。"""

    node = _create(
        "plus_" + part_key + "_" + role + "Mix_001",
        "plusMinusAverage",
        nodes,
    )
    cmds.setAttr(node + ".operation", 2)
    cmds.connectAttr(first, node + ".input1D[0]")
    cmds.connectAttr(second, node + ".input1D[1]")

    return node + ".output1D"


def _build_multiply(part_key, role, first, second, nodes):
    u"""建 first × second。"""

    node = _create(
        "mult_" + part_key + "_" + role + "_001",
        "multDoubleLinear",
        nodes,
    )
    cmds.connectAttr(first, node + ".input1")
    cmds.connectAttr(second, node + ".input2")

    return node + ".output"


def _build_multiply_constant(part_key, role, plug, value, nodes):
    u"""plug × 常量。"""

    node = _create(
        "mult_" + part_key + "_" + role + "Const_001",
        "multDoubleLinear",
        nodes,
    )
    cmds.connectAttr(plug, node + ".input1")
    cmds.setAttr(node + ".input2", float(value))

    return node + ".output"


def _build_channel_delta(part_key, role, plug, neutral_value, nodes):
    u"""建通道差值：当前通道值 − neutral。"""

    delta = _create(
        "plus_" + part_key + "_" + role + "Delta_001",
        "plusMinusAverage",
        nodes,
    )
    cmds.setAttr(delta + ".operation", 2)
    cmds.connectAttr(plug, delta + ".input1D[0]")
    cmds.setAttr(delta + ".input1D[1]", float(neutral_value))

    return delta + ".output1D"


def _build_three_joint_angle(part_key, role, joint_a, joint_b, joint_c, nodes):
    u"""建 angle(A→B, B→C)，返回 (delta plug, neutral angle)。"""

    for name in (joint_a, joint_b, joint_c):
        if not cmds.objExists(name):
            raise RuntimeError(u"骨骼链缺少关节，收到：{}".format(name))

    positions = {}

    for tag, name in (("a", joint_a), ("b", joint_b), ("c", joint_c)):
        decompose = _create(
            "decompose_" + part_key + "_" + role + tag + "_001",
            "decomposeMatrix",
            nodes,
        )
        cmds.connectAttr(name + ".worldMatrix[0]", decompose + ".inputMatrix")
        positions[tag] = decompose + ".outputTranslate"

    def make_vector(tag, end_position, start_position):
        vector = _create(
            "plus_" + part_key + "_" + role + tag + "Vec_001",
            "plusMinusAverage",
            nodes,
        )
        cmds.setAttr(vector + ".operation", 2)

        for component in ("x", "y", "z"):
            cmds.connectAttr(
                end_position + component.upper(),
                vector + ".input3D[0].input3D" + component,
            )
            cmds.connectAttr(
                start_position + component.upper(),
                vector + ".input3D[1].input3D" + component,
            )

        return vector

    vector_ab = make_vector("ab", positions["b"], positions["a"])
    vector_bc = make_vector("bc", positions["c"], positions["b"])

    angle = _create(
        "angleBetween_" + part_key + "_" + role + "_001",
        "angleBetween",
        nodes,
    )

    for component in ("X", "Y", "Z"):
        cmds.connectAttr(
            vector_ab + ".output3D" + component.lower(),
            angle + ".vector1" + component,
        )
        cmds.connectAttr(
            vector_bc + ".output3D" + component.lower(),
            angle + ".vector2" + component,
        )

    neutral_angle = float(cmds.getAttr(angle + ".angle"))

    delta = _create(
        "plus_" + part_key + "_" + role + "Delta_001",
        "plusMinusAverage",
        nodes,
    )
    cmds.setAttr(delta + ".operation", 2)
    cmds.connectAttr(angle + ".angle", delta + ".input1D[0]")
    cmds.setAttr(delta + ".input1D[1]", neutral_angle)

    return delta + ".output1D", neutral_angle


def _build_finger(joint, side, finger):
    u"""构建一整根手指：1/2/3 节单独修型 + 两节/三节融合。

    Args:
        joint (str): 该手指的 Finger1 关节。
        side (str): lf / rt。
        finger (str): thumb / index / middle / ring / pinky。

    Returns:
        dict: 部位信息。
    """

    base = finger_defs[finger]
    suffix = "_L" if side == "lf" else "_R"
    wrist = "Wrist" + suffix
    names = [base + str(segment) + suffix for segment in range(1, 5)]
    part_key = "{}_{}".format(side, finger)

    if not cmds.objExists(wrist):
        raise RuntimeError(u"缺少手腕关节，收到：{}".format(wrist))

    for name in names:
        if not cmds.objExists(name):
            raise RuntimeError(u"缺少手指关节，收到：{}".format(name))

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()
        group = get_or_create_group("finger")
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        neutral_angles = []
        gates = []

        # 每节读关节 local rotateY：ADV 约束驱动会改 local，父级旋转不串
        for index, name in enumerate(names[:3]):
            plug = name + ".rotateY"
            neutral_value = float(cmds.getAttr(plug))
            neutral_angles.append(neutral_value)

            gates.append(
                _build_gate_between(
                    part_key,
                    "g" + str(index + 1),
                    plug,
                    neutral_value,
                    finger_angle,
                    created_nodes,
                )
            )

        gate_12 = _build_multiply(
            part_key, "m12", gates[0], gates[1], created_nodes
        )
        gate_23 = _build_multiply(
            part_key, "m23", gates[1], gates[2], created_nodes
        )
        gate_123 = _build_multiply(
            part_key, "m123", gate_12, gates[2], created_nodes
        )

        values = {
            "1": gates[0],
            "2": gates[1],
            "3": gates[2],
            "12": gate_12,
            "23": gate_23,
            "123": gate_123,
        }

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attributes = {}

        for key in finger_attribute_suffixes:
            attribute = part_key + key + "_F90"
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[key] = attribute

        indicator = _create_indicator(names[0], part_key, created_nodes)

        for key in finger_attribute_suffixes:
            _create_driven_key(
                group + "." + attributes[key],
                values[key],
                part_key,
                key + "F90",
                created_nodes,
            )

        config[part_key] = {
            "joint": joint,
            "side": side,
            "finger": finger,
            "part": finger,
            "category": "finger",
            "mode": "finger",
            "segments": [1, 2, 3],
            "neutral_angles": neutral_angles,
            "separator": separator,
            "attributes": attributes,
            "indicator": indicator,
            "nodes": list(created_nodes),
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": finger,
        "category": "finger",
        "mode": "finger",
        "neutral_angles": neutral_angles,
        "separator": separator,
        "attributes": dict(attributes),
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


def _build_spine(joint, side, part, category, neutral_inverse):
    u"""脊柱：前后左右 + 双向扭转，各 45°，读 *_M 变形关节的 local rotate。

    实测 ADV 约束驱动会改变形关节的 local rotate，父级旋转也不会串进来。
    """

    part_key = "{}_{}".format(side, part)
    neutral = {
        axis: float(cmds.getAttr(joint + "." + axis))
        for axis in ("rotateX", "rotateY", "rotateZ")
    }

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()
        group = get_or_create_group(category)
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        delta_x = _build_channel_delta(
            part_key, "x", joint + ".rotateX", neutral["rotateX"],
            created_nodes
        )
        delta_y = _build_channel_delta(
            part_key, "y", joint + ".rotateY", neutral["rotateY"],
            created_nodes
        )
        delta_z = _build_channel_delta(
            part_key, "z", joint + ".rotateZ", neutral["rotateZ"],
            created_nodes
        )

        # 实测：前后 = rotateZ，左右 = rotateY，扭转 = rotateX
        specs = (
            ("F45", delta_z, 1),
            ("B45", delta_z, -1),
            ("L45", delta_y, -1),
            ("R45", delta_y, 1),
            ("TwsP45", delta_x, 1),
            ("TwsN45", delta_x, -1),
        )

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attributes = {}

        for suffix, delta, sign in specs:
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[suffix] = attribute

        indicator = _create_indicator(joint, part_key, created_nodes)

        for suffix, delta, sign in specs:
            gate = _build_gate(
                part_key, suffix, delta, sign, spine_angle, created_nodes
            )
            _create_driven_key(
                group + "." + attributes[suffix],
                gate,
                part_key,
                suffix,
                created_nodes,
            )

        config[part_key] = {
            "joint": joint,
            "side": side,
            "part": part,
            "category": category,
            "mode": "spine",
            "neutral": neutral,
            "separator": separator,
            "attributes": attributes,
            "indicator": indicator,
            "nodes": list(created_nodes),
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "mode": "spine",
        "neutral": dict(neutral),
        "separator": separator,
        "attributes": dict(attributes),
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


def _build_hip_swing(part_key, hip_joint, knee_joint, nodes):
    u"""hip→knee 方向相对 neutral 的夹角与旋转轴。

    构建时把当前 hip→knee 向量记成 neutral，运行时用 angleBetween 算摆动角；
    IK / FK 都有效，不受 jointOrient 复合分解影响。

    Returns:
        tuple: (角度 plug, 旋转轴 Z plug)。
    """

    hip_decompose = _create(
        "decompose_" + part_key + "_hip_001", "decomposeMatrix", nodes
    )
    cmds.connectAttr(
        hip_joint + ".worldMatrix[0]", hip_decompose + ".inputMatrix"
    )

    knee_decompose = _create(
        "decompose_" + part_key + "_knee_001", "decomposeMatrix", nodes
    )
    cmds.connectAttr(
        knee_joint + ".worldMatrix[0]", knee_decompose + ".inputMatrix"
    )

    vector = _create(
        "plus_" + part_key + "_legVec_001", "plusMinusAverage", nodes
    )
    cmds.setAttr(vector + ".operation", 2)

    for axis in ("x", "y", "z"):
        cmds.connectAttr(
            knee_decompose + ".outputTranslate" + axis.upper(),
            vector + ".input3D[0].input3D" + axis,
        )
        cmds.connectAttr(
            hip_decompose + ".outputTranslate" + axis.upper(),
            vector + ".input3D[1].input3D" + axis,
        )

    neutral = [
        cmds.getAttr(vector + ".output3D" + axis) for axis in ("x", "y", "z")
    ]

    angle = _create(
        "angleBetween_" + part_key + "_swing_001", "angleBetween", nodes
    )
    cmds.setAttr(angle + ".vector1X", neutral[0])
    cmds.setAttr(angle + ".vector1Y", neutral[1])
    cmds.setAttr(angle + ".vector1Z", neutral[2])

    for axis in ("X", "Y", "Z"):
        cmds.connectAttr(
            vector + ".output3D" + axis.lower(),
            angle + ".vector2" + axis,
        )

    return angle + ".angle", angle + ".axisZ"


def _build_signed_angle_gate(
        part_key, role, angle_plug, axis_plug, sign, threshold, nodes
):
    u"""总角度门 × 旋转轴符号门：sign=1 取正向，sign=-1 取负向。"""

    magnitude = _build_gate(
        part_key, role + "Mag", angle_plug, 1, threshold, nodes
    )

    signed = _create(
        "mult_" + part_key + "_" + role + "Sign_001",
        "multDoubleLinear",
        nodes,
    )
    cmds.connectAttr(axis_plug, signed + ".input1")
    cmds.setAttr(signed + ".input2", 1000.0 * sign)

    sign_gate = _create(
        "condition_" + part_key + "_" + role + "_001", "condition", nodes
    )
    cmds.connectAttr(signed + ".output", sign_gate + ".firstTerm")
    cmds.setAttr(sign_gate + ".secondTerm", 0.5)
    cmds.setAttr(sign_gate + ".operation", 2)
    cmds.setAttr(sign_gate + ".colorIfTrueR", 1.0)
    cmds.setAttr(sign_gate + ".colorIfFalseR", 0.0)

    combo = _create(
        "mult_" + part_key + "_" + role + "Out_001",
        "multDoubleLinear",
        nodes,
    )
    cmds.connectAttr(magnitude, combo + ".input1")
    cmds.connectAttr(sign_gate + ".outColorR", combo + ".input2")

    return combo + ".output"


def _build_hip_side_detector(part_key, hip_joint, nodes):
    u"""用 hip local rotateY / rotateZ 的平方比较区分外展和前抬。

    实测：外展时 rotateY ≈ -90（主分量），前抬时 rotateZ 为主。
    """

    ry_squared = _create(
        "mult_" + part_key + "_rySq_001", "multDoubleLinear", nodes
    )
    cmds.connectAttr(hip_joint + ".rotateY", ry_squared + ".input1")
    cmds.connectAttr(hip_joint + ".rotateY", ry_squared + ".input2")

    rz_squared = _create(
        "mult_" + part_key + "_rzSq_001", "multDoubleLinear", nodes
    )
    cmds.connectAttr(hip_joint + ".rotateZ", rz_squared + ".input1")
    cmds.connectAttr(hip_joint + ".rotateZ", rz_squared + ".input2")

    side = _create(
        "condition_" + part_key + "_side_001", "condition", nodes
    )
    cmds.connectAttr(ry_squared + ".output", side + ".firstTerm")
    cmds.connectAttr(rz_squared + ".output", side + ".secondTerm")
    cmds.setAttr(side + ".operation", 2)
    cmds.setAttr(side + ".colorIfTrueR", 1.0)
    cmds.setAttr(side + ".colorIfFalseR", 0.0)

    front = _create(
        "condition_" + part_key + "_front_001", "condition", nodes
    )
    cmds.connectAttr(rz_squared + ".output", front + ".firstTerm")
    cmds.connectAttr(ry_squared + ".output", front + ".secondTerm")
    cmds.setAttr(front + ".operation", 3)
    cmds.setAttr(front + ".colorIfTrueR", 1.0)
    cmds.setAttr(front + ".colorIfFalseR", 0.0)

    return side + ".outColorR", front + ".outColorR"


def _build_hip_by_swing(joint, side, part, category):
    u"""hip 用 hip→knee 夹角驱动：往前 F90 / 往后 B70 / 外展 U90 / 斜外上 F45U90。"""

    part_key = "{}_{}".format(side, part)
    knee_joint = "Knee_" + ("L" if side == "lf" else "R")

    if not cmds.objExists(knee_joint):
        raise RuntimeError(u"缺少膝盖关节：{}".format(knee_joint))

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()
        group = get_or_create_group(category)
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        angle_plug, axis_plug = _build_hip_swing(
            part_key, joint, knee_joint, created_nodes
        )
        side_plug, front_plug = _build_hip_side_detector(
            part_key, joint, created_nodes
        )

        def multiply(first, second, name):
            node = _create(
                "mult_" + part_key + "_" + name + "_001",
                "multDoubleLinear",
                created_nodes,
            )
            cmds.connectAttr(first, node + ".input1")
            cmds.connectAttr(second, node + ".input2")

            return node + ".output"

        direction_gates = {
            "F90": multiply(
                _build_signed_angle_gate(
                    part_key, "F90", angle_plug, axis_plug, 1, 90,
                    created_nodes
                ),
                front_plug,
                "F90Dir",
            ),
            "B70": multiply(
                _build_signed_angle_gate(
                    part_key, "B70", angle_plug, axis_plug, -1, 70,
                    created_nodes
                ),
                front_plug,
                "B70Dir",
            ),
            "U90": multiply(
                _build_gate(part_key, "U90", angle_plug, 1, 90, created_nodes),
                side_plug,
                "U90Dir",
            ),
            "F45U90": multiply(
                multiply(
                    _build_gate(
                        part_key, "F45U90", angle_plug, 1, 45, created_nodes
                    ),
                    side_plug,
                    "F45U90Side",
                ),
                front_plug,
                "F45U90Front",
            ),
        }

        direction_specs = tuple(direction_gates)

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attributes = {}

        for suffix in direction_gates:
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[suffix] = attribute

        indicator = _create_indicator(joint, part_key, created_nodes)

        for suffix, gate in direction_gates.items():
            _create_driven_key(
                group + "." + attributes[suffix],
                gate,
                part_key,
                suffix,
                created_nodes,
            )

        config[part_key] = {
            "joint": joint,
            "side": side,
            "part": part,
            "category": category,
            "mode": "hip_swing",
            "knee": knee_joint,
            "separator": separator,
            "attributes": attributes,
            "indicator": indicator,
            "nodes": list(created_nodes),
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "mode": "hip_swing",
        "attributes": dict(attributes),
        "separator": separator,
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


def _build_legs():
    u"""双腿合并修型：两条腿都到位才驱动（左门 × 右门）。

    输入两根大腿关节的 local rotate，方向与大腿一致：
    F90 / U90 / B70 / F45U90。
    """

    part_key = "md_legs"
    left_joint = "Hip1_L"
    right_joint = "Hip1_R"

    for name in (left_joint, right_joint):
        if not cmds.objExists(name):
            raise RuntimeError(u"缺少大腿关节：{}".format(name))

    left_neutral = _read_joint_neutral(left_joint, ("rotateY", "rotateZ"))
    right_neutral = _read_joint_neutral(right_joint, ("rotateY", "rotateZ"))

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()
        group = get_or_create_group("leg")
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        deltas = {}

        for tag, joint, neutral in (
                ("l", left_joint, left_neutral),
                ("r", right_joint, right_neutral),
        ):
            deltas[(tag, "a")] = _build_channel_delta(
                part_key, tag + "a", joint + ".rotateY",
                neutral["rotateY"], created_nodes
            )
            deltas[(tag, "b")] = _build_channel_delta(
                part_key, tag + "b", joint + ".rotateZ",
                neutral["rotateZ"], created_nodes
            )

        gate_cache = {}

        def get_gate(tag, axis, sign, gate_angle):
            key = (tag, axis, sign, gate_angle)

            if key in gate_cache:
                return gate_cache[key]

            gate = _build_gate(
                part_key,
                "{}{}s{}a{}".format(
                    tag, axis, "p" if sign > 0 else "n", int(gate_angle)
                ),
                deltas[(tag, axis)],
                sign,
                gate_angle,
                created_nodes,
            )
            gate_cache[key] = gate

            return gate

        def combine(tag, components):
            sources = [
                get_gate(tag, axis, sign, gate_angle)
                for axis, sign, gate_angle in components
            ]

            if len(sources) == 1:
                return sources[0]

            node = _create(
                "mult_{}_out{}_001".format(part_key, tag),
                "multDoubleLinear",
                created_nodes,
            )
            cmds.connectAttr(sources[0], node + ".input1")
            cmds.connectAttr(sources[1], node + ".input2")

            return node + ".output"

        direction_defs = eight_direction_defs["hip"]

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attributes = {}

        for direction, suffix, components in direction_defs:
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[direction] = attribute

        indicator = _create_indicator(left_joint, part_key, created_nodes)

        for direction, suffix, components in direction_defs:
            left_output = combine("l", components)
            right_output = combine("r", components)

            combo = _create(
                "mult_" + part_key + "_out" + _camel_case(direction) + "_001",
                "multDoubleLinear",
                created_nodes,
            )
            cmds.connectAttr(left_output, combo + ".input1")
            cmds.connectAttr(right_output, combo + ".input2")

            _create_driven_key(
                group + "." + attributes[direction],
                combo + ".output",
                part_key,
                suffix,
                created_nodes,
            )

        config[part_key] = {
            "joint": left_joint,
            "side": "md",
            "part": "legs",
            "category": "leg",
            "mode": "legs",
            "attributes": attributes,
            "separator": separator,
            "indicator": indicator,
            "nodes": list(created_nodes),
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": left_joint,
        "side": "md",
        "part": "legs",
        "category": "leg",
        "mode": "legs",
        "attributes": dict(attributes),
        "separator": separator,
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


def _build_swing(joint, side, part, category, neutral_inverse):
    u"""锁骨这类只摆动、不扭转的多方向部位。"""

    spec = swing_parts[part]
    axis_a, axis_b = spec["swing_axes"]
    part_key = "{}_{}".format(side, part)

    neutral = _read_joint_neutral(joint, (axis_a, axis_b))

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()
        group = get_or_create_group(category)
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        delta_a = _build_channel_delta(
            part_key, "a", joint + "." + axis_a, neutral[axis_a],
            created_nodes
        )
        delta_b = _build_channel_delta(
            part_key, "b", joint + "." + axis_b, neutral[axis_b],
            created_nodes
        )

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attributes = {}
        gate_specs = []

        for name, letter, angle, sign in spec["directions"]:
            suffix = letter + str(int(angle))
            attribute = part_key + "_" + suffix

            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[suffix] = attribute

            delta = delta_a if name in ("up", "down") else delta_b
            gate_specs.append((name, suffix, angle, sign, delta))

        indicator = _create_indicator(joint, part_key, created_nodes)

        for name, suffix, angle, sign, delta in gate_specs:
            gate = _build_gate(
                part_key, name, delta, sign, angle, created_nodes
            )
            _create_driven_key(
                group + "." + attributes[suffix],
                gate,
                part_key,
                suffix,
                created_nodes,
            )

        config[part_key] = {
            "joint": joint,
            "side": side,
            "part": part,
            "category": category,
            "mode": "swing",
            "swing_axes": [axis_a, axis_b],
            "neutral": neutral,
            "separator": separator,
            "attributes": attributes,
            "indicator": indicator,
            "nodes": list(created_nodes),
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "mode": "swing",
        "neutral": dict(neutral),
        "separator": separator,
        "attributes": dict(attributes),
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


def _read_joint_neutral(joint, axes):
    u"""读关节 local rotate 的 neutral 值（相对父级，不叠加父级旋转）。"""

    return {
        axis: float(cmds.getAttr(joint + "." + axis))
        for axis in axes
    }


def _build_multi_angle(joint, side, part, category, neutral, neutral_inverse):
    u"""肘 / 膝：单轴多角度，前弯方向独立叠加。

    Args:
        joint (str): 驱动关节。
        side (str): lf / rt / md。
        part (str): elbow / knee。
        category (str): arm / leg。
        neutral (dict): 中立姿态；None 时读当前旋转。

    Returns:
        dict: 部位信息。
    """

    spec = multi_angle_parts[part]
    axis = spec["axis"]
    letter = spec.get("letter", "F")
    part_key = "{}_{}".format(side, part)

    neutral = _read_joint_neutral(joint, (axis,))

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()
        group = get_or_create_group(category)
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        # 肘/膝读关节 local rotate：ADC 约束驱动会改 local，父级旋转不串
        delta = _build_channel_delta(
            part_key, "x", joint + "." + axis, neutral[axis],
            created_nodes
        )

        # 膝盖这类负向弯曲：把 delta 翻成正向再进门
        if spec.get("sign", 1) < 0:
            delta = _build_multiply_constant(
                part_key, "sign", delta, -1.0, created_nodes
            )

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attributes = {}

        for angle in spec["angles"]:
            suffix = letter + str(int(angle))
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[suffix] = attribute

        indicator = _create_indicator(joint, part_key, created_nodes)

        angles = [int(angle) for angle in spec["angles"]]
        starts = [0.0] + [float(angle) for angle in angles[:-1]]
        gates = []

        for index, angle in enumerate(angles):
            start = starts[index]
            gates.append(
                _build_gate_between(
                    part_key,
                    "g" + str(index),
                    delta,
                    start,
                    float(angle) - start,
                    created_nodes,
                )
            )

        for index, angle in enumerate(angles):
            suffix = letter + str(angle)

            if index == 0 and len(angles) > 1:
                # 第一段过目标后交棒；后续段达到后保持
                value = _build_subtract(
                    part_key,
                    suffix,
                    gates[0],
                    gates[1],
                    created_nodes,
                )
            else:
                value = gates[index]

            _create_driven_key(
                group + "." + attributes[suffix],
                value,
                part_key,
                suffix,
                created_nodes,
            )

        config[part_key] = {
            "joint": joint,
            "side": side,
            "part": part,
            "category": category,
            "mode": "multi_angle",
            "axis": axis,
            "angles": [int(angle) for angle in spec["angles"]],
            "neutral": neutral,
            "separator": separator,
            "attributes": attributes,
            "indicator": indicator,
            "nodes": list(created_nodes),
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "mode": "multi_angle",
        "neutral": dict(neutral),
        "separator": separator,
        "attributes": dict(attributes),
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


def _build_four_twist(joint, side, part, category, neutral, neutral_inverse):
    u"""腕 / 踝：四方向摆动 + 双向扭转，各自独立叠加。

    Args:
        joint (str): 驱动关节。
        side (str): lf / rt / md。
        part (str): wrist / ankle。
        category (str): arm / leg。
        neutral (dict): 中立姿态；None 时读当前旋转。

    Returns:
        dict: 部位信息。
    """

    spec = four_twist_parts[part]
    axis_a, axis_b = spec["swing_axes"]
    twist_axis = spec["twist_axis"]
    twist_angle = int(spec["twist_angle"])
    part_key = "{}_{}".format(side, part)

    neutral = _read_joint_neutral(joint, (axis_a, axis_b, twist_axis))

    created_nodes = []
    added_attrs = []
    group = None

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverBuild")

    try:
        ensure_all_groups()
        group = get_or_create_group(category)
        config = read_group_config(group)

        if part_key in config:
            _remove_part(group, config, part_key)

        # 读关节 local rotate：ADV 约束驱动会改 local，父级旋转不串
        delta_a = _build_channel_delta(
            part_key, "a", joint + "." + axis_a, neutral[axis_a],
            created_nodes
        )
        delta_b = _build_channel_delta(
            part_key, "b", joint + "." + axis_b, neutral[axis_b],
            created_nodes
        )
        delta_t = _build_channel_delta(
            part_key, "tw", joint + "." + twist_axis, neutral[twist_axis],
            created_nodes
        )

        separator = "sep_" + part_key
        _add_separator(group, separator)
        added_attrs.append(separator)

        attributes = {}
        swing_specs = []

        for name, letter, angle, sign in spec["directions"]:
            suffix = letter + str(int(angle))
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[suffix] = attribute
            swing_specs.append((
                name,
                suffix,
                angle,
                sign,
                delta_a if name in ("up", "down") else delta_b,
            ))

        twist_specs = (
            ("twP", "TwsP" + str(twist_angle), 1),
            ("twN", "TwsN" + str(twist_angle), -1),
        )

        for role, suffix, sign in twist_specs:
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            added_attrs.append(attribute)
            attributes[suffix] = attribute

        indicator = _create_indicator(joint, part_key, created_nodes)

        for name, suffix, angle, sign, delta in swing_specs:
            gate = _build_gate(
                part_key, name, delta, sign, angle, created_nodes
            )
            _create_driven_key(
                group + "." + attributes[suffix],
                gate,
                part_key,
                suffix,
                created_nodes,
            )

        for role, suffix, sign in twist_specs:
            gate = _build_gate(
                part_key, role, delta_t, sign,
                float(spec.get("twist_gate_angle", twist_angle)),
                created_nodes
            )
            _create_driven_key(
                group + "." + attributes[suffix],
                gate,
                part_key,
                suffix,
                created_nodes,
            )

        config[part_key] = {
            "joint": joint,
            "side": side,
            "part": part,
            "category": category,
            "mode": "four_twist",
            "swing_axes": [axis_a, axis_b],
            "twist_axis": twist_axis,
            "twist_angle": twist_angle,
            "neutral": neutral,
            "separator": separator,
            "attributes": attributes,
            "indicator": indicator,
            "nodes": list(created_nodes),
        }

        _write_config(group, config)

    except Exception:
        for attribute in added_attrs:
            if group and cmds.attributeQuery(attribute, node=group, exists=True):
                try:
                    cmds.setAttr(group + "." + attribute, lock=False)
                except RuntimeError:
                    pass

                cmds.deleteAttr(group + "." + attribute)

        _delete_nodes(created_nodes)
        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    cmds.select(group, replace=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "mode": "four_twist",
        "neutral": dict(neutral),
        "separator": separator,
        "attributes": dict(attributes),
        "indicator": indicator,
        "nodes": list(created_nodes),
    }


def build_from_config(config):
    u"""按配置字典构建一个部位。

    Args:
        config (dict): 至少包含 joint / axes / angle / directions。

    Returns:
        dict: build_network 的返回值。
    """

    return build_network(
        config["joint"],
        axes=config.get("axes", default_axes),
        angle=config.get("angle", default_angle),
        directions=config.get("directions"),
        neutral=config.get("neutral"),
        angle_map=config.get("angle_map"),
        neutral_inverse=config.get("neutral_inverse"),
    )


def rebuild_network(network, **overrides):
    u"""按原配置重新构建一个部位。

    Args:
        network (dict): build_network 的返回值。
        **overrides: 需要覆盖的配置项。

    Returns:
        dict: 新部位信息。
    """

    group = _resolve_group(network)
    part_key = _resolve_part_key(network)
    config = read_group_config(group).get(part_key)

    if not config:
        raise RuntimeError(u"找不到部位配置，收到：{}".format(part_key))

    config = dict(config)
    config.update(overrides)

    delete_part(group, part_key)

    return build_from_config(config)


def mirror_config(config, target_joint):
    u"""生成镜像侧的配置。

    Args:
        config (dict): 源侧配置。
        target_joint (str): 目标关节。

    Returns:
        dict: 新配置，neutral 与逆矩阵都从目标关节重新读取。
    """

    validate_joint(target_joint)

    mirrored = dict(config)
    mirrored["joint"] = target_joint
    mirrored["neutral"] = get_neutral_rotate(
        target_joint, _config_axes(config)
    )
    mirrored["neutral_inverse"] = get_world_inverse(target_joint)

    return mirrored


def _config_axes(config):
    u"""收集配置里用到的所有旋转轴。"""

    axes = []

    for key in ("axes", "swing_axes"):
        for axis in config.get(key) or []:
            if axis not in axes:
                axes.append(axis)

    for key in ("axis", "twist_axis"):
        axis = config.get(key)

        if axis and axis not in axes:
            axes.append(axis)

    return tuple(axes) or axis_list


# ----------------------------------------------------------------------
# 删除
# ----------------------------------------------------------------------

def delete_part(group, part_key):
    u"""删除一个部位的属性、节点与配置。

    Args:
        group (str): 汇总组。
        part_key (str): <side>_<part>。

    Raises:
        RuntimeError: 组或部位不存在。
    """

    _validate_group(group)
    config = read_group_config(group)

    if part_key not in config:
        raise RuntimeError(
            u"组上没有该部位，收到：{} / {}".format(group, part_key)
        )

    cmds.undoInfo(openChunk=True, chunkName="PoseDriverDelete")

    try:
        _remove_part(group, config, part_key)
    finally:
        cmds.undoInfo(closeChunk=True)


def delete_network(network):
    u"""按 build_network 的返回值删除对应部位。"""

    delete_part(_resolve_group(network), _resolve_part_key(network))


# ----------------------------------------------------------------------
# 查询
# ----------------------------------------------------------------------

def read_weights(network):
    u"""读回当前部位的方向权重。

    Args:
        network (dict): build_network 的返回值。

    Returns:
        dict: {方向名: 权重}
    """

    group = _resolve_group(network)
    part_key = _resolve_part_key(network)
    config = read_group_config(group).get(part_key) or {}

    return {
        direction: float(cmds.getAttr(group + "." + attribute))
        for direction, attribute in (config.get("attributes") or {}).items()
    }


def get_part_list(group):
    u"""列出组上已配置的部位。

    Args:
        group (str): 汇总组。

    Returns:
        list: 部位 key 列表。
    """

    return sorted(read_group_config(group))


def find_supported_joints():
    u"""按 ADV 固定关节名扫描场景，返回支持八方向的关节。

    只返回 Shoulder / Hip（五段式的 arm / thigh），其余关节留给 v2。

    Returns:
        list: [{"joint": ..., "short": ..., "side": ..., "part": ...}, ...]
    """

    found = []

    for joint_name, (side, part, category) in adv_joint_map.items():
        if part not in supported_parts:
            continue

        if not cmds.objExists(joint_name):
            continue

        found.append({
            "joint": joint_name,
            "short": joint_name,
            "side": side,
            "part": part,
            "category": category,
        })

    if cmds.objExists("Hip1_L") and cmds.objExists("Hip1_R"):
        found.append({
            "joint": "md_legs",
            "short": "md_legs",
            "side": "md",
            "part": "legs",
            "category": "leg",
        })

    for finger, base in finger_defs.items():
        for suffix, side in (("_L", "lf"), ("_R", "rt")):
            name = base + "1" + suffix

            if not cmds.objExists(name):
                continue

            found.append({
                "joint": name,
                "short": name,
                "side": side,
                "part": finger,
                "category": "finger",
            })

    found.sort(key=lambda item: (item["category"], item["side"]))

    return found


def build_all_supported(
    axes=default_axes,
    angle=default_angle,
    directions=None,
    angle_map=None,
    blendshape=None,
):
    u"""给场景里所有支持八方向的关节建驱动属性。

    Args:
        axes (tuple): 两根旋转轴。
        angle (float): 默认阈值角度。
        directions (iterable): 启用的方向。
        angle_map (dict): 每方向阈值覆盖。
        blendshape (str): 档案记录的 blendShape 节点名，连接 BS 时按它来。

    Returns:
        tuple: (results, errors)，errors 是 [(关节, 错误信息), ...]。
    """

    results = []
    errors = []

    for item in find_supported_joints():
        try:
            results.append(
                build_network(
                    item["joint"],
                    axes=axes,
                    angle=angle,
                    directions=directions,
                    angle_map=angle_map,
                    blendshape=blendshape,
                )
            )
        except Exception as error:
            errors.append((item["short"], str(error)))

    try:
        build_skirt_links()
    except Exception as error:
        errors.append(("skirt", str(error)))

    return results, errors


def _find_blendshape_node(blendshapes, target_name):
    u"""按 target alias 找对应的 blendShape 节点。"""

    target = _find_blendshape_target(blendshapes, target_name)

    if target:
        return target.split(".")[0]

    return None


def discover_blendshapes():
    u"""扫描场景里的 blendShape，把 target 名与属性名匹配的 BS 记进档案。

    只在档案里还没有 BS 记录的部位上补，不覆盖已有记录。

    Returns:
        int: 新记录的部位数。
    """

    blendshapes = cmds.ls(type="blendShape") or []
    recorded = 0

    for category in group_names:
        group = get_group_name(category)

        if not cmds.objExists(group):
            continue

        config = read_group_config(group)
        changed = False

        for entry in config.values():
            attributes = entry.get("attributes", {})

            if not attributes or entry.get("blendshape"):
                continue

            for attribute in attributes.values():
                blendshape = _find_blendshape_node(blendshapes, attribute)

                if not blendshape:
                    continue

                entry["blendshape"] = blendshape
                changed = True
                recorded += 1
                break

        if changed:
            _write_config(group, config)

    return recorded


def connect_attributes_to_blendshapes():
    u"""按档案里记录的 blendShape 节点连接修型属性（强制连接）。

    档案里没有 BS 记录时先自动扫描补一次；连接时只认档案。

    Returns:
        tuple: (连接数量, 未匹配的属性名列表)。
    """

    discover_blendshapes()

    connected = 0
    missing = []

    for category in group_names:
        group = get_group_name(category)

        if not cmds.objExists(group):
            continue

        config = read_group_config(group)

        for entry in config.values():
            attributes = entry.get("attributes", {})

            if not attributes:
                continue

            bsname = entry.get("blendshape")

            if not bsname or not cmds.objExists(bsname):
                missing.extend(attributes.values())
                continue

            for suffix, attribute in attributes.items():
                target = _find_blendshape_target([bsname], attribute)

                if not target:
                    missing.append(attribute)
                    continue

                plug = group + "." + attribute

                # 不能断开属性自己的输入（driven key 曲线），
                # force=True 只会覆盖 BS weight 上的旧连接
                cmds.connectAttr(plug, target, force=True)
                connected += 1

    return connected, missing


def _find_blendshape_target(blendshapes, target_name):
    u"""按 target alias 找 blendShape 权重 plug；找不到返回 None。"""

    for blendshape in blendshapes:
        aliases = cmds.aliasAttr(blendshape, query=True) or []

        for index in range(0, len(aliases) - 1, 2):
            if aliases[index] == target_name:
                return blendshape + "." + aliases[index + 1]

    return None


def _invert_mesh_shape(base_mesh, source_mesh, name):
    u"""求 source 相对 base 的逆变形：target = 2 × base − source。

    Maya 2023 没有 cmds.invertShape，这里按顶点镜像自己算。
    """

    base_vertices = cmds.ls(base_mesh + ".vtx[*]", flatten=True) or []
    source_vertices = cmds.ls(source_mesh + ".vtx[*]", flatten=True) or []

    if len(base_vertices) != len(source_vertices):
        raise RuntimeError(u"两个 mesh 顶点数不一致，无法求逆")

    from maya.api import OpenMaya

    def mesh_shape(name):
        shapes = cmds.listRelatives(name, shapes=True) or []
        shapes = [shape for shape in shapes if cmds.objectType(shape) == "mesh"]

        if not shapes:
            raise RuntimeError(u"{} 不是 mesh".format(name))

        return shapes[0]

    def read_points(mesh):
        selection = OpenMaya.MSelectionList()
        selection.add(mesh_shape(mesh))
        fn_mesh = OpenMaya.MFnMesh(selection.getDependNode(0))

        return fn_mesh.getPoints(OpenMaya.MSpace.kObject)

    base_points = read_points(base_mesh)
    source_points = read_points(source_mesh)

    inverted_points = OpenMaya.MPointArray()

    for index in range(len(base_points)):
        inverted_points.append(OpenMaya.MPoint(
            2.0 * base_points[index].x - source_points[index].x,
            2.0 * base_points[index].y - source_points[index].y,
            2.0 * base_points[index].z - source_points[index].z,
        ))

    duplicated = cmds.duplicate(source_mesh, name=name, rr=True)[0]

    selection = OpenMaya.MSelectionList()
    selection.add(mesh_shape(duplicated))
    fn_mesh = OpenMaya.MFnMesh(selection.getDependNode(0))
    fn_mesh.setPoints(inverted_points)

    return duplicated


def add_inverse_shape_target(bsname, source_mesh, base_mesh, target_name=None):
    u"""给 blendShape 添加一个 inverse shape target。

    与公司旧工具的区别：添加前会把 BS 里已有 target 的权重临时清零。
    普通 BS 是叠加式的，已有修正非 0 时 invertShape 会把旧修正算进去，
    手肘 F120 这类已有修型最满的姿态就会出错。

    Args:
        bsname (str): blendShape 节点。
        source_mesh (str): 传递用的 mesh（duplicate 后参与 invertShape）。
        base_mesh (str): 被传递的 mesh（BS 作用的目标）。
        target_name (str): 可选，target 名称。

    Returns:
        str: 新 target 的 weight 属性名。
    """

    if not cmds.objExists(bsname):
        raise RuntimeError(u"场景里不存在 BS 节点：{}".format(bsname))

    if cmds.objectType(bsname) != "blendShape":
        raise RuntimeError(u"{} 不是 blendShape 节点".format(bsname))

    if not cmds.objExists(source_mesh) or not cmds.objExists(base_mesh):
        raise RuntimeError(u"传递 mesh 或目标 mesh 不存在")

    weights = cmds.listAttr(bsname + ".weight", multi=True) or []
    saved = {}

    for attribute in weights:
        plug = bsname + "." + attribute
        saved[plug] = cmds.getAttr(plug)

    envelope = cmds.getAttr(bsname + ".envelope")

    cmds.setAttr(bsname + ".envelope", 0)

    # 关键：已有 target 的权重也要清 0，否则 invertShape 会把旧修正算进去
    for plug in saved:
        cmds.setAttr(plug, 0.0)

    duplicated = None
    inverted = None

    try:
        duplicated = cmds.duplicate(source_mesh, rr=True)[0]
        inverted = _invert_mesh_shape(
            base_mesh, duplicated, "inverse_" + str(target_name or "target")
        )

        index = len(weights)

        cmds.blendShape(
            bsname, edit=True, t=(base_mesh, index, inverted, 1.0)
        )

        if target_name:
            cmds.aliasAttr(
                target_name, bsname + ".weight[{}]".format(index)
            )

    finally:
        cmds.setAttr(bsname + ".envelope", envelope)

        for plug, value in saved.items():
            cmds.setAttr(plug, value)

        for node in (duplicated, inverted):
            if node and cmds.objExists(node):
                cmds.delete(node)

    return bsname + ".weight[{}]".format(len(weights))


def transfer_wrap_shapes(source_mesh, target_mesh):
    u"""把旧模型上的 blendShape target 与连接通过 wrap 复制到新模型。

    Args:
        source_mesh (str): 旧模型（带修型与连接）。
        target_mesh (str): 新模型（接收修型）。

    Returns:
        dict: {"blendshape": 新 BS, "targets": 新 target 数, "connections": 复制连接数}。
    """

    source_shape = (cmds.listRelatives(source_mesh, shapes=True) or [source_mesh])[0]
    target_shape = (cmds.listRelatives(target_mesh, shapes=True) or [target_mesh])[0]

    source_blendshapes = cmds.listConnections(source_shape, type="blendShape") or []

    if not source_blendshapes:
        raise RuntimeError(u"源模型上没有 blendShape")

    source_bs = source_blendshapes[0]
    weights = cmds.listAttr(source_bs + ".weight", multi=True) or []

    if not weights:
        raise RuntimeError(u"源 blendShape 没有 target")

    saved = {
        attribute: cmds.getAttr(source_bs + "." + attribute)
        for attribute in weights
    }

    alias_list = cmds.aliasAttr(source_bs, query=True) or []
    alias_map = {}

    for index in range(0, len(alias_list) - 1, 2):
        alias_map[alias_list[index + 1]] = alias_list[index]

    target_blendshapes = cmds.listConnections(target_shape, type="blendShape") or []

    if target_blendshapes:
        target_bs = target_blendshapes[0]
        next_index = len(cmds.listAttr(target_bs + ".weight", multi=True) or [])
    else:
        target_bs = cmds.blendShape(
            target_mesh, name="blendShape_" + target_mesh.split("|")[-1]
        )[0]
        next_index = 0

    driver = cmds.duplicate(source_mesh, rr=True)[0]
    wrap_node = cmds.deformer(target_mesh, type="wrap")[0]
    cmds.connectAttr(driver + ".worldMesh[0]", wrap_node + ".wrapMesh", force=True)

    created = []
    targets = 0

    try:
        for attribute in weights:
            for name in weights:
                cmds.setAttr(source_bs + "." + name, 0.0)

            cmds.setAttr(source_bs + "." + attribute, 1.0)

            shape = cmds.duplicate(target_mesh, rr=True)[0]
            created.append(shape)

            cmds.blendShape(
                target_bs, edit=True,
                t=(target_mesh, next_index, shape, 1.0)
            )

            alias = alias_map.get(attribute)

            if alias:
                cmds.aliasAttr(
                    alias, target_bs + ".weight[{}]".format(next_index)
                )

            next_index += 1
            targets += 1

    finally:
        for attribute, value in saved.items():
            cmds.setAttr(source_bs + "." + attribute, value)

        for node in created + [driver, wrap_node]:
            if node and cmds.objExists(node):
                cmds.delete(node)

    connections = 0

    for offset, attribute in enumerate(weights):
        sources = cmds.listConnections(
            source_bs + "." + attribute,
            source=True, destination=False, plugs=True
        ) or []

        for source in sources:
            cmds.connectAttr(
                source,
                target_bs + ".weight[{}]".format(offset),
                force=True
            )
            connections += 1

    return {
        "blendshape": target_bs,
        "targets": targets,
        "connections": connections,
    }


def delete_all_parts():
    u"""删除四个汇总组上所有部位，组保留。

    Returns:
        int: 删除的部位数量。
    """

    removed = 0

    for category in group_names:
        group = get_group_name(category)

        if not cmds.objExists(group):
            continue

        config = read_group_config(group)

        for part_key in list(config):
            delete_part(group, part_key)
            removed += 1

    _clear_skirt_links()

    # 连组一起删：总组删掉后，四个汇总组和裙子组会跟着消失
    if cmds.objExists(master_group_name):
        cmds.delete(master_group_name)

    return removed


# ----------------------------------------------------------------------
# 内部：解析
# ----------------------------------------------------------------------

def _direction_suffix(part, direction):
    u"""返回方向属性后缀，支持按部位覆盖单轴命名角度。"""

    overrides = eight_direction_angle_overrides.get(part) or {}
    angle = overrides.get(direction)

    if angle:
        letter = {
            "up": "U",
            "down": "D",
            "front": "F",
            "back": "B",
        }.get(direction)

        if letter:
            return letter + str(int(angle))

    return direction_suffix[direction]


def _parse_adv_name(short_name):
    u"""解析 ADV 命名，例如 Shoulder_L / Spine1。"""

    core = short_name

    if core.lower().startswith("adv_"):
        core = core[4:]

    if core.endswith("_L"):
        side = "lf"
        core = core[:-2]
    elif core.endswith("_R"):
        side = "rt"
        core = core[:-2]
    else:
        side = "md"

    part = core.lower()
    category = part_category.get(part)

    if not category:
        return None

    return side, part, category


def _parse_five_part_name(short_name):
    u"""解析五段式命名，例如 jnt_lf_arm_bind_001。"""

    parts = short_name.split("_")

    if len(parts) < 5 or parts[1] not in ("lf", "rt", "md"):
        return None

    part = "_".join(parts[2:-2])
    category = part_category.get(part)

    if not category:
        return None

    return parts[1], part, category


# ----------------------------------------------------------------------
# 内部：节点网络
# ----------------------------------------------------------------------

def _create(name, node_type, nodes):
    u"""创建节点并登记到清理列表。"""

    node = cmds.createNode(node_type, name=name)
    nodes.append(node)

    return node


def _resolve_angle_map(angle, angle_map):
    u"""把每方向阈值补全成完整字典。

    Args:
        angle (float): 默认阈值。
        angle_map (dict): 覆盖项；None 时后摆用默认 70°，其余用 angle。

    Returns:
        dict: {方向: 阈值}

    Raises:
        ValueError: 某个方向的阈值不是正数。
    """

    overrides = dict(angle_map) if angle_map is not None else {
        "back": default_back_angle
    }

    resolved = {}

    for direction in pose_gate_math.direction_list:
        value = float(overrides.get(direction, angle))

        if value <= 0.0:
            raise ValueError(
                u"方向阈值必须大于 0，收到：{} / {}".format(
                    direction, value
                )
            )

        resolved[direction] = value

    return resolved


def _build_total_angle(part_key, role, joint, neutral_inverse, nodes):
    u"""建相对 neutral 的总旋转角（0 ~ 180）。

    单轴部位（肘/膝）用总角度就够：转了 85° 就是 85°，
    不关心绕哪个世界轴，也就绕开了轴不匹配的问题。

    Returns:
        str: 角度输出 plug。
    """

    relative = _create(
        "mult_" + part_key + "_" + role + "Rel_001",
        "multMatrix",
        nodes,
    )
    cmds.setAttr(
        relative + ".matrixIn[0]", *neutral_inverse, type="matrix"
    )
    cmds.connectAttr(joint + ".worldMatrix[0]", relative + ".matrixIn[1]")

    decompose = _create(
        "decompose_" + part_key + "_" + role + "_001",
        "decomposeMatrix",
        nodes,
    )
    cmds.connectAttr(relative + ".matrixSum", decompose + ".inputMatrix")

    expr = _create(
        "expr_" + part_key + "_" + role + "_001", "expression", nodes
    )
    cmds.addAttr(expr, longName="quatW", attributeType="double")
    cmds.addAttr(expr, longName="angleTotal", attributeType="double")
    cmds.setAttr(expr + ".quatW", keyable=False, channelBox=False)
    cmds.setAttr(expr + ".angleTotal", keyable=False, channelBox=False)
    cmds.connectAttr(decompose + ".outputQuatW", expr + ".quatW")

    cmds.expression(
        expr,
        edit=True,
        string=u"\n".join([
            u"float $qw = abs({0}.quatW);".format(expr),
            u"if ($qw > 1.0) { $qw = 1.0; }",
            u"{0}.angleTotal = 2 * acos($qw) "
            u"* 57.29577951308232;".format(expr),
        ]),
    )

    return expr + ".angleTotal"


def _build_delta(part_key, role, joint, axis, neutral_inverse, nodes):
    u"""建 delta = 相对 neutral 的绕轴旋转角（四元数法）。

    读 worldMatrix，先乘 neutral 的逆矩阵得到相对旋转，
    再分解成四元数，用 2 * atan2(q_axis, q_w) 算绕轴角度。
    这样超过 90°、接近 180° 都不会像欧拉分解那样跳变。

    Args:
        part_key (str): 部位 key。
        role (str): 节点角色后缀。
        joint (str): 关节。
        axis (str): rotateX / rotateY / rotateZ。
        neutral_inverse (list): neutral 世界矩阵的逆。
        nodes (list): 节点清理清单。

    Returns:
        str: 角度输出 plug。
    """

    relative = _create(
        "mult_" + part_key + "_" + role + "Rel_001",
        "multMatrix",
        nodes,
    )
    cmds.setAttr(
        relative + ".matrixIn[0]", *neutral_inverse, type="matrix"
    )
    cmds.connectAttr(joint + ".worldMatrix[0]", relative + ".matrixIn[1]")

    decompose = _create(
        "decompose_" + part_key + "_" + role + "_001",
        "decomposeMatrix",
        nodes,
    )
    cmds.connectAttr(relative + ".matrixSum", decompose + ".inputMatrix")

    expr = _create(
        "expr_" + part_key + "_" + role + "_001", "expression", nodes
    )

    for attribute in (
        "quatX", "quatY", "quatZ", "quatW",
        "angleX", "angleY", "angleZ",
    ):
        cmds.addAttr(expr, longName=attribute, attributeType="double")
        cmds.setAttr(expr + "." + attribute, keyable=False, channelBox=False)

    for source, target in (
        ("outputQuatX", "quatX"),
        ("outputQuatY", "quatY"),
        ("outputQuatZ", "quatZ"),
        ("outputQuatW", "quatW"),
    ):
        cmds.connectAttr(
            decompose + "." + source, expr + "." + target
        )

    cmds.expression(
        expr,
        edit=True,
        string=u"\n".join([
            u"float $qx = {0}.quatX;".format(expr),
            u"float $qy = {0}.quatY;".format(expr),
            u"float $qz = {0}.quatZ;".format(expr),
            u"float $qw = {0}.quatW;".format(expr),
            # 四元数 q 与 -q 表示同一旋转，先统一到 w >= 0，
            # 否则 -120° 会被 atan2 算成 +240°。
            u"if ($qw < 0) {"
            u" $qx = -$qx; $qy = -$qy; $qz = -$qz; $qw = -$qw; }",
            u"{0}.angleX = 2 * atan2($qx, $qw) "
            u"* 57.29577951308232;".format(expr),
            u"{0}.angleY = 2 * atan2($qy, $qw) "
            u"* 57.29577951308232;".format(expr),
            u"{0}.angleZ = 2 * atan2($qz, $qw) "
            u"* 57.29577951308232;".format(expr),
        ]),
    )

    return expr + ".angle" + axis[len("rotate"):]


def _build_gate(part_key, role, delta_plug, sign, angle, nodes):
    u"""建单个方向门：clamp(sign * delta / angle, 0, 1) 线性 0-1。

    平滑交给后面的 driven key 曲线，绑定师可以自己调形状。
    """

    scale = _create(
        "mult_" + part_key + "_" + role + "Scale_001",
        "multDoubleLinear",
        nodes,
    )
    cmds.connectAttr(delta_plug, scale + ".input1")
    cmds.setAttr(scale + ".input2", float(sign) / float(angle))

    clamp_node = _create(
        "clamp_" + part_key + "_" + role + "Clamp_001",
        "clamp",
        nodes,
    )
    cmds.setAttr(clamp_node + ".minR", 0.0)
    cmds.setAttr(clamp_node + ".maxR", 1.0)
    cmds.connectAttr(scale + ".output", clamp_node + ".inputR")

    return clamp_node + ".outputR"


def _build_free(part_key, role, gate_plugs, nodes):
    u"""建另一轴余量：1 − (方向门1 + 方向门2)。"""

    amount = _create(
        "plus_" + part_key + "_" + role + "Amount_001",
        "plusMinusAverage",
        nodes,
    )

    for index, plug in enumerate(gate_plugs):
        cmds.connectAttr(plug, amount + ".input1D[{}]".format(index))

    reverse_node = _create(
        "reverse_" + part_key + "_" + role + "Free_001",
        "reverse",
        nodes,
    )
    cmds.connectAttr(amount + ".output1D", reverse_node + ".inputX")

    return reverse_node + ".outputX"


def _combo_sources(gates, free_a, free_b):
    u"""返回每个方向两个乘数的来源 plug。"""

    return {
        "up": (gates["up"], free_b),
        "down": (gates["down"], free_b),
        "front": (gates["front"], free_a),
        "back": (gates["back"], free_a),
        "front_up": (gates["front"], gates["up"]),
        "front_down": (gates["front"], gates["down"]),
        "back_up": (gates["back"], gates["up"]),
        "back_down": (gates["back"], gates["down"]),
    }


def _create_indicator(joint, part_key, nodes):
    u"""在关节旁建一个姿态方向指示器。

    指示器 parent 到关节，随关节转动，用来直观显示当前方向；
    它不参与任何驱动计算。

    Args:
        joint (str): 驱动关节。
        part_key (str): <side>_<part>，用于命名。
        nodes (list): 节点清理清单。

    Returns:
        str: locator 名。
    """

    locator = cmds.spaceLocator(name="loc_" + part_key + "_pos_001")[0]
    nodes.append(locator)

    cmds.matchTransform(locator, joint, position=True)
    cmds.parent(locator, joint)

    for axis in ("X", "Y", "Z"):
        cmds.setAttr(locator + ".localScale" + axis, 2.0)

    return locator


def _create_driven_key(driven_plug, driver_plug, part_key, direction, nodes):
    u"""用 driven key 曲线连接方向门与组属性。

    曲线两个端点：driver 0 → 值 0，driver 1 → 值 1，默认线性切线。
    绑定师可以在 Graph Editor 里改曲线形状，调整过渡手感。

    Args:
        driven_plug (str): 组属性 plug，例如 grp.xxx.lf_shoulder_U90。
        driver_plug (str): 方向门输出 plug。
        part_key (str): 部位 key，用于曲线命名。
        direction (str): 方向名。
        nodes (list): 节点清理清单。
    """

    cmds.setDrivenKeyframe(
        driven_plug,
        currentDriver=driver_plug,
        driverValue=0.0,
        value=0.0,
    )
    cmds.setDrivenKeyframe(
        driven_plug,
        currentDriver=driver_plug,
        driverValue=1.0,
        value=1.0,
    )

    curves = cmds.listConnections(
        driven_plug, source=True, destination=False, type="animCurve"
    ) or []

    for curve in curves:
        # 只有两端关键帧、中间不留点；auto 切线得到平滑 S 形。
        # 注意：两点曲线不能用 fixed 切线（Maya 会算出负值过冲）。
        cmds.keyTangent(curve, inTangentType="auto", outTangentType="auto")

        renamed = cmds.rename(
            curve, "anim_" + part_key + "_" + direction + "_001"
        )
        nodes.append(renamed)


# ----------------------------------------------------------------------
# 内部：属性
# ----------------------------------------------------------------------

def _add_owner_attrs(group):
    u"""给组加所有权与配置属性。"""

    cmds.addAttr(group, longName=owner_attr, dataType="string")
    cmds.setAttr(group + "." + owner_attr, owner_value, type="string")
    cmds.setAttr(group + "." + owner_attr, keyable=False, channelBox=False)

    cmds.addAttr(group, longName=config_attr, dataType="string")
    cmds.setAttr(group + "." + config_attr, "{}", type="string")
    cmds.setAttr(group + "." + config_attr, keyable=False, channelBox=False)


def _hide_transform_attrs(node):
    u"""隐藏默认 transform 属性，Channel Box 只留方向属性。"""

    for attr in hidden_transform_attrs:
        if not cmds.attributeQuery(attr, node=node, exists=True):
            continue

        cmds.setAttr(node + "." + attr, keyable=False, channelBox=False)


def _add_separator(group, name):
    u"""添加锁定分隔属性，作为 Channel Box 的视觉分隔。"""

    if cmds.attributeQuery(name, node=group, exists=True):
        cmds.deleteAttr(group + "." + name)

    cmds.addAttr(
        group, longName=name, attributeType="double", defaultValue=0.0
    )
    cmds.setAttr(group + "." + name, keyable=False, channelBox=True, lock=True)


def _add_weight_attr(group, name):
    u"""添加一个方向权重属性。"""

    if cmds.attributeQuery(name, node=group, exists=True):
        cmds.deleteAttr(group + "." + name)

    cmds.addAttr(
        group,
        longName=name,
        attributeType="double",
        minValue=0.0,
        maxValue=1.0,
        defaultValue=0.0,
    )
    cmds.setAttr(group + "." + name, keyable=False, channelBox=True)


def _write_config(group, config):
    u"""把配置序列化回组上的字符串属性。"""

    cmds.setAttr(
        group + "." + config_attr,
        json.dumps(config, ensure_ascii=False),
        type="string",
    )


def _remove_part(group, config, part_key):
    u"""删除部位属性、节点与配置项，组保留。"""

    part = config.get(part_key) or {}

    attribute_names = list((part.get("attributes") or {}).values())

    separator = part.get("separator")

    if separator:
        attribute_names.append(separator)

    for attribute in attribute_names:
        if not cmds.attributeQuery(attribute, node=group, exists=True):
            continue

        plug = group + "." + attribute

        # 分隔属性是锁定的，deleteAttr 之前必须先解锁
        try:
            cmds.setAttr(plug, lock=False)
        except RuntimeError:
            pass

        sources = cmds.listConnections(
            plug, source=True, destination=False, plugs=True
        ) or []

        for source in sources:
            cmds.disconnectAttr(source, plug)

        cmds.deleteAttr(plug)

    _delete_nodes(part.get("nodes") or [])

    config.pop(part_key, None)
    _write_config(group, config)


def _delete_nodes(nodes):
    u"""按创建反序删除节点；单个失败不影响其余清理。"""

    for node in reversed(nodes):
        if not cmds.objExists(node):
            continue

        try:
            cmds.delete(node)
        except RuntimeError:
            continue


def _validate_group(group):
    u"""校验节点是本工具创建的汇总组；旧组缺标记时补上。"""

    hierarchy_utils.validate_node(group, u"汇总组")

    if not cmds.attributeQuery(owner_attr, node=group, exists=True):
        # 旧版本/手动建的组：补上 owner 标记，不直接报错
        cmds.addAttr(group, longName=owner_attr, dataType="string")
        cmds.setAttr(group + "." + owner_attr, owner_value, type="string")
        return

    if cmds.getAttr(group + "." + owner_attr) != owner_value:
        cmds.setAttr(group + "." + owner_attr, owner_value, type="string")


def _resolve_group(network):
    u"""从 dict 或组名取出汇总组并校验。"""

    if isinstance(network, dict):
        group = network.get("group")
    else:
        group = network

    _validate_group(group)

    return group


def _resolve_part_key(network):
    u"""从 dict 取出部位 key。"""

    if not isinstance(network, dict):
        raise RuntimeError(u"需要 build_network 返回的部位信息。")

    part_key = network.get("part_key")

    if not part_key:
        raise RuntimeError(u"部位信息缺少 part_key。")

    return part_key


def _camel_case(name):
    u"""front_up -> FrontUp，用于中间节点名。"""

    return "".join(part.capitalize() for part in name.split("_"))
