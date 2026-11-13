# coding=utf-8
u"""面部绑定 M1 的 Maya 冒烟测试（jaw + eye）。

验证：

1. face_guide.ma 能被 Guide 读出来（根 / 下巴 / 眼球 / 眼皮 / 眉毛定位器数量）
2. Jaw：节点齐全、鼻环系数正确、locator 对连接存在
3. Eye：目标约束存在、眼球 X 轴指向控制器、blink/link 属性存在
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


def check_template(guide):
    u"""模板定位器数量与命名。"""

    check(guide.get_face_root(), u"缺少面部根定位器")
    check(guide.get_face_jaw(), u"缺少下巴定位器")

    for side in SIDE_LIST:
        check(guide.get_face_eye(side), u"缺少 {} 眼球定位器".format(side))
        check(guide.get_face_eyeup(side), u"缺少 {} 眼 up 定位器".format(side))
        check(
            len(guide.get_face_brow(side)) == 9,
            u"{} 眉毛定位器数量不对".format(side)
        )
        check(
            len(guide.get_face_brow_curve(side, "crv")) == 7,
            u"{} 眉毛驱动曲线定位器数量不对".format(side)
        )
        check(
            len(guide.get_face_brow_curve(side, "aim")) == 7,
            u"{} 眉毛目标曲线定位器数量不对".format(side)
        )
        check(
            len(guide.get_face_lid_curve(side, "up")) == 9,
            u"{} 上眼皮曲线定位器数量不对".format(side)
        )
        check(
            len(guide.get_face_lid_curve(side, "low")) == 9,
            u"{} 下眼皮曲线定位器数量不对".format(side)
        )


def check_jaw(guide):
    u"""下巴：结构 + 旋转补位移。"""

    jaw = Jaw(
        side="md",
        guides=[guide.get_face_root(), guide.get_face_jaw()]
    )
    jaw.build_rig()
    jaw.connect_rig()

    for node in (
        "jnt_md_face_root_001",
        "jnt_md_jaw_bind_001",
        "ctrl_md_jaw_main_001",
        "mult_md_jaw_dropy_001",
        "mult_md_jaw_dropz_001",
        "cons_md_jaw_main_001",
        "loc_md_jaw_driver_001",
        "loc_md_jaw_driven_001",
    ):
        check(cmds.objExists(node), u"下巴缺少节点：{}".format(node))

    # 控制器 → connect 组的系数
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

    # 下巴关节的世界位置应当跟着动
    moved = world_position("jnt_md_jaw_bind_001")
    cmds.setAttr("ctrl_md_jaw_main_001.rotateX", 0.0)
    still = world_position("jnt_md_jaw_bind_001")

    check(
        abs(moved[1] - still[1]) > 1e-3 or abs(moved[2] - still[2]) > 1e-3,
        u"下巴关节没有跟随控制器"
    )

    # 重复构建不能报错
    jaw.build_rig()
    jaw.connect_rig()

    check(
        cmds.objExists("jnt_md_jaw_bind_001"),
        u"重复构建后下巴关节丢失"
    )

    jaw.delete_rig()

    for node in (
        "jnt_md_face_root_001",
        "jnt_md_jaw_bind_001",
        "ctrl_md_jaw_main_001",
        "mult_md_jaw_dropy_001",
        "loc_md_jaw_driver_001",
    ):
        check(
            not cmds.objExists(node),
            u"删除后仍有残留：{}".format(node)
        )

    return jaw


def check_eye(guide):
    u"""眼球：结构 + 目标约束 + 追踪角度。"""

    eye = Eye(
        side="lf",
        guides=[guide.get_face_eye("lf"), guide.get_face_eyeup("lf")]
    )
    eye.build_rig()
    eye.connect_rig()

    for node in (
        "jnt_lf_eye_bind_001",
        "ctrl_lf_eye_main_001",
        "loc_lf_eye_up_001",
        "cons_lf_eye_aim_001",
    ):
        check(cmds.objExists(node), u"眼球缺少节点：{}".format(node))

    for attribute in ("blink", "link"):
        check(
            cmds.attributeQuery(attribute, node="ctrl_lf_eye_main_001",
                                exists=True),
            u"眼球控制器缺少属性：{}".format(attribute)
        )

    # 控制器默认在眼球正前方，X 轴应指向它
    joint = world_position("jnt_lf_eye_bind_001")
    target = world_position("ctrl_lf_eye_main_001")
    direction = [target[index] - joint[index] for index in range(3)]

    angle = vector_angle(joint_axis("jnt_lf_eye_bind_001", 0), direction)

    check(angle < 1.0, u"眼球没有看向控制器：{} 度".format(angle))

    # 把控制器往上移，眼球应跟着抬头
    cmds.xform(
        "ctrl_lf_eye_main_001",
        worldSpace=True,
        translation=[target[0], target[1] + 4.0, target[2]]
    )

    new_target = world_position("ctrl_lf_eye_main_001")
    direction = [
        new_target[index] - joint[index] for index in range(3)
    ]
    angle = vector_angle(joint_axis("jnt_lf_eye_bind_001", 0), direction)

    check(angle < 1.0, u"眼球没有跟随控制器抬头：{} 度".format(angle))

    eye.delete_rig()

    for node in (
        "jnt_lf_eye_bind_001",
        "ctrl_lf_eye_main_001",
        "loc_lf_eye_up_001",
        "cons_lf_eye_aim_001",
    ):
        check(
            not cmds.objExists(node),
            u"删除后仍有残留：{}".format(node)
        )

    return eye


def run():
    u"""跑全部检查。"""

    cmds.file(new=True, force=True)

    guide = Guide("face")
    guide.import_template()

    check_template(guide)
    check_jaw(guide)
    check_eye(guide)

    print(u"PASS: face_guide 模板读取")
    print(u"PASS: Jaw 结构 / 旋转补位移 / 重建 / 删除")
    print(u"PASS: Eye 结构 / 目标约束 / 追踪 / 删除")

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
