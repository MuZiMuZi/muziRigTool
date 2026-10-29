# coding=utf-8
"""RBF 版姿态驱动修型的 Maya 冒烟测试。

    "C:\\Program Files\\Autodesk\\Maya2023\\bin\\mayapy.exe" ^
        tests\\rbf_pose_driver_maya_smoke_test.py
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

from core.deformation import rbf_pose_driver_utils


def build_scene():
    u"""建一套最简 ADV 骨架。"""

    cmds.file(new=True, force=True)

    joints = {}

    for name, position in (
            ("Shoulder_L", (0, 0, 0)),
            ("Shoulder_R", (4, 0, 0)),
            ("Hip_L", (0, 4, 0)),
            ("Hip_R", (0, 8, 0)),
            ("Elbow_R", (0, 12, 0)),
            ("Knee_L", (0, 16, 0)),
            ("Wrist_R", (0, 20, 0)),
            ("Ankle_L", (0, 24, 0)),
            ("Clavicle_R", (0, 28, 0)),
            ("Spine1_M", (0, 32, 0)),
            ("Chest_M", (0, 36, 0)),
    ):
        cmds.select(clear=True)
        joints[name] = cmds.joint(name=name, position=position)

    return joints


def check_groups():
    u"""总组与四个汇总组。"""

    rbf_pose_driver_utils.ensure_all_groups()
    master = rbf_pose_driver_utils.rbf_master_group

    assert cmds.objExists(master), u"缺少 RBF 总组"
    assert not cmds.attributeQuery(
        "translateX", node=master, channelBox=True
    ), u"总组默认属性未隐藏"

    for category in rbf_pose_driver_utils.rbf_group_names:
        name = rbf_pose_driver_utils._group_name(category)

        assert cmds.objExists(name), u"缺少 RBF 汇总组：{}".format(name)

        parent = (cmds.listRelatives(name, parent=True) or [""])[0]

        assert parent == master, u"{} 没有收进 RBF 总组".format(name)

    print(u"[ok] RBF 总组 + 四个汇总组")


def check_build(joints):
    u"""生成全部部位并验证样本权重。"""

    results, errors = rbf_pose_driver_utils.build_all_supported()

    if errors:
        with open("rbf_error.txt", "w", encoding="utf-8") as handle:
            for name, error in errors:
                handle.write("{}: {}\n".format(name, error))

    assert not errors, u"生成失败：{}".format(errors)
    assert len(results) == 11, u"应该生成 11 个，实际 {}".format(len(results))

    part_keys = sorted(result["part_key"] for result in results)

    assert part_keys == [
        "lf_ankle",
        "lf_hip",
        "lf_knee",
        "lf_shoulder",
        "md_chest",
        "md_spine1",
        "rt_clavicle",
        "rt_elbow",
        "rt_hip",
        "rt_shoulder",
        "rt_wrist",
    ], u"部位列表不对：{}".format(part_keys)

    print(u"[ok] RBF 一键生成：{} 个部位".format(len(results)))


def check_samples(joints):
    u"""摆到样本姿态时对应属性接近 1，中立时接近 0。"""

    shoulder = joints["Shoulder_L"]
    group = "grp_rbf_arm_pose_001"

    cmds.setAttr(shoulder + ".rotateY", -90.0)

    weighted = cmds.getAttr(group + ".lf_shoulder_U90")

    assert abs(weighted - 1.0) < 1e-4, (
        u"肩 U90 样本点权重不是 1：{}".format(weighted)
    )

    neighbour = cmds.getAttr(group + ".lf_shoulder_D45")

    assert neighbour < 0.01, (
        u"肩 U90 样本点时 D45 不应有值：{}".format(neighbour)
    )

    cmds.setAttr(shoulder + ".rotateY", 0.0)

    neutral = cmds.getAttr(group + ".lf_shoulder_U90")

    assert neutral < 1e-4, u"中立时 U90 应为 0：{}".format(neutral)

    print(u"[ok] RBF 样本权重：中立 0 / 样本点 1 / 相邻干净")


def check_elbow(joints):
    u"""单轴多角度：F90 样本点。"""

    elbow = joints["Elbow_R"]
    group = "grp_rbf_arm_pose_001"

    cmds.setAttr(elbow + ".rotateZ", 90.0)

    value = cmds.getAttr(group + ".rt_elbow_F90")

    assert abs(value - 1.0) < 1e-4, (
        u"肘 F90 样本点权重不是 1：{}".format(value)
    )

    cmds.setAttr(elbow + ".rotateZ", 0.0)

    neutral = cmds.getAttr(group + ".rt_elbow_F90")

    assert neutral < 1e-4, u"中立时肘 F90 应为 0"

    print(u"[ok] RBF 单轴多角度：F90 样本点")


def check_delete():
    u"""删除全部。"""

    removed = rbf_pose_driver_utils.delete_all_rbf_parts()

    assert removed >= 11, u"删除数量不对：{}".format(removed)

    group = "grp_rbf_arm_pose_001"

    assert not cmds.attributeQuery(
        "lf_shoulder_U90", node=group, exists=True
    ), u"删除后属性残留"

    print(u"[ok] RBF 删除全部：{} 个部位".format(removed))


def main():
    joints = build_scene()

    try:
        check_groups()
        check_build(joints)
        check_samples(joints)
        check_elbow(joints)
        check_delete()
    finally:
        cmds.file(new=True, force=True)

    print(u"\nRBF 冒烟全部通过")


if __name__ == "__main__":
    main()
