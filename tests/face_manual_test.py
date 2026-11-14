# coding=utf-8
u"""面部绑定手动测试（Maya 脚本编辑器 / mayapy 都能跑）。

用法（Maya Script Editor，Python）：

    exec(open(r"C:\\Users\\X\\Documents\\maya\\scripts\\muziRigTool\\tests\\face_manual_test.py", encoding="utf-8").read())

它会：

    1. 重载 guide / base / jaw / eye 四个模块
    2. 导入 face_guide.ma
    3. 建下巴（下颌枢轴 + 下巴尖）
    4. 建左右眼球
    5. 打印「关节 / 控制器 vs 模板定位器」的坐标与偏差
    6. 转下巴控制器，检查 connect 组位移和关节跟随
    7. 拖眼球控制器，检查视线角度
    8. 打印 PASS / FAIL 汇总，并提示怎么删掉

不会清场景、不会删你已有的东西；要清理调用 cleanup()。
"""

import importlib
import math
import os
import sys


SCRIPTS_DIR = r"C:\Users\X\Documents\maya\scripts"

if SCRIPTS_DIR not in sys.path:
    sys.path.insert(0, SCRIPTS_DIR)

from maya import cmds  # noqa: E402


# ----------------------------------------------------------------------
# 工具
# ----------------------------------------------------------------------

def reload_modules():
    u"""按依赖顺序重载面部模块。"""

    import muziRigTool.systems.rig.guide as guide_mod
    import muziRigTool.systems.rig.module.face.base as base_mod
    import muziRigTool.systems.rig.module.face.jaw as jaw_mod
    import muziRigTool.systems.rig.module.face.eye as eye_mod

    for module in (guide_mod, base_mod, jaw_mod, eye_mod):
        importlib.reload(module)

    print(u"[重载] guide / base / jaw / eye 完成")


def world_position(node):
    u"""世界坐标；节点不存在时返回 None。"""

    if not cmds.objExists(node):
        return None

    return cmds.xform(node, query=True, worldSpace=True, translation=True)


def distance(first, second):
    u"""两点最大轴差。"""

    if first is None or second is None:
        return float("inf")

    return max(abs(first[index] - second[index]) for index in range(3))


def joint_axis(joint, index):
    u"""关节世界矩阵的某一根轴。"""

    matrix = cmds.xform(joint, query=True, worldSpace=True, matrix=True)

    return matrix[index * 4:index * 4 + 3]


def vector_angle(first, second):
    u"""两个向量的夹角（度）。"""

    dot = sum(a * b for a, b in zip(first, second))
    length = math.sqrt(sum(a * a for a in first))
    other = math.sqrt(sum(b * b for b in second))

    if length < 1e-9 or other < 1e-9:
        return 180.0

    cosine = max(-1.0, min(1.0, dot / (length * other)))

    return math.degrees(math.acos(cosine))


def report_position(label, node, reference=None):
    u"""打印节点坐标，并和参考点比较。"""

    position = world_position(node)

    if position is None:
        print(u"  [缺失] {}".format(node))
        return False

    text = u"  {:<26} ({:>10.2f}, {:>10.2f}, {:>10.2f})".format(
        node, position[0], position[1], position[2]
    )

    if reference is not None:
        offset = distance(position, world_position(reference))
        text += u"   偏差 {:.4f}  （参考 {}）".format(offset, reference)

        if offset > 1e-3:
            print(text + u"  ❌")
            return False

        print(text + u"  ✅")
        return True

    print(text)
    return True


# ----------------------------------------------------------------------
# 构建
# ----------------------------------------------------------------------

def build(g):
    u"""建下巴 + 左右眼球，返回对象。"""

    from muziRigTool.systems.rig.module.face.jaw import Jaw
    from muziRigTool.systems.rig.module.face.eye import Eye

    jaw = Jaw(
        side="md",
        guides=[g.get_face_jaw(), g.get_face_jaw_end()]
    )
    jaw.delete_rig()
    jaw.build_rig()
    jaw.connect_rig()

    eyes = {}

    for side in ("lf", "rt"):
        eye = Eye(
            side=side,
            guides=[g.get_face_eye(side), g.get_face_eye_aim(side)]
        )
        eye.delete_rig()
        eye.build_rig()
        eye.connect_rig()
        eyes[side] = eye

    return jaw, eyes


# ----------------------------------------------------------------------
# 检查
# ----------------------------------------------------------------------

def check_jaw_positions(results):
    u"""下巴关节 / 控制器必须和模板定位器重合。"""

    print(u"\n[1] 下巴位置")

    pairs = (
        ("jnt_md_jaw_bind_001", "loc_md_jaw_start_bind_001"),
        ("jnt_md_jaw_tip_001", "loc_md_jaw_end_bind_001"),
        ("ctrl_md_jaw_main_001", "loc_md_jaw_start_bind_001"),
        ("zero_md_jaw_driver_001", "loc_md_jaw_start_bind_001"),
        ("loc_md_jaw_driven_001", "loc_md_jaw_start_bind_001"),
    )

    for node, reference in pairs:
        results.append(report_position("jaw", node, reference))


