# coding=utf-8
u"""面部绑定 M1 的 Maya 冒烟测试（jaw + eye）。

验证：

1. face_guide.ma（课程版）能被 Guide 读出来
2. Jaw：根 / 下颌 / 下巴尖三个关节、系数、locator 对对齐
3. Eye：目标约束、视线跟随、blink/link 属性
4. 重复构建、删除后无残留

跑法（mayapy）：

    "C:\\Program Files\\Autodesk\\Maya2023\\bin\\mayapy.exe" tests\\face_rig_maya_smoke_test.py
"""

import math
import os
import sys
import traceback


SCRIPTS_DIR = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.abspath(__file__)
        )
    )
)

if SCRIPTS_DIR not in sys.path:
    sys.path.insert(0, SCRIPTS_DIR)


import maya.standalone

maya.standalone.initialize(name="python")

from maya import cmds  # noqa: E402

from muziRigTool.systems.rig.guide import Guide  # noqa: E402
from muziRigTool.systems.rig.module.face.jaw import Jaw  # noqa: E402
from muziRigTool.systems.rig.module.face.eye import Eye  # noqa: E402


SIDE_LIST = ("lf", "rt")


def check(condition, message):
    u"""断言失败时抛出可读的错误。"""

    if not condition:
        raise AssertionError(message)


def vector_angle(first, second):
    u"""两个向量的夹角（度）。"""

    dot = sum(a * b for a, b in zip(first, second))
    length = math.sqrt(sum(a * a for a in first))
    other = math.sqrt(sum(b * b for b in second))

    if length < 1e-9 or other < 1e-9:
        return 180.0

    cosine = max(-1.0, min(1.0, dot / (length * other)))

    return math.degrees(math.acos(cosine))


def joint_axis(joint, index):
    u"""关节世界矩阵的某一根轴（0=X, 1=Y, 2=Z）。"""

    matrix = cmds.xform(joint, query=True, worldSpace=True, matrix=True)

    return matrix[index * 4:index * 4 + 3]


def world_position(node):
    u"""世界坐标。"""

    return cmds.xform(node, query=True, worldSpace=True, translation=True)


def guide_world(node):
    u"""模板定位器的视觉位置（世界 rotate pivot）。"""

    return cmds.xform(node, query=True, worldSpace=True, rotatePivot=True)


def distance(first, second):
    u"""两点最大轴差。"""

    return max(abs(first[index] - second[index]) for index in range(3))


def check_template(guide):
    u"""模板定位器数量与命名。"""

    check(guide.get_face_move(), u"缺少 face_move 控制器")
    check(guide.get_face_jaw(), u"缺少下颌枢轴定位器")
    check(guide.get_face_jaw_end(), u"缺少下巴尖定位器")

    for side in SIDE_LIST:
        check(guide.get_face_eye(side), u"缺少 {} 眼球".format(side))
        check(guide.get_face_eye_iris(side), u"缺少 {} 虹膜".format(side))
        check(guide.get_face_eye_aim(side), u"缺少 {} 视线目标".format(side))

        check(
            len(guide.get_face_brow_bind(side)) == 5,
            u"{} 眉毛定位器数量不对".format(side)
        )
        check(
            guide.get_face_brow_main(side), u"{} 缺少眉毛主控".format(side)
        )
        check(
            guide.get_face_brow_curve(side), u"{} 缺少眉毛曲线".format(side)
        )
        check(
            guide.get_face_lid_curve(side, "upper"),
            u"{} 缺少上眼皮曲线".format(side)
        )
        check(
            guide.get_face_lid_curve(side, "lower"),
            u"{} 缺少下眼皮曲线".format(side)
        )
        check(
            len(guide.get_face_lid_bind(side, "upper")) == 3,
            u"{} 上眼皮定位器数量不对".format(side)
        )
        check(
            len(guide.get_face_lid_bind(side, "lower")) == 3,
            u"{} 下眼皮定位器数量不对".format(side)
        )
        check(
            guide.get_face_mouth_corner(side),
            u"{} 缺少嘴角定位器".format(side)
        )
        check(
            len(guide.get_face_ear(side)) == 3,
            u"{} 耳朵定位器数量不对".format(side)
        )
        check(
            len(guide.get_face_zygoma(side)) == 3,
            u"{} 颧骨定位器数量不对".format(side)
        )

    check(guide.get_face_lip_curve("upper"), u"缺少上唇曲线")
    check(guide.get_face_lip_curve("lower"), u"缺少下唇曲线")
    check(
        len(guide.get_face_lip_bind("lf", "upper")) == 2,
        u"左上唇定位器数量不对"
    )
    check(guide.get_face_nose(), u"缺少鼻子定位器")
    check(guide.get_face_muzzle(), u"缺少口鼻定位器")

    upper_teeth, lower_teeth = guide.get_face_teeth()
    check(upper_teeth and lower_teeth, u"缺少牙齿定位器")
    check(len(guide.get_face_tongue()) == 5, u"舌头定位器数量不对")


