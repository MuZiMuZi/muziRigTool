# coding=utf-8
"""RBF 版姿态驱动修型：独立工具，输入 ADV 关节 local rotate，输出到 grp_rbf_* 组。

与 pose_driver（方向门控版）并存，互不影响：
- 组名独立：grp_rbf_all_pose_001 / grp_rbf_arm_pose_001 ...
- 属性名沿用 <side>_<part>_<方向><角度>，方便对照
- 每个部位一个 expression 节点，系数在构建时训练并编译成 MEL 常量
"""

import json
import math

from maya import cmds

from . import rbf_weight_math

rbf_master_group = "grp_rbf_all_pose_001"

rbf_group_names = {
    "arm": "grp_rbf_arm_pose_001",
    "spine": "grp_rbf_spine_pose_001",
    "leg": "grp_rbf_leg_pose_001",
    "finger": "grp_rbf_finger_pose_001",
}

rbf_sigma = 45.0
# 输入已经是角度，直接用原始距离；scale 不再归一化，否则核值全接近 1 矩阵会病态
rbf_scales = (1.0, 1.0, 1.0)

rbf_owner_attr = "rbfPoseOwner"
rbf_owner_value = "muziRigTool.rbfPoseDriver"
rbf_config_attr = "rbfPoseConfig"


def _number(value):
    u"""生成带小数点的 MEL 浮点常量。"""

    text = "{:.17g}".format(float(value))

    if "." not in text and "e" not in text:
        text += ".0"

    return text


def _suffix(letter, angle):
    u"""方向字母 + 角度，例如 U90。"""

    return letter + str(int(angle))


def _eight_samples(side, part, angles):
    u"""八方向样本：[(后缀, (x, y, z))]。

    轴约定与 pose_driver 一致：A 轴 = rotateY（上下），B 轴 = rotateZ（前后）。
    """

    up, down, front, back = angles
    hand = part in ("shoulder",)

    rows = [
        (_suffix("U", up), (0.0, -float(up), 0.0)),
        (_suffix("D", down), (0.0, float(down), 0.0)),
        (_suffix("F", front), (0.0, 0.0, float(front))),
        (_suffix("B", back), (0.0, 0.0, -float(back))),
        ("F45U45", (0.0, -45.0, 45.0)),
        ("F45D45", (0.0, 45.0, 45.0)),
        ("B45U45", (0.0, -45.0, -45.0)),
        ("B45D45", (0.0, 45.0, -45.0)),
    ]

    return rows


def _multi_samples(axis, angles):
    u"""单轴多角度样本。"""

    index = {"rotateX": 0, "rotateY": 1, "rotateZ": 2}[axis]
    return [
        (_suffix("F", angle), tuple(
            float(angle) if i == index else 0.0 for i in range(3)
        ))
        for angle in angles
    ]


def _four_twist_samples(angles, twist_angle):
    u"""四方向 + 双向扭转样本（腕/踝）。"""

    up, down, left, right = angles
    return [
        (_suffix("U", up), (0.0, -float(up), 0.0)),
        (_suffix("D", down), (0.0, float(down), 0.0)),
        (_suffix("L", left), (0.0, 0.0, float(left))),
        (_suffix("R", right), (0.0, 0.0, -float(right))),
        ("TwsP" + str(int(twist_angle)), (float(twist_angle), 0.0, 0.0)),
        ("TwsN" + str(int(twist_angle)), (-float(twist_angle), 0.0, 0.0)),
    ]


def _spine_samples(angle, twist_angle):
    u"""脊柱：前后左右 + 双向扭转。"""

    return [
        ("F" + str(int(angle)), (float(angle), 0.0, 0.0)),
        ("B" + str(int(angle)), (-float(angle), 0.0, 0.0)),
        ("L" + str(int(angle)), (0.0, 0.0, float(angle))),
        ("R" + str(int(angle)), (0.0, 0.0, -float(angle))),
        ("TwsP" + str(int(twist_angle)), (0.0, float(twist_angle), 0.0)),
        ("TwsN" + str(int(twist_angle)), (0.0, -float(twist_angle), 0.0)),
    ]


