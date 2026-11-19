# coding=utf-8
"""RBF 版姿态驱动修型：输入 ADV 关节 local rotate，输出统一挂到 grp_md_* 组。

RBF 只作为计算方式，属性与方向门控版共用同一套组和属性名：
- 组：grp_md_all_pose_001 / grp_md_arm_pose_001 ...
- 属性名沿用 <side>_<part>_<方向><角度>
- 每个部位一个 expression 节点，系数在构建时训练并编译成 MEL 常量
"""

import json
import math

from maya import cmds

from . import pose_driver_utils, rbf_weight_math

rbf_master_group = pose_driver_utils.master_group_name

rbf_group_names = pose_driver_utils.group_names

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


def _shoulder_samples():
    u"""大臂：单轴四方向 + 向上四个对角（去掉向下的 F45D45 / B45D45）。"""

    return [
        ("U90", (0.0, -90.0, 0.0)),
        ("D45", (0.0, 45.0, 0.0)),
        ("F90", (0.0, 0.0, 90.0)),
        ("B70", (0.0, 0.0, -70.0)),
        ("F45U90", (0.0, -90.0, 45.0)),
        ("F45U45", (0.0, -45.0, 45.0)),
        ("B45U45", (0.0, -45.0, -45.0)),
        ("B45U90", (0.0, -90.0, -45.0)),
    ]


def _hip_samples():
    u"""大腿：前、上、后 + 前上对角。"""

    return [
        ("U90", (0.0, -90.0, 0.0)),
        ("F90", (0.0, 0.0, 90.0)),
        ("B70", (0.0, 0.0, -70.0)),
        ("F45U90", (0.0, -90.0, 45.0)),
    ]


def _multi_samples(axis, angles, sign=1, letter="F"):
    u"""单轴多角度样本；sign 用于膝盖这类负向弯曲，letter 用于属性前缀。"""

    index = {"rotateX": 0, "rotateY": 1, "rotateZ": 2}[axis]
    return [
        (_suffix(letter, angle), tuple(
            float(angle) * sign if i == index else 0.0 for i in range(3)
        ))
        for angle in angles
    ]


def _four_twist_samples(angles, twist_angle):
    u"""四方向 + 双向扭转样本（腕/踝）。

    属性名保留 TwsP179/TwsN179，但样本值用 45°：
    核宽 45° 时 179° 样本距离太远，权重会被压到几乎不亮。
    """

    up, down, left, right = angles
    return [
        (_suffix("U", up), (0.0, -float(up), 0.0)),
        (_suffix("D", down), (0.0, float(down), 0.0)),
        (_suffix("L", left), (0.0, 0.0, float(left))),
        (_suffix("R", right), (0.0, 0.0, -float(right))),
        ("TwsP" + str(int(twist_angle)), (45.0, 0.0, 0.0)),
        ("TwsN" + str(int(twist_angle)), (-45.0, 0.0, 0.0)),
    ]


def _spine_samples(angle, twist_angle):
    u"""脊柱：前后 = rotateZ，左右 = rotateY，扭转 = rotateX。"""

    return [
        ("F" + str(int(angle)), (0.0, 0.0, float(angle))),
        ("B" + str(int(angle)), (0.0, 0.0, -float(angle))),
        ("L" + str(int(angle)), (0.0, -float(angle), 0.0)),
        ("R" + str(int(angle)), (0.0, float(angle), 0.0)),
        ("TwsP" + str(int(twist_angle)), (float(twist_angle), 0.0, 0.0)),
        ("TwsN" + str(int(twist_angle)), (-float(twist_angle), 0.0, 0.0)),
    ]


def _clavicle_samples(angle):
    u"""锁骨：前、后、上。"""

    return [
        ("F" + str(int(angle)), (0.0, 0.0, float(angle))),
        ("B" + str(int(angle)), (0.0, 0.0, -float(angle))),
        ("U" + str(int(angle)), (0.0, -float(angle), 0.0)),
    ]


