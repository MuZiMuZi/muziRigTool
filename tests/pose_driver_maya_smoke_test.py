# coding=utf-8
u"""姿态驱动修型的真机冒烟测试。

文件名不是 test_ 开头，unittest discover 不会收集它，
因为它依赖 Maya，只能在 mayapy 里跑：

    "C:\\Program Files\\Autodesk\\Maya2023\\bin\\mayapy.exe" ^
        tests\\pose_driver_maya_smoke_test.py

覆盖：ADV 固定名单扫描、四个汇总组、分隔属性、方向属性命名、
单轴/对角/超限权重、一个组多部位、按部位删除、重建恢复、错误输入。
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

from muziRigTool.core import pose_driver_utils


def build_scene():
    u"""建一组 ADV 命名的关节。

    Returns:
        dict: {键: 关节名}
    """

    cmds.file(new=True, force=True)

    cmds.select(clear=True)
    shoulder_l = cmds.joint(name="Shoulder_L", position=(0, 0, 0))

    cmds.select(clear=True)
    shoulder_r = cmds.joint(name="Shoulder_R", position=(4, 0, 0))

    cmds.select(clear=True)
    clavicle_r = cmds.joint(name="Clavicle_R", position=(3, 0, 0))

    cmds.select(clear=True)
    scapula_r = cmds.joint(name="Scapula_R", position=(3, 1, 0))

    cmds.select(clear=True)
    cmds.createNode("transform", name="FKClavicle_R")

    cmds.select(clear=True)
    elbow_r = cmds.joint(name="Elbow_R", position=(4, 4, 0))
    cmds.parent(elbow_r, shoulder_r, absolute=True)

    cmds.select(clear=True)
    wrist_r = cmds.joint(name="Wrist_R", position=(4, 8, 0))
    cmds.parent(wrist_r, elbow_r, absolute=True)

    cmds.select(clear=True)
    index1_r = cmds.joint(name="IndexFinger1_R", position=(4, 9, 0))
    cmds.parent(index1_r, wrist_r, absolute=True)

    cmds.select(clear=True)
    index2_r = cmds.joint(name="IndexFinger2_R", position=(4, 10, 0))
    cmds.parent(index2_r, index1_r, absolute=True)

    cmds.select(clear=True)
    index3_r = cmds.joint(name="IndexFinger3_R", position=(4, 11, 0))
    cmds.parent(index3_r, index2_r, absolute=True)

    cmds.select(clear=True)
    index4_r = cmds.joint(name="IndexFinger4_R", position=(4, 12, 0))
    cmds.parent(index4_r, index3_r, absolute=True)

    cmds.select(clear=True)
    cmds.createNode("transform", name="FKIndexFinger1_R")
    cmds.createNode("transform", name="FKIndexFinger2_R")
    cmds.createNode("transform", name="FKIndexFinger3_R")

    cmds.select(clear=True)
    cmds.createNode("transform", name="FKWrist_R")

    cmds.select(clear=True)
    hip_l = cmds.joint(name="Hip1_L", position=(-4, 0, 0))

    cmds.select(clear=True)
    knee_l = cmds.joint(name="Knee_L", position=(-4, 4, 0))
    cmds.parent(knee_l, hip_l, absolute=True)

    cmds.select(clear=True)
    ankle_l = cmds.joint(name="Ankle_L", position=(-4, 8, 0))
    cmds.parent(ankle_l, knee_l, absolute=True)

    cmds.select(clear=True)
    hip_r = cmds.joint(name="Hip1_R", position=(8, 0, 0))

    cmds.select(clear=True)
    knee_r = cmds.joint(name="Knee_R", position=(8, 4, 0))
    cmds.parent(knee_r, hip_r, absolute=True)

    cmds.select(clear=True)
    spine1 = cmds.joint(name="Spine1_M", position=(0, 12, 0))

    cmds.select(clear=True)
    cmds.createNode("transform", name="FKSpine1_M")

    cmds.select(clear=True)
    index = cmds.joint(name="Index_L", position=(0, 16, 0))

    joints = {
        "shoulder_l": shoulder_l,
        "shoulder_r": shoulder_r,
        "hip_l": hip_l,
        "hip_r": hip_r,
        "clavicle": clavicle_r,
        "scapula": scapula_r,
        "elbow": elbow_r,
        "knee": knee_l,
        "wrist": wrist_r,
        "ankle": ankle_l,
        "spine1": spine1,
        "index": index,
    }

    for joint in joints.values():
        cmds.setAttr(joint + ".rotateY", 0.0)
        cmds.setAttr(joint + ".rotateZ", 0.0)

    return joints


def check_find_supported():
    u"""按 ADV 固定名单只找到 Shoulder / Hip。"""

    items = pose_driver_utils.find_supported_joints()
    found = [item["short"] for item in items]

    for name in (
            "Shoulder_L", "Shoulder_R", "Hip1_L", "Hip1_R",
            "Clavicle_R", "Scapula_R", "Elbow_R", "Knee_L", "Wrist_R", "Ankle_L",
            "IndexFinger1_R", "Spine1_M",
    ):
        assert name in found, u"没有找到：{}".format(name)

    for name in ("Index_L",):
        assert name not in found, u"不该出现：{}".format(name)

    print(u"[ok] ADV 固定名单扫描：{} 个".format(len(found)))


def check_identity():
    u"""ADV 命名解析与归类。"""

    cases = {
        "Shoulder_L": ("lf", "shoulder", "arm"),
        "Elbow_R": ("rt", "elbow", "arm"),
        "Spine1": ("md", "spine1", "spine"),
        "Chest": ("md", "chest", "spine"),
        "Hip_L": ("lf", "hip", "leg"),
        "Index_R": ("rt", "index", "finger"),
        "jnt_lf_arm_bind_001": ("lf", "arm", "arm"),
    }

    for name, expected in cases.items():
        actual = pose_driver_utils.parse_joint_identity(name)

        assert actual == expected, u"{} 解析不对：{}".format(name, actual)

    print(u"[ok] ADV / 五段式解析与归类")


def check_groups(joint):
    u"""首次生成时补齐四个汇总组。"""

    result = pose_driver_utils.build_network(
        joint,
        directions=("up", "down", "front_up", "back"),
    )

    for category in ("arm", "spine", "leg", "finger"):
        name = pose_driver_utils.get_group_name(category)

        assert cmds.objExists(name), u"缺少汇总组：{}".format(name)

        parent = (cmds.listRelatives(name, parent=True) or [""])[0]

        assert parent == pose_driver_utils.master_group_name, (
            u"{} 没有收进总组，当前父级：{}".format(name, parent)
        )

    assert not cmds.attributeQuery(
        "translateX", node=result["group"], channelBox=True
    ), u"默认 transform 属性没有隐藏"

    assert not cmds.attributeQuery(
        "sep_lf", node="grp_md_finger_pose_001", exists=True
    ), u"手指组本轮不应有属性"

    skirt_group = "grp_md_skirt_pose_001"

    assert cmds.objExists(skirt_group), u"缺少裙子组"
    assert cmds.attributeQuery(
        "leg_follow", node=skirt_group, exists=True
    ), u"裙子组缺少 leg_follow"

    print(u"[ok] 四个汇总组 + 总组 + 裙子组 + 默认属性隐藏")

    return result


def check_attributes(result):
    u"""属性名、分隔属性、驱动曲线与指示器。"""

    group = result["group"]

    assert group == "grp_md_arm_pose_001", u"归类错误：{}".format(group)

    for attribute in ("lf_shoulder_U90", "lf_shoulder_F45U45"):
        assert cmds.attributeQuery(attribute, node=group, exists=True), (
            u"缺少方向属性：{}".format(attribute)
        )

    assert cmds.attributeQuery("lf_shoulder_D45", node=group, exists=True), (
        u"手臂下压没有生成 D45"
    )
    assert not cmds.attributeQuery(
        "lf_shoulder_D90", node=group, exists=True
    ), u"手臂下压不应再生成 D90"

    separator = "sep_lf_shoulder"

    assert cmds.attributeQuery(separator, node=group, exists=True), (
        u"缺少分隔属性"
    )
    assert cmds.getAttr(group + "." + separator, lock=True), u"分隔属性未锁定"

    curves = cmds.listConnections(
        group + ".lf_shoulder_U90",
        source=True,
        destination=False,
        type="animCurve",
    ) or []

    expressions = cmds.listConnections(
        group + ".lf_shoulder_U90",
        source=True,
        destination=False,
        type="expression",
    ) or []

    assert curves or expressions, u"属性没有驱动（曲线或 RBF 表达式）"

    if curves:
        key_values = cmds.keyframe(curves[0], query=True, valueChange=True) or []

        assert key_values == [0.0, 1.0], (
            u"曲线 key 值不对：{}".format(key_values)
        )

        tangents = cmds.keyTangent(
            curves[0], query=True, inTangentType=True
        ) or []

        assert tangents and tangents[0] == "auto", (
            u"曲线切线不是 auto：{}".format(tangents)
        )

    indicator = result["indicator"]

    assert cmds.objExists(indicator), u"缺少姿态指示器：{}".format(indicator)

    parent = (cmds.listRelatives(indicator, parent=True) or [""])[0]

    assert parent.split("|")[-1] == "Shoulder_L", (
        u"指示器没有挂在关节下：{}".format(parent)
    )

    print(u"[ok] 属性名 / 分隔属性 / driven key / 指示器")


def check_weights(joint, result):
    u"""单轴、半程、超限、对角权重。"""

    group = result["group"]

    cmds.setAttr(joint + ".rotateY", -90.0)
    assert abs(cmds.getAttr(group + ".lf_shoulder_U90") - 1.0) < 1e-5, (
        u"阈值处 U90 不是 1"
    )

    cmds.setAttr(joint + ".rotateY", -45.0)

    value = cmds.getAttr(group + ".lf_shoulder_U90")

    assert 0.3 <= value <= 0.7, (
        u"半程 U90 不在合理范围（RBF 插值）：{}".format(value)
    )

    cmds.setAttr(joint + ".rotateY", -120.0)

    overshoot = cmds.getAttr(group + ".lf_shoulder_U90")

    assert overshoot > 0.2, (
        u"超限后 U90 衰减过多（RBF 插值）：{}".format(overshoot)
    )

    cmds.setAttr(joint + ".rotateX", 15.79)
    cmds.setAttr(joint + ".rotateY", -30.0)
    cmds.setAttr(joint + ".rotateZ", 54.74)

    diagonal = cmds.getAttr(group + ".lf_shoulder_F45U45")

    assert diagonal > 0.8, (
        u"样本姿态下对角权重不足（RBF 严格插值）：{}".format(diagonal)
    )

    cmds.setAttr(joint + ".rotateX", 0.0)
    cmds.setAttr(joint + ".rotateY", 0.0)
    cmds.setAttr(joint + ".rotateZ", 0.0)

    weights = pose_driver_utils.read_weights(result)

    for direction, value in weights.items():
        assert value < 1e-4, u"中立姿态下 {} 不是 0".format(direction)

    print(u"[ok] 单轴 / 半程 / 超限 / 对角 / 中立")


def check_back_angle(joint, result):
    u"""后摆方向单独用 70° 阈值。"""

    group = result["group"]

    cmds.setAttr(joint + ".rotateY", 0.0)

    cmds.setAttr(joint + ".rotateZ", -70.0)
    assert abs(cmds.getAttr(group + ".lf_shoulder_B70") - 1.0) < 1e-5, (
        u"后摆 70° 时 B70 不是 1"
    )

    cmds.setAttr(joint + ".rotateZ", -35.0)
    back_value = cmds.getAttr(group + ".lf_shoulder_B70")

    assert 0.3 <= back_value <= 0.7, (
        u"后摆半程 B70 不在合理范围（RBF 插值）：{}".format(back_value)
    )

    cmds.setAttr(joint + ".rotateZ", -45.0)
    assert cmds.getAttr(group + ".lf_shoulder_B70") < 1.0, (
        u"后摆 45° 不应达到满门"
    )

    cmds.setAttr(joint + ".rotateZ", 0.0)

    print(u"[ok] 后摆阈值 70°：半程 0.5 / 满门 1")


def check_limb(joints):
    u"""四肢：肘/膝单轴多角度，腕/踝四方向 + 双向扭转。"""

    elbow = pose_driver_utils.build_network(joints["elbow"])
    group = elbow["group"]

    assert group == "grp_md_arm_pose_001", u"肘部归类错误"

    for suffix in ("F45", "F90", "F120"):
        assert "rt_elbow_" + suffix in elbow["attributes"].values(), (
            u"缺少肘部属性：{}".format(suffix)
        )

    cmds.setAttr(joints["elbow"] + ".rotateZ", 45.0)
    assert abs(cmds.getAttr(group + ".rt_elbow_F45") - 1.0) < 1e-5, (
        u"肘 F45 不对"
    )
    assert abs(cmds.getAttr(group + ".rt_elbow_F90")) < 1e-5, (
        u"45° 时 F90 应为 0"
    )
    assert abs(cmds.getAttr(group + ".rt_elbow_F120")) < 1e-5, (
        u"45° 时 F120 应为 0"
    )

    cmds.setAttr(joints["elbow"] + ".rotateZ", 90.0)
    assert abs(cmds.getAttr(group + ".rt_elbow_F90") - 1.0) < 1e-5, (
        u"肘 F90 不对"
    )
    assert abs(cmds.getAttr(group + ".rt_elbow_F45")) < 1e-5, (
        u"90° 时 F45 应已交棒"
    )

    cmds.setAttr(joints["elbow"] + ".rotateZ", 120.0)
    assert abs(cmds.getAttr(group + ".rt_elbow_F120") - 1.0) < 1e-5, (
        u"肘 F120 不对"
    )
    assert abs(cmds.getAttr(group + ".rt_elbow_F90") - 1.0) < 1e-5, (
        u"120° 时 F90 应继续保留"
    )
    assert abs(cmds.getAttr(group + ".rt_elbow_F45")) < 1e-5, (
        u"120° 时 F45 应已交棒"
    )
    cmds.setAttr(joints["elbow"] + ".rotateZ", 0.0)

    wrist = pose_driver_utils.build_network(joints["wrist"])
    wgroup = wrist["group"]
    wrist_ctrl = "Wrist_R"

    cmds.setAttr(wrist_ctrl + ".rotateY", -90.0)
    assert abs(cmds.getAttr(wgroup + ".rt_wrist_U90") - 1.0) < 1e-5, (
        u"腕 U90 不对"
    )
    cmds.setAttr(wrist_ctrl + ".rotateY", 0.0)

    cmds.setAttr(wrist_ctrl + ".rotateZ", 70.0)
    assert abs(cmds.getAttr(wgroup + ".rt_wrist_L70") - 1.0) < 1e-5, (
        u"腕 L70 不对"
    )
    cmds.setAttr(wrist_ctrl + ".rotateZ", -70.0)
    assert abs(cmds.getAttr(wgroup + ".rt_wrist_R70") - 1.0) < 1e-5, (
        u"腕 R70 不对"
    )
    cmds.setAttr(wrist_ctrl + ".rotateZ", 0.0)

    cmds.setAttr(wrist_ctrl + ".rotateX", 179.0)
    assert abs(cmds.getAttr(wgroup + ".rt_wrist_TwsP179") - 1.0) < 1e-5, (
        u"腕正向扭转不对"
    )

    for attribute in (
            "rt_wrist_U90", "rt_wrist_D90",
            "rt_wrist_L70", "rt_wrist_R70",
    ):
        assert abs(cmds.getAttr(wgroup + "." + attribute)) < 1e-5, (
            u"扭转时 {} 不应被驱动".format(attribute)
        )

    cmds.setAttr(wrist_ctrl + ".rotateX", -179.0)
    assert abs(cmds.getAttr(wgroup + ".rt_wrist_TwsN179") - 1.0) < 1e-5, (
        u"腕负向扭转不对"
    )
    assert abs(cmds.getAttr(wgroup + ".rt_wrist_TwsP179")) < 1e-5, (
        u"负向时正向扭转应为 0"
    )
    cmds.setAttr(wrist_ctrl + ".rotateX", 0.0)

    ankle = pose_driver_utils.build_network(joints["ankle"])
    agroup = ankle["group"]

    assert agroup == "grp_md_leg_pose_001", u"踝部归类错误"

    for suffix in ("F70", "U70", "B70", "D70"):
        assert "lf_ankle_" + suffix in ankle["attributes"].values(), (
            u"缺少踝部属性：{}".format(suffix)
        )

    cmds.setAttr(joints["ankle"] + ".rotateY", -70.0)
    assert abs(cmds.getAttr(agroup + ".lf_ankle_U70") - 1.0) < 1e-5, (
        u"踝 U70 不对"
    )
    cmds.setAttr(joints["ankle"] + ".rotateY", 0.0)

    print(u"[ok] 四肢：肘多角度 / 腕四方向+双向扭转 / 踝属性")


def check_two_parts(joints):
    u"""同一个组可以装多个部位。"""

    result = pose_driver_utils.build_network(
        joints["shoulder_r"],
        directions=("front",),
    )

    assert result["group"] == "grp_md_arm_pose_001", u"右肩归类错误"

    assert cmds.attributeQuery(
        "rt_shoulder_F90", node=result["group"], exists=True
    ), u"缺少 rt_shoulder_F90"

    parts = pose_driver_utils.get_part_list(result["group"])

    assert "lf_shoulder" in parts, u"左肩部位丢失"
    assert "rt_shoulder" in parts, u"右肩部位缺失"

    print(u"[ok] 一个组多个部位：{}".format(parts))

    return result


def check_delete(right_result):
    u"""删除一个部位，属性和节点清干净，其他部位保留。"""

    group = right_result["group"]

    pose_driver_utils.delete_part(group, "rt_shoulder")

    assert not cmds.attributeQuery(
        "rt_shoulder_F90", node=group, exists=True
    ), u"右肩属性没有删除"

    leftovers = cmds.ls("*_rt_shoulder_*") or []
    assert not leftovers, u"右肩节点没删干净：{}".format(leftovers)

    assert cmds.attributeQuery("lf_shoulder_U90", node=group, exists=True), (
        u"左肩属性被误删"
    )

    parts = pose_driver_utils.get_part_list(group)
    assert "rt_shoulder" not in parts, u"配置没有移除"

    print(u"[ok] 按部位删除，组与邻居部位保留")


def check_rebuild(joint):
    u"""按配置重建。"""

    result = pose_driver_utils.build_network(
        joint,
        directions=("up",),
    )

    rebuilt = pose_driver_utils.rebuild_network(result)

    group = rebuilt["group"]

    assert cmds.objExists(group), u"重建后组不存在"
    assert cmds.attributeQuery("lf_shoulder_U90", node=group, exists=True), (
        u"重建后属性缺失"
    )

    cmds.setAttr(joint + ".rotateY", -45.0)

    rebuilt_value = cmds.getAttr(group + ".lf_shoulder_U90")

    assert 0.3 <= rebuilt_value <= 0.7, (
        u"重建后权重没有恢复驱动：{}".format(rebuilt_value)
    )

    cmds.setAttr(joint + ".rotateY", 0.0)
    pose_driver_utils.delete_part(group, "lf_shoulder")

    print(u"[ok] 重建：属性与权重恢复")


def check_clavicle(joints):
    u"""锁骨：F45 / B45 / U45 三方向。"""

    result = pose_driver_utils.build_network(joints["clavicle"])
    group = result["group"]

    for suffix in ("F45", "B45", "U45"):
        assert "rt_clavicle_" + suffix in result["attributes"].values(), (
            u"缺少锁骨属性：{}".format(suffix)
        )

    assert not cmds.attributeQuery(
        "rt_clavicle_D45", node=group, exists=True
    ), u"锁骨不该再有 D45"

    ctrl = "Clavicle_R"

    cmds.setAttr(ctrl + ".rotateZ", 45.0)
    assert abs(cmds.getAttr(group + ".rt_clavicle_F45") - 1.0) < 1e-5, (
        u"锁骨 F45 不对"
    )
    cmds.setAttr(ctrl + ".rotateZ", 0.0)

    cmds.setAttr(ctrl + ".rotateZ", -45.0)
    assert abs(cmds.getAttr(group + ".rt_clavicle_B45") - 1.0) < 1e-5, (
        u"锁骨 B45 不对"
    )
    cmds.setAttr(ctrl + ".rotateZ", 0.0)

    cmds.setAttr(ctrl + ".rotateY", -45.0)
    assert abs(cmds.getAttr(group + ".rt_clavicle_U45") - 1.0) < 1e-5, (
        u"锁骨 U45 不对"
    )
    cmds.setAttr(ctrl + ".rotateY", 0.0)

    print(u"[ok] 锁骨：F45 / B45 / U45")


def check_blendshape():
    u"""按名字把修型属性连到 blendShape target。"""

    base = cmds.polyCube(name="bs_base", width=1, height=1, depth=1)[0]
    target = cmds.duplicate(base, name="bs_target")[0]
    cmds.setAttr(target + ".translateY", 1.0)

    blendshape = cmds.blendShape(target, base, name="bs_shoulder")[0]
    cmds.aliasAttr("lf_shoulder_U90", blendshape + ".weight[0]")

    # 档案里记录 BS 节点，连接时按档案来
    group = "grp_md_arm_pose_001"
    config = pose_driver_utils.read_group_config(group)
    config["lf_shoulder"]["blendshape"] = blendshape
    pose_driver_utils._write_config(group, config)

    connected, missing = pose_driver_utils.connect_attributes_to_blendshapes()

    assert connected >= 1, u"没有连接任何属性到 BS"

    sources = cmds.listConnections(
        blendshape + ".weight[0]", source=True, destination=False, plugs=True
    ) or []

    assert sources and sources[0].endswith("lf_shoulder_U90"), (
        u"BS weight 没有连到 lf_shoulder_U90：{}".format(sources)
    )

    cmds.delete(blendshape, base, target)

    print(u"[ok] 修型属性 → blendShape：自动匹配连接")


def check_knee_direction():
    u"""膝盖负向弯曲：B45 交棒、B90 到 1。"""

    group = "grp_md_leg_pose_001"
    knee = "Knee_L"

    cmds.setAttr(knee + ".rotateZ", -90.0)

    assert abs(cmds.getAttr(group + ".lf_knee_B90") - 1.0) < 1e-4, (
        u"膝盖负向 90° 时 B90 不是 1"
    )
    assert abs(cmds.getAttr(group + ".lf_knee_B45")) < 1e-4, (
        u"膝盖负向 90° 时 B45 没有交棒"
    )

    cmds.setAttr(knee + ".rotateZ", 0.0)

    print(u"[ok] 膝盖：负向弯曲驱动 B45/B90/B120")


def check_legs(joints):
    u"""双腿合并：两腿都到位才驱动。"""

    result = pose_driver_utils.build_network("md_legs")
    group = result["group"]

    for suffix in ("U90", "F90", "B70", "F45U90"):
        assert "md_legs_" + suffix in result["attributes"].values(), (
            u"缺少双腿属性：{}".format(suffix)
        )

    left = "Hip1_L"
    right = "Hip1_R"

    cmds.setAttr(left + ".rotateY", -90.0)
    cmds.setAttr(right + ".rotateY", -90.0)

    assert abs(cmds.getAttr(group + ".md_legs_U90") - 1.0) < 1e-5, (
        u"两腿都到位时 md_legs_U90 不是 1"
    )

    cmds.setAttr(right + ".rotateY", 0.0)

    assert abs(cmds.getAttr(group + ".md_legs_U90")) < 1e-5, (
        u"只一条腿时 md_legs_U90 应为 0"
    )

    cmds.setAttr(left + ".rotateY", 0.0)

    print(u"[ok] 双腿合并：两腿都到位才驱动")


def check_scapula(joints):
    u"""Scapula：F45 / B45 / U45。"""

    result = pose_driver_utils.build_network(joints["scapula"])
    group = result["group"]

    for suffix in ("F45", "B45", "U45"):
        assert "rt_scapula_" + suffix in result["attributes"].values(), (
            u"缺少肩胛骨属性：{}".format(suffix)
        )

    print(u"[ok] Scapula：F45 / B45 / U45")


def check_finger(joints):
    u"""手指：1/2/3 节单独修型 + 两节/三节融合。"""

    result = pose_driver_utils.build_network("IndexFinger1_R")
    group = result["group"]

    assert group == "grp_md_finger_pose_001", u"手指归类错误"

    for key in ("1", "2", "3", "12", "23", "123"):
        assert "rt_index" + key + "_F90" in result["attributes"].values(), (
            u"缺少手指属性：{}".format(key)
        )

    finger1 = "IndexFinger1_R"
    finger2 = "IndexFinger2_R"

    cmds.setAttr(finger1 + ".rotateY", 90.0)
    assert abs(cmds.getAttr(group + ".rt_index1_F90") - 1.0) < 1e-5, (
        u"第一节 90° 时 rt_index1_F90 不是 1"
    )
    assert abs(cmds.getAttr(group + ".rt_index12_F90")) < 1e-5, (
        u"第二节没弯时融合 12 应为 0"
    )

    cmds.setAttr(finger2 + ".rotateY", 90.0)
    assert abs(cmds.getAttr(group + ".rt_index2_F90") - 1.0) < 1e-5, (
        u"第二节 90° 时 rt_index2_F90 不是 1"
    )
    assert abs(cmds.getAttr(group + ".rt_index12_F90") - 1.0) < 1e-5, (
        u"两节都 90° 时融合 12 应为 1"
    )

    cmds.setAttr(finger1 + ".rotateY", 0.0)
    cmds.setAttr(finger2 + ".rotateY", 0.0)

    print(u"[ok] 手指：单节 + 两节融合")


def check_spine(joints):
    u"""脊柱：前后左右 + 双向扭转，各 45°。"""

    result = pose_driver_utils.build_network("Spine1_M")
    group = result["group"]

    assert group == "grp_md_spine_pose_001", u"脊柱归类错误"

    for suffix in ("F45", "B45", "L45", "R45", "TwsP45", "TwsN45"):
        assert "md_spine1_" + suffix in result["attributes"].values(), (
            u"缺少脊柱属性：{}".format(suffix)
        )

    joint = "Spine1_M"

    # 实测映射：前后 = rotateZ，左右 = rotateY，扭转 = rotateX
    cmds.setAttr(joint + ".rotateZ", 45.0)
    assert abs(cmds.getAttr(group + ".md_spine1_F45") - 1.0) < 1e-5, (
        u"脊柱 F45 不对"
    )
    cmds.setAttr(joint + ".rotateZ", -45.0)
    assert abs(cmds.getAttr(group + ".md_spine1_B45") - 1.0) < 1e-5, (
        u"脊柱 B45 不对"
    )
    cmds.setAttr(joint + ".rotateZ", 0.0)

    cmds.setAttr(joint + ".rotateY", -45.0)
    assert abs(cmds.getAttr(group + ".md_spine1_L45") - 1.0) < 1e-5, (
        u"脊柱 L45 不对"
    )
    cmds.setAttr(joint + ".rotateY", 0.0)

    cmds.setAttr(joint + ".rotateX", 45.0)
    assert abs(cmds.getAttr(group + ".md_spine1_TwsP45") - 1.0) < 1e-5, (
        u"脊柱扭转不对"
    )
    cmds.setAttr(joint + ".rotateX", 0.0)

    print(u"[ok] 脊柱：F45 / B45 / L45 / R45 / 双向扭转")


def check_build_all(joints):
    u"""一键生成全部：Shoulder / Hip 都建，其他跳过。"""

    results, errors = pose_driver_utils.build_all_supported()

    assert not errors, u"批量生成出错：{}".format(errors)
    assert len(results) == 14, u"应该生成 14 个，实际 {}".format(len(results))

    part_keys = sorted(result["part_key"] for result in results)

    assert part_keys == [
        "lf_ankle",
        "lf_hip",
        "lf_knee",
        "lf_shoulder",
        "md_legs",
        "md_spine1",
        "rt_clavicle",
        "rt_elbow",
        "rt_hip",
        "rt_index",
        "rt_knee",
        "rt_scapula",
        "rt_shoulder",
        "rt_wrist",
    ], u"部位列表不对：{}".format(part_keys)

    arm_parts = pose_driver_utils.get_part_list("grp_md_arm_pose_001")
    leg_parts = pose_driver_utils.get_part_list("grp_md_leg_pose_001")

    assert "lf_shoulder" in arm_parts, u"arm 组缺少左肩"
    assert "rt_elbow" in arm_parts, u"arm 组缺少右肘"
    assert "lf_hip" in leg_parts, u"leg 组缺少左大腿"
    assert "lf_ankle" in leg_parts, u"leg 组缺少左踝"

    # 大臂：单轴四方向 + 向上四对角，含 F45U90 / B45U90
    arm_group = "grp_md_arm_pose_001"

    for suffix in (
            "U90", "D45", "F90", "B70",
            "F45U90", "F45U45", "B45U45", "B45U90",
    ):
        assert cmds.attributeQuery(
            "lf_shoulder_" + suffix, node=arm_group, exists=True
        ), u"大臂缺少属性：{}".format(suffix)

    for suffix in ("F45D45", "B45D45"):
        assert not cmds.attributeQuery(
            "lf_shoulder_" + suffix, node=arm_group, exists=True
        ), u"大臂不该有：{}".format(suffix)

    # 大腿：夹角驱动，F90 / B70 / U90 / F45U90
    leg_group = "grp_md_leg_pose_001"

    for suffix in ("F90", "B70", "U90", "F45U90"):
        assert cmds.attributeQuery(
            "lf_hip_" + suffix, node=leg_group, exists=True
        ), u"大腿缺少属性：{}".format(suffix)

    for suffix in ("D45", "D90"):
        assert not cmds.attributeQuery(
            "lf_hip_" + suffix, node=leg_group, exists=True
        ), u"大腿不该有：{}".format(suffix)

    # 膝盖：负向屈伸 → B45 / B90 / B120
    for suffix in ("B45", "B90", "B120"):
        assert cmds.attributeQuery(
            "lf_knee_" + suffix, node=leg_group, exists=True
        ), u"膝盖缺少属性：{}".format(suffix)

    assert not cmds.attributeQuery(
        "lf_knee_F45", node=leg_group, exists=True
    ), u"膝盖不应再用 F45"

    print(u"[ok] 一键生成全部：{}".format(part_keys))


def check_skirt():
    u"""裙子组：leg_follow × 腿部属性。"""

    group = "grp_md_skirt_pose_001"

    assert cmds.objExists(group), u"缺少裙子组"
    assert cmds.attributeQuery("leg_follow", node=group, exists=True), (
        u"缺少 leg_follow"
    )
    assert cmds.attributeQuery(
        "skirt_lf_hip_F90", node=group, exists=True
    ), u"裙组没有镜像腿部属性"

    hip = "Hip1_L"
    cmds.setAttr(hip + ".rotateZ", 90.0)

    assert abs(
        cmds.getAttr("grp_md_leg_pose_001.lf_hip_F90") - 1.0
    ) < 1e-5, u"腿组 lf_hip_F90 没到 1"

    cmds.setAttr(group + ".leg_follow", 0.0)

    assert abs(cmds.getAttr(group + ".skirt_lf_hip_F90")) < 1e-5, (
        u"leg_follow=0 时裙组属性应归零"
    )

    cmds.setAttr(group + ".leg_follow", 1.0)

    assert abs(
        cmds.getAttr(group + ".skirt_lf_hip_F90") - 1.0
    ) < 1e-5, u"leg_follow=1 时裙组属性应跟随"

    cmds.setAttr(hip + ".rotateZ", 0.0)

    print(u"[ok] 裙子组：leg_follow + 腿部属性镜像")


def check_delete_all():
    u"""删除全部后连组一起清掉。"""

    removed = pose_driver_utils.delete_all_parts()

    assert removed >= 14, u"删除数量不对：{}".format(removed)

    assert not cmds.objExists(
        pose_driver_utils.master_group_name
    ), u"总组没有被删掉"

    for category in ("arm", "leg"):
        group = pose_driver_utils.get_group_name(category)
        assert not cmds.objExists(group), u"组没有被删掉：{}".format(group)

    print(u"[ok] 删除全部：{} 个部位，组也一起删".format(removed))


def check_bad_input(joints):
    u"""错误输入要明确报错。"""

    mesh = cmds.polyCube(name="geo_md_body_main_001")[0]

    try:
        pose_driver_utils.build_network(mesh)
    except RuntimeError:
        pass
    else:
        raise AssertionError(u"非关节没有报错")

    try:
        pose_driver_utils.build_network("Shoulder_X")
    except RuntimeError:
        pass
    else:
        raise AssertionError(u"不存在的关节没有报错")

    try:
        pose_driver_utils.build_network(joints["shoulder_l"], axes=(
            "rotateY", "rotateY"
        ))
    except ValueError:
        pass
    else:
        raise AssertionError(u"重复轴没有报错")

    for name in ("Index_L",):
        try:
            pose_driver_utils.build_network(name)
        except RuntimeError:
            pass
        else:
            raise AssertionError(u"{} 不该被支持".format(name))

    print(u"[ok] 错误输入被拦下")


def main():
    u"""依次跑所有检查。"""

    joints = build_scene()

    check_find_supported()
    check_identity()

    result = check_groups(joints["shoulder_l"])
    check_attributes(result)
    check_weights(joints["shoulder_l"], result)
    check_back_angle(joints["shoulder_l"], result)

    right_result = check_two_parts(joints)
    check_delete(right_result)

    check_rebuild(joints["shoulder_l"])

    check_limb(joints)
    check_clavicle(joints)
    check_scapula(joints)
    check_finger(joints)
    check_spine(joints)
    check_legs(joints)

    check_build_all(joints)
    check_blendshape()
    check_knee_direction()
    check_skirt()
    check_delete_all()

    check_bad_input(joints)

    cmds.file(new=True, force=True)

    print(u"\n全部通过")


if __name__ == "__main__":
    main()