def _clavicle_samples(angle):
    u"""锁骨：前上下的 45° 样本。"""

    return [
        ("F" + str(int(angle)), (0.0, 0.0, float(angle))),
        ("U" + str(int(angle)), (0.0, -float(angle), 0.0)),
        ("D" + str(int(angle)), (0.0, float(angle), 0.0)),
    ]


def get_rbf_part_specs():
    u"""返回全部 RBF 部位规格。

    Returns:
        dict: 关节名 → {side, part, category, samples}。
    """

    specs = {}

    for side, suffix in (("lf", "L"), ("rt", "R")):
        specs["Shoulder_" + suffix] = {
            "side": side,
            "part": "shoulder",
            "category": "arm",
            "samples": _eight_samples(
                side, "shoulder", (90, 45, 90, 70)
            ),
        }
        specs["Hip_" + suffix] = {
            "side": side,
            "part": "hip",
            "category": "leg",
            "samples": _eight_samples(side, "hip", (90, 90, 90, 70)),
        }
        specs["Elbow_" + suffix] = {
            "side": side,
            "part": "elbow",
            "category": "arm",
            "samples": _multi_samples("rotateZ", (45, 90, 120)),
        }
        specs["Knee_" + suffix] = {
            "side": side,
            "part": "knee",
            "category": "leg",
            "samples": _multi_samples("rotateX", (45, 90, 120)),
        }
        specs["Wrist_" + suffix] = {
            "side": side,
            "part": "wrist",
            "category": "arm",
            "samples": _four_twist_samples((90, 90, 70, 70), 179),
        }
        specs["Ankle_" + suffix] = {
            "side": side,
            "part": "ankle",
            "category": "leg",
            "samples": _four_twist_samples((70, 70, 70, 70), 179),
        }
        specs["Clavicle_" + suffix] = {
            "side": side,
            "part": "clavicle",
            "category": "arm",
            "samples": _clavicle_samples(45),
        }

    specs["Spine1_M"] = {
        "side": "md",
        "part": "spine1",
        "category": "spine",
        "samples": _spine_samples(45, 45),
    }
    specs["Chest_M"] = {
        "side": "md",
        "part": "chest",
        "category": "spine",
        "samples": _spine_samples(45, 45),
    }

    return specs


def find_supported_rbf_joints():
    u"""返回场景中存在的 RBF 部位。

    Returns:
        list: [{joint, side, part, category, samples}]。
    """

    found = []

    for joint, spec in get_rbf_part_specs().items():
        if not cmds.objExists(joint):
            continue

        found.append({
            "joint": joint,
            "side": spec["side"],
            "part": spec["part"],
            "category": spec["category"],
            "samples": list(spec["samples"]),
        })

    found.sort(key=lambda item: (item["category"], item["side"], item["part"]))

    return found


def _group_name(category):
    return rbf_group_names[category]


def get_or_create_master_group():
    u"""总组，收敛所有 RBF 汇总组。"""

    if cmds.objExists(rbf_master_group):
        return rbf_master_group

    return cmds.createNode("transform", name=rbf_master_group)


def get_or_create_group(category):
    u"""RBF 汇总组。"""

    name = _group_name(category)

    if cmds.objExists(name):
        return name

    return cmds.createNode("transform", name=name)


def ensure_all_groups():
    u"""补齐总组与四个汇总组，并全部收进总组。"""

    master = get_or_create_master_group()
    groups = []

    for category in rbf_group_names:
        group = get_or_create_group(category)
        parents = cmds.listRelatives(group, parent=True, fullPath=True) or []
        current = parents[0].split("|")[-1] if parents else None

        if current != master:
            group = cmds.parent(group, master)[0]

        groups.append(group)

    return groups