def check_jaw(guide):
    u"""下巴：结构 + 旋转补位移。"""

    jaw = Jaw(
        side="md",
        guides=[
            guide.get_face_jaw(),
            guide.get_face_jaw_end(),
        ]
    )
    jaw.build_rig()
    jaw.connect_rig()

    for node in (
        "jnt_md_jaw_bind_001",
        "jnt_md_jaw_tip_001",
        "ctrl_md_jaw_main_001",
        "mult_md_jaw_dropy_001",
        "mult_md_jaw_dropz_001",
        "cons_md_jaw_main_001",
        "loc_md_jaw_driver_001",
        "loc_md_jaw_driven_001",
    ):
        check(cmds.objExists(node), u"下巴缺少节点：{}".format(node))

    check(
        not cmds.objExists("jnt_md_face_root_001"),
        u"未传 root_guide 时不该自己造面部根关节"
    )

    # 下颌关节必须严格等于模板定位器的 pivot 位置
    for joint, locator in (
        ("jnt_md_jaw_bind_001", "loc_md_jaw_start_bind_001"),
        ("jnt_md_jaw_tip_001", "loc_md_jaw_end_bind_001"),
        ("ctrl_md_jaw_main_001", "loc_md_jaw_start_bind_001"),
    ):
        offset = distance(world_position(joint), guide_world(locator))
        check(offset < 1e-4, u"{} 与 {} 偏移 {}".format(joint, locator, offset))

    ctrl_position = world_position("ctrl_md_jaw_main_001")

    for node in ("zero_md_jaw_driver_001", "zero_md_jaw_driven_001",
                 "loc_md_jaw_driver_001", "loc_md_jaw_driven_001"):
        offset = distance(world_position(node), ctrl_position)
        check(
            offset < 1e-4,
            u"{} 没有对齐控制器，偏差 {}".format(node, offset)
        )

    cmds.setAttr("ctrl_md_jaw_main_001.rotateX", -20.0)

    translate_y = cmds.getAttr("connect_md_jaw_main_001.translateY")
    translate_z = cmds.getAttr("connect_md_jaw_main_001.translateZ")

    check(
        abs(translate_y - (-20.0 * 0.03)) < 1e-4,
        u"下巴 Y 位移不对：{}".format(translate_y)
    )
    check(
        abs(translate_z - (-20.0 * -0.04)) < 1e-4,
        u"下巴 Z 位移不对：{}".format(translate_z)
    )

    moved = world_position("jnt_md_jaw_bind_001")
    cmds.setAttr("ctrl_md_jaw_main_001.rotateX", 0.0)
    still = world_position("jnt_md_jaw_bind_001")

    check(distance(moved, still) > 1e-3, u"下巴关节没有跟随控制器")

    jaw.build_rig()
    jaw.connect_rig()

    check(cmds.objExists("jnt_md_jaw_bind_001"), u"重复构建后下巴关节丢失")

    # 传 root_guide 时才建面部根关节，下颌挂在它下面
    jaw_root = Jaw(
        side="md",
        guides=[
            guide.get_face_jaw(),
            guide.get_face_jaw_end(),
        ],
        root_guide=guide.get_face_move(),
    )
    jaw_root.build_rig()
    jaw_root.connect_rig()

    check(
        cmds.objExists("jnt_md_face_root_001"),
        u"传 root_guide 时应创建面部根关节"
    )

    jaw_root.delete_rig()

    jaw.delete_rig()

    for node in (
        "jnt_md_jaw_bind_001",
        "jnt_md_jaw_tip_001",
        "ctrl_md_jaw_main_001",
        "mult_md_jaw_dropy_001",
        "loc_md_jaw_driver_001",
    ):
        check(not cmds.objExists(node), u"删除后仍有残留：{}".format(node))

    return jaw