def _scapula_samples(angle):
    u"""肩胛骨：前、后、上。"""

    return _clavicle_samples(angle)


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
            "samples": _shoulder_samples(),
        }
        # ADV 大腿驱动关节：Hip1_L / Hip1_R（L_Thigh 是静态皮肤关节）
        specs[("Hip1_L" if suffix == "L" else "Hip1_R")] = {
            "side": side,
            "part": "hip",
            "category": "leg",
            "samples": _hip_samples(),
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
            "samples": _multi_samples(
                "rotateZ", (45, 90, 120), sign=-1, letter="B"
            ),
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
        specs["Scapula_" + suffix] = {
            "side": side,
            "part": "scapula",
            "category": "arm",
            "samples": _scapula_samples(45),
        }

    specs["Spine1_M"] = {
        "side": "md",
        "part": "spine1",
        "category": "spine",
        "samples": _spine_samples(45, 45),
    }
    specs["Spine2_M"] = {
        "side": "md",
        "part": "spine2",
        "category": "spine",
        "samples": _spine_samples(45, 45),
    }
    specs["Chest_M"] = {
        "side": "md",
        "part": "chest",
        "category": "spine",
        "samples": _spine_samples(45, 45),
    }

    if cmds.objExists("Hip1_L") and cmds.objExists("Hip1_R"):
        specs["md_legs"] = {
            "joint": "Hip1_L",
            "joints": ["Hip1_L", "Hip1_R"],
            "side": "md",
            "part": "legs",
            "category": "leg",
            "samples": [
                ("U90", (0.0, -90.0, 0.0, 0.0, -90.0, 0.0)),
                ("F90", (0.0, 0.0, 90.0, 0.0, 0.0, 90.0)),
                ("B70", (0.0, 0.0, -70.0, 0.0, 0.0, -70.0)),
                ("F45U90", (0.0, -90.0, 45.0, 0.0, -90.0, 45.0)),
            ],
            # 6 维输入，核宽要比单关节大，否则矩阵病态
            "sigma": 45.0,
        }

    return specs


def find_supported_rbf_joints():
    u"""返回场景中存在的 RBF 部位。

    Returns:
        list: [{joint, side, part, category, samples}]。
    """

    found = []

    for key, spec in get_rbf_part_specs().items():
        joint = spec.get("joint", key)

        if not cmds.objExists(joint):
            continue

        found.append({
            "joint": joint,
            "joints": list(spec.get("joints") or [joint]),
            "side": spec["side"],
            "part": spec["part"],
            "category": spec["category"],
            "samples": list(spec["samples"]),
            "sigma": spec.get("sigma"),
        })

    found.sort(key=lambda item: (item["category"], item["side"], item["part"]))

    return found


def _group_name(category):
    return rbf_group_names[category]


def get_or_create_master_group():
    u"""总组，复用方向门控版的 grp_md_all_pose_001。"""

    return pose_driver_utils.get_or_create_master_group()


def get_or_create_group(category):
    u"""汇总组，复用方向门控版的 grp_md_* 组。"""

    return pose_driver_utils.get_or_create_group(category)


def ensure_all_groups():
    u"""补齐总组与四个汇总组，复用方向门控版。"""

    return pose_driver_utils.ensure_all_groups()


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


def _create(name, node_type, nodes):
    u"""创建节点并登记到清理列表。"""

    node = cmds.createNode(node_type, name=name)
    nodes.append(node)

    return node


def _build_kernel(part_key, sample_index, input_plugs, center, sigma, nodes):
    u"""单个样本的核值：exp(-0.5 * Σ((x - c) / σ)²)，用节点网络算。"""

    squares = []

    for dim, plug in enumerate(input_plugs):
        delta = _create(
            "plus_{}_k{}d{}_001".format(part_key, sample_index, dim),
            "plusMinusAverage",
            nodes,
        )
        cmds.setAttr(delta + ".operation", 2)
        cmds.connectAttr(plug, delta + ".input1D[0]")
        cmds.setAttr(delta + ".input1D[1]", float(center[dim]))

        norm = _create(
            "mult_{}_k{}n{}_001".format(part_key, sample_index, dim),
            "multDoubleLinear",
            nodes,
        )
        cmds.connectAttr(delta + ".output1D", norm + ".input1")
        cmds.setAttr(norm + ".input2", 1.0 / float(sigma))

        square = _create(
            "mult_{}_k{}s{}_001".format(part_key, sample_index, dim),
            "multDoubleLinear",
            nodes,
        )
        cmds.connectAttr(norm + ".output", square + ".input1")
        cmds.connectAttr(norm + ".output", square + ".input2")
        squares.append(square + ".output")

    total = _create(
        "plus_{}_k{}sum_001".format(part_key, sample_index),
        "plusMinusAverage",
        nodes,
    )

    for dim, square in enumerate(squares):
        cmds.connectAttr(square, total + ".input1D[{}]".format(dim))

    half = _create(
        "mult_{}_k{}half_001".format(part_key, sample_index),
        "multDoubleLinear",
        nodes,
    )
    cmds.connectAttr(total + ".output1D", half + ".input1")
    cmds.setAttr(half + ".input2", -0.5)

    power = _create(
        "pow_{}_k{}_001".format(part_key, sample_index),
        "multiplyDivide",
        nodes,
    )
    cmds.setAttr(power + ".operation", 3)
    cmds.setAttr(power + ".input1X", 2.718281828459045)
    cmds.connectAttr(half + ".output", power + ".input2X")

    return power + ".outputX"


def _build_output(
        part_key, output_index, kernels, coefficients, name, nodes
):
    u"""单个输出的加权和：Σ(coef × kernel)，clamp 到 0-1。"""

    total = _create(
        "plus_{}_o{}_001".format(part_key, output_index),
        "plusMinusAverage",
        nodes,
    )

    term_index = 0

    for sample_index, kernel in enumerate(kernels):
        coefficient = coefficients[sample_index][output_index]

        if abs(coefficient) < 1e-12:
            continue

        node = _create(
            "mult_{}_o{}c{}_001".format(
                part_key, output_index, sample_index
            ),
            "multDoubleLinear",
            nodes,
        )
        cmds.connectAttr(kernel, node + ".input1")
        cmds.setAttr(node + ".input2", float(coefficient))
        cmds.connectAttr(
            node + ".output", total + ".input1D[{}]".format(term_index)
        )
        term_index += 1

    clamp = _create(
        "clamp_{}_o{}_001".format(part_key, output_index),
        "clamp",
        nodes,
    )
    cmds.setAttr(clamp + ".minR", 0.0)
    cmds.setAttr(clamp + ".maxR", 1.0)
    cmds.connectAttr(total + ".output1D", clamp + ".inputR")

    return clamp + ".outputR"


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
    joints = list(item.get("joints") or [joint])
    sigma = float(item.get("sigma") or rbf_sigma)

    for name in joints:
        if not cmds.objExists(name):
            raise RuntimeError(u"缺少关节：{}".format(name))

    input_plugs = [
        name + ".rotate" + axis
        for name in joints
        for axis in ("X", "Y", "Z")
    ]

    part_key = "{}_{}".format(side, part)
    group = get_or_create_group(category)

    config = read_group_config(group)

    if part_key in config:
        _remove_part(group, config, part_key)

    centers = [[0.0] * len(input_plugs)]
    output_names = []

    for suffix, values in samples:
        centers.append([float(value) for value in values])
        output_names.append(part_key + "_" + suffix)

    coefficients = rbf_weight_math.train_coefficients(
        centers, 0, sigma, [1.0] * len(input_plugs),
        regularization=1e-8
    )

    created_nodes = []

    cmds.undoInfo(openChunk=True, chunkName="RbfPoseBuild")

    try:
        kernels = [
            _build_kernel(
                part_key, index, input_plugs, center, sigma, created_nodes
            )
            for index, center in enumerate(centers)
        ]

        attributes = {}

        for output_index, output_name in enumerate(output_names):
            suffix = samples[output_index][0]
            attribute = part_key + "_" + suffix
            _add_weight_attr(group, attribute)
            attributes[suffix] = attribute

            plug = _build_output(
                part_key, output_index, kernels, coefficients,
                output_name, created_nodes
            )

            target = group + "." + attribute
            sources = cmds.listConnections(
                target, source=True, destination=False, plugs=True
            ) or []

            for source in sources:
                cmds.disconnectAttr(source, target)

            # RBF 输出 → driven key 曲线 → 属性：
            # 曲线留给绑定师调过渡/幅度
            cmds.setDrivenKeyframe(
                target, currentDriver=plug, driverValue=0.0, value=0.0
            )
            cmds.setDrivenKeyframe(
                target, currentDriver=plug, driverValue=1.0, value=1.0
            )

            curves = cmds.listConnections(
                target, source=True, destination=False, type="animCurve"
            ) or []

            for curve in curves:
                cmds.keyTangent(
                    curve, inTangentType="auto", outTangentType="auto"
                )
                renamed = cmds.rename(
                    curve, "anim_rbf_" + attribute + "_001"
                )
                created_nodes.append(renamed)

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
            "mode": "rbf_nodes",
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
        "mode": "rbf_nodes",
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
    u"""删除所有 RBF 部位，组也一起删。

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

    if cmds.objExists(rbf_master_group):
        cmds.delete(rbf_master_group)

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