def _hide_transform_attrs(node):
    u"""隐藏默认 transform 属性。"""

    for attribute in (
            "translateX", "translateY", "translateZ",
            "rotateX", "rotateY", "rotateZ",
            "scaleX", "scaleY", "scaleZ",
            "visibility",
    ):
        if not cmds.attributeQuery(attribute, node=node, exists=True):
            continue

        cmds.setAttr(node + "." + attribute, keyable=False, channelBox=False)


def read_group_config(group):
    u"""读组上的 RBF 配置。"""

    if not cmds.attributeQuery(rbf_config_attr, node=group, exists=True):
        return {}

    text = cmds.getAttr(group + "." + rbf_config_attr) or "{}"

    return json.loads(text)


def _write_group_config(group, config):
    if not cmds.attributeQuery(rbf_config_attr, node=group, exists=True):
        cmds.addAttr(group, longName=rbf_config_attr, dataType="string")
        cmds.setAttr(
            group + "." + rbf_config_attr, "{}", type="string"
        )

    cmds.setAttr(
        group + "." + rbf_config_attr,
        json.dumps(config, ensure_ascii=False),
        type="string",
    )


def _add_weight_attr(group, name):
    u"""组上加一个 0~1 的修型属性。"""

    if cmds.attributeQuery(name, node=group, exists=True):
        return

    cmds.addAttr(
        group,
        longName=name,
        attributeType="double",
        minValue=0.0,
        maxValue=1.0,
        keyable=True,
    )


def _remove_part(group, config, part_key):
    u"""删除一个部位：断开连接、删 expression、删组属性。"""

    entry = config.get(part_key)

    if not entry:
        return

    for node in entry.get("nodes", []):
        if cmds.objExists(node):
            cmds.delete(node)

    for attribute in entry.get("attributes", {}).values():
        if not cmds.attributeQuery(attribute, node=group, exists=True):
            continue

        plug = group + "." + attribute

        try:
            cmds.setAttr(plug, lock=False)
        except RuntimeError:
            pass

        cmds.deleteAttr(plug)

    config.pop(part_key, None)