def check_eye(guide):
    u"""眼球：结构 + 视线跟随。"""

    eye = Eye(
        side="lf",
        guides=[
            guide.get_face_eye("lf"),
            guide.get_face_eye_aim("lf"),
        ]
    )
    eye.build_rig()
    eye.connect_rig()

    for node in (
        "jnt_lf_eye_bind_001",
        "ctrl_lf_eye_main_001",
        "loc_lf_eye_gaze_001",
        "cons_lf_eye_aim_001",
    ):
        check(cmds.objExists(node), u"眼球缺少节点：{}".format(node))

    for attribute in ("blink", "link"):
        check(
            cmds.attributeQuery(attribute, node="ctrl_lf_eye_main_001",
                                exists=True),
            u"眼球控制器缺少属性：{}".format(attribute)
        )

    eye_guide = guide_world("loc_lf_eye_ball_001")
    joint = world_position("jnt_lf_eye_bind_001")
    offset = distance(eye_guide, joint)
    check(offset < 1e-4, u"眼球关节没有对齐眼球定位器：{}".format(offset))

    gaze = world_position("loc_lf_eye_gaze_001")
    direction = [gaze[index] - joint[index] for index in range(3)]

    angle = vector_angle(joint_axis("jnt_lf_eye_bind_001", 0), direction)
    check(angle < 1.0, u"眼球没有看向目标点：{} 度".format(angle))

    # 控制器向上移一段，视线应跟着抬头
    ctrl = world_position("ctrl_lf_eye_main_001")
    cmds.xform(
        "ctrl_lf_eye_main_001",
        worldSpace=True,
        translation=[ctrl[0], ctrl[1] + 50.0, ctrl[2]]
    )

    gaze = world_position("loc_lf_eye_gaze_001")
    direction = [gaze[index] - joint[index] for index in range(3)]
    angle = vector_angle(joint_axis("jnt_lf_eye_bind_001", 0), direction)

    check(angle < 1.0, u"眼球没有跟随控制器：{} 度".format(angle))

    eye.delete_rig()

    for node in (
        "jnt_lf_eye_bind_001",
        "ctrl_lf_eye_main_001",
        "loc_lf_eye_gaze_001",
        "cons_lf_eye_aim_001",
    ):
        check(not cmds.objExists(node), u"删除后仍有残留：{}".format(node))

    return eye


def run():
    u"""跑全部检查。"""

    cmds.file(new=True, force=True)

    guide = Guide("face")
    guide.import_template()

    check_template(guide)
    check_jaw(guide)
    check_eye(guide)

    print(u"PASS: face_guide 模板读取（课程版命名）")
    print(u"PASS: Jaw 结构 / 旋转补位移 / 重建 / 删除")
    print(u"PASS: Eye 结构 / 视线跟随 / 删除")

    return True


def main():
    u"""入口：捕获异常并给出可读输出。"""

    try:
        run()
    except Exception:
        traceback.print_exc()
        sys.exit(1)

    sys.exit(0)


if __name__ == "__main__":
    main()