def check_jaw_motion(results):
    u"""转下巴控制器：系数位移 + 关节跟随。"""

    print(u"\n[2] 下巴旋转驱动")

    if not cmds.objExists("ctrl_md_jaw_main_001"):
        print(u"  [跳过] 控制器不存在")
        results.append(False)
        return

    before = world_position("jnt_md_jaw_bind_001")
    cmds.setAttr("ctrl_md_jaw_main_001.rotateX", -20.0)

    translate_y = cmds.getAttr("connect_md_jaw_main_001.translateY")
    translate_z = cmds.getAttr("connect_md_jaw_main_001.translateZ")

    after = world_position("jnt_md_jaw_bind_001")

    good_y = abs(translate_y - (-20.0 * 0.03)) < 1e-4
    good_z = abs(translate_z - (-20.0 * -0.04)) < 1e-4
    moved = distance(before, after) > 1e-3

    print(u"  connect.translateY = {:.4f}  期望 -0.6000  {}".format(
        translate_y, u"✅" if good_y else u"❌"))
    print(u"  connect.translateZ = {:.4f}  期望  0.8000  {}".format(
        translate_z, u"✅" if good_z else u"❌"))
    print(u"  下颌关节位移 = {:.4f}  {}".format(
        distance(before, after), u"✅" if moved else u"❌"))

    cmds.setAttr("ctrl_md_jaw_main_001.rotateX", 0.0)
    results.extend([good_y, good_z, moved])


def check_eyes(results):
    u"""眼球：位置 + 视线跟随。"""

    print(u"\n[3] 眼球位置与视线")

    for side in ("lf", "rt"):
        joint = "jnt_{}_eye_bind_001".format(side)
        ball = "loc_{}_eye_ball_001".format(side)
        ctrl = "ctrl_{}_eye_main_001".format(side)
        gaze = "loc_{}_eye_gaze_001".format(side)

        results.append(report_position(side, joint, ball))
        results.append(report_position(side, ctrl, ball))

        if not (cmds.objExists(joint) and cmds.objExists(gaze)):
            results.append(False)
            continue

        joint_position = world_position(joint)
        gaze_position = world_position(gaze)
        direction = [
            gaze_position[index] - joint_position[index]
            for index in range(3)
        ]
        angle = vector_angle(joint_axis(joint, 0), direction)
        print(u"  {} 初始视线偏差 {:.3f}°  {}".format(
            side, angle, u"✅" if angle < 1.0 else u"❌"))
        results.append(angle < 1.0)

        # 控制器上移，眼球应该跟着抬头
        ctrl_position = world_position(ctrl)
        cmds.xform(
            ctrl, worldSpace=True,
            translation=[
                ctrl_position[0],
                ctrl_position[1] + 50.0,
                ctrl_position[2],
            ]
        )

        gaze_position = world_position(gaze)
        direction = [
            gaze_position[index] - joint_position[index]
            for index in range(3)
        ]
        angle = vector_angle(joint_axis(joint, 0), direction)
        print(u"  {} 控制器上移后视线偏差 {:.3f}°  {}".format(
            side, angle, u"✅" if angle < 1.0 else u"❌"))
        results.append(angle < 1.0)

        cmds.xform(ctrl, worldSpace=True, translation=ctrl_position)


# ----------------------------------------------------------------------
# 入口
# ----------------------------------------------------------------------

def cleanup():
    u"""删掉测试建的下巴和眼球。"""

    from muziRigTool.systems.rig.module.face.jaw import Jaw
    from muziRigTool.systems.rig.module.face.eye import Eye
    from muziRigTool.systems.rig.guide import Guide

    g = Guide("face")

    jaw = Jaw(side="md", guides=[g.get_face_jaw(), g.get_face_jaw_end()])
    jaw.delete_rig()

    for side in ("lf", "rt"):
        eye = Eye(
            side=side,
            guides=[g.get_face_eye(side), g.get_face_eye_aim(side)]
        )
        eye.delete_rig()

    print(u"[清理] 已删除下巴 / 左右眼球")


def run():
    u"""跑完整测试。"""

    print(u"=" * 60)
    print(u"面部绑定 M1 手动测试")
    print(u"=" * 60)

    reload_modules()

    from muziRigTool.systems.rig.guide import Guide

    g = Guide("face")
    g.import_template()
    print(u"[模板] face_guide.ma 已导入")

    build(g)
    print(u"[构建] 下巴 + 左右眼球完成")

    results = []
    check_jaw_positions(results)
    check_jaw_motion(results)
    check_eyes(results)

    passed = sum(1 for item in results if item)
    total = len(results)

    print(u"\n" + u"=" * 60)
    print(u"结果：{}/{} 通过".format(passed, total))

    if passed == total:
        print(u"全部通过 ✅")
    else:
        print(u"有失败项 ❌ —— 把上面的输出发我")

    print(u"要清理：在同一个脚本编辑器里直接调用 cleanup()")
    print(u"=" * 60)

    return passed == total


run()