def build_rbf_part(item):
    u"""构建一个 RBF 部位。

    Args:
        item (dict): find_supported_rbf_joints 返回的一项。

    Returns:
        dict: 部位信息。
    """

    joint = item["joint"]
    side = item["side"]
    part = item["part"]
    category = item["category"]
    samples = item["samples"]

    if not cmds.objExists(joint):
        raise RuntimeError(u"缺少关节：{}".format(joint))

    part_key = "{}_{}".format(side, part)
    group = get_or_create_group(category)

    config = read_group_config(group)

    if part_key in config:
        _remove_part(group, config, part_key)

    centers = [[0.0, 0.0, 0.0]]
    output_names = []

    for suffix, values in samples:
        centers.append([float(value) for value in values])
        output_names.append(part_key + "_" + suffix)

    coefficients = rbf_weight_math.train_coefficients(
        centers, 0, rbf_sigma, rbf_scales
    )

    created_nodes = []

    cmds.undoInfo(openChunk=True, chunkName="RbfPoseBuild")

    try:
        expression = cmds.createNode(
            "expression", name="expr_rbf_" + part_key + "_001"
        )
        created_nodes.append(expression)

        input_attrs = ("rx", "ry", "rz")

        for index, attribute in enumerate(input_attrs):
            cmds.addAttr(expression, longName=attribute, attributeType="double")
            cmds.connectAttr(
                joint + ".rotate" + "XYZ"[index],
                expression + "." + attribute,
            )

        output_attrs = {}

        for suffix, _ in samples:
            attribute = "w_" + suffix
            cmds.addAttr(
                expression, longName=attribute, attributeType="double"
            )
            output_attrs[suffix] = attribute

        lines = []

        for index, attribute in enumerate(input_attrs):
            lines.append(
                "float $x{0} = {1}.{2};".format(index, expression, attribute)
            )

        for sample_index, center in enumerate(centers):
            terms = []

            for index in range(3):
                delta = "(($x{0} - {1}) / {2})".format(
                    index, _number(center[index]), _number(rbf_scales[index])
                )
                terms.append("({0} * {0})".format(delta))

            lines.append(
                "float $k{0} = exp(-0.5 * ({1}) / {2});".format(
                    sample_index,
                    " + ".join(terms),
                    _number(rbf_sigma ** 2),
                )
            )

        for output_index, output_name in enumerate(output_names):
            terms = []

            for sample_index in range(len(centers)):
                coefficient = coefficients[sample_index][output_index]

                if abs(coefficient) < 1e-12:
                    continue

                terms.append(
                    "({0} * $k{1})".format(
                        _number(coefficient), sample_index
                    )
                )

            value = " + ".join(terms) if terms else "0.0"
            suffix = samples[output_index][0]

            lines.append(
                "{0}.{1} = clamp(0.0, 1.0, {2});".format(
                    expression, output_attrs[suffix], value
                )
            )

        cmds.expression(expression, edit=True, string="\n".join(lines))

        attributes = {}

        for suffix in output_attrs:
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            attributes[suffix] = attribute

            target = group + "." + attribute
            sources = cmds.listConnections(
                target, source=True, destination=False, plugs=True
            ) or []

            for source in sources:
                cmds.disconnectAttr(source, target)

            cmds.connectAttr(
                expression + "." + output_attrs[suffix], target
            )
            cmds.setAttr(target, keyable=False, channelBox=True)

        config[part_key] = {
            "joint": joint,
            "side": side,
            "part": part,
            "category": category,
            "samples": [
                {"suffix": suffix, "values": list(values)}
                for suffix, values in samples
            ],
            "attributes": attributes,
            "expression": expression,
            "nodes": list(created_nodes),
        }

        _write_group_config(group, config)

    except Exception:
        for node in reversed(created_nodes):
            if cmds.objExists(node):
                cmds.delete(node)

        raise

    finally:
        cmds.undoInfo(closeChunk=True)

    return {
        "group": group,
        "part_key": part_key,
        "joint": joint,
        "side": side,
        "part": part,
        "category": category,
        "attributes": dict(attributes),
        "expression": expression,
        "nodes": list(created_nodes),
    }


def build_all_supported():
    u"""给场景里所有支持的 RBF 部位构建驱动。

    Returns:
        tuple: (results, errors)，errors 是 [(部位, 错误信息), ...]。
    """

    ensure_all_groups()

    results = []
    errors = []

    for item in find_supported_rbf_joints():
        try:
            results.append(build_rbf_part(item))
        except Exception as error:
            errors.append((item["joint"], str(error)))

    return results, errors


def delete_rbf_part(part_key):
    u"""删除一个 RBF 部位。"""

    for category in rbf_group_names:
        group = _group_name(category)

        if not cmds.objExists(group):
            continue

        config = read_group_config(group)

        if part_key not in config:
            continue

        _remove_part(group, config, part_key)
        _write_group_config(group, config)

        return True

    return False


def delete_all_rbf_parts():
    u"""删除所有 RBF 部位，组保留。

    Returns:
        int: 删除数量。
    """

    removed = 0

    for category in rbf_group_names:
        group = _group_name(category)

        if not cmds.objExists(group):
            continue

        config = read_group_config(group)

        for part_key in list(config):
            _remove_part(group, config, part_key)
            removed += 1

        _write_group_config(group, config)

    return removed


def read_weights(part_key):
    u"""读取一个部位当前全部属性值（按后缀）。"""

    for category in rbf_group_names:
        group = _group_name(category)

        if not cmds.objExists(group):
            continue

        config = read_group_config(group)

        if part_key not in config:
            continue

        result = {}

        for suffix, attribute in config[part_key]["attributes"].items():
            result[suffix] = float(
                cmds.getAttr(group + "." + attribute)
            )

        return result

    return None
