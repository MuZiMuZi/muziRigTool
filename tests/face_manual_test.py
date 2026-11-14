# coding=utf-8
u"""面部绑定手动测试（Maya Script Editor / mayapy 都能跑）。

用法（Maya Script Editor，Python）：

    exec(open(r"C:\\Users\\X\\Documents\\maya\\scripts\\muziRigTool\\tests\\face_manual_test.py", encoding="utf-8").read())

流程：

    1. 重载 guide / base / jaw / eye
    2. 导入 face_guide.ma
    3. 建下巴（下颌枢轴 + 下巴尖）
    4. 建左右眼球（箭头控制器）
    5. 打印「关节 / 控制器 vs 模板定位器」坐标与偏差
    6. 转下巴控制器，检查系数位移与关节跟随
    7. 拖眼球控制器，检查视线角度
    8. 汇总并通过/失败

不会清场景；要清理在同一个编辑器里调用 cleanup()。
把 BUILD_CONSTRAINTS 改成 False，可以只建关节和控制器、不挂约束。
"""

import importlib
import math
import sys

SCRIPTS_DIR = r"C:\Users\X\Documents\maya\scripts"

if SCRIPTS_DIR not in sys.path:
    sys.path.insert(0, SCRIPTS_DIR)

from maya import cmds  # noqa: E402


# 先只建结构、不挂约束时改成 False
BUILD_CONSTRAINTS = True


# ----------------------------------------------------------------------
# 基础工具
# ----------------------------------------------------------------------

def reload_modules():
    u"""按依赖顺序重载面部模块。"""

    import muziRigTool.systems.rig.guide as guide_mod
    import muziRigTool.systems.rig.module.face.base as base_mod
    import muziRigTool.systems.rig.module.face.jaw as jaw_mod
    import muziRigTool.systems.rig.module.face.eye as eye_mod

    for module in (guide_mod, base_mod, jaw_mod, eye_mod):
        importlib.reload(module)

    print(u"[重载] guide / base / jaw / eye")


def guide_position(node, use_pivot=True):
    u"""定位器的真实位置：默认 rotatePivot，pivot 缺失时按对侧镜像补。"""

    translation = cmds.xform(node, query=True, worldSpace=True,
                             translation=True)

    if not use_pivot:
        return translation

    pivot = cmds.xform(node, query=True, worldSpace=True,
                       rotatePivot=True)
    offset = [pivot[i] - translation[i] for i in range(3)]

    if max(abs(value) for value in offset) > 1e-4:
        return pivot

    short_name = node.split("|")[-1]
    mirror = None

    if "_lf_" in short_name:
        mirror = short_name.replace("_lf_", "_rt_", 1)
    elif "_rt_" in short_name:
        mirror = short_name.replace("_rt_", "_lf_", 1)

    if mirror and cmds.objExists(mirror):
        mirror_pivot = cmds.xform(mirror, query=True, worldSpace=True,
                                  rotatePivot=True)
        mirror_translation = cmds.xform(mirror, query=True, worldSpace=True,
                                        translation=True)
        mirror_offset = [
            mirror_pivot[i] - mirror_translation[i] for i in range(3)
        ]

        if max(abs(value) for value in mirror_offset) > 1e-4:
            return [
                translation[0] - mirror_offset[0],
                translation[1] + mirror_offset[1],
                translation[2] + mirror_offset[2],
            ]

    return translation


def world_position(node):
    u"""节点的世界位置。"""

    if not cmds.objExists(node):
        return None

    return cmds.xform(node, query=True, worldSpace=True, translation=True)


def distance(first, second):
    u"""两点最大轴差。"""

    if first is None or second is None:
        return float("inf")

    return max(abs(first[index] - second[index]) for index in range(3))


def joint_axis(joint, index):
    u"""关节世界矩阵的某根轴。"""

    matrix = cmds.xform(joint, query=True, worldSpace=True, matrix=True)

    return matrix[index * 4:index * 4 + 3]


def vector_angle(first, second):
    u"""两个向量的夹角（度）。"""

    dot = sum(a * b for a, b in zip(first, second))
    length = math.sqrt(sum(a * a for a in first))
    other = math.sqrt(sum(b * b for b in second))

    if length < 1e-9 or other < 1e-9:
        return 180.0

    return math.degrees(math.acos(max(-1.0, min(1.0, dot / (length * other)))))


def report(label, node, reference, results, use_pivot=True):
    u"""打印节点位置并和模板定位器比较。"""

    position = world_position(node)

    if position is None:
        print(u"  ❌ {} 不存在".format(node))
        results.append(False)
        return

    target = guide_position(reference, use_pivot)
    offset = distance(position, target)

    mark = u"✅" if offset < 1e-3 else u"❌"
    print(u"  {:<24} ({:>9.2f}, {:>9.2f}, {:>9.2f})  偏差 {:.4f} {}"
          .format(node, position[0], position[1], position[2], offset, mark))

    results.append(offset < 1e-3)


# ----------------------------------------------------------------------
# 构建
# ----------------------------------------------------------------------

def build(g):
    u"""建下巴 + 左右眼球。"""

    from muziRigTool.systems.rig.module.face.jaw import Jaw
    from muziRigTool.systems.rig.module.face.eye import Eye

    jaw = Jaw(
        side="md",
        guides=[g.get_face_jaw(), g.get_face_jaw_end()],
        constraints=BUILD_CONSTRAINTS,
    )
    jaw.delete_rig()
    jaw.build_rig()
    jaw.connect_rig()

    eyes = {}

    for side in ("lf", "rt"):
        eye = Eye(
            side=side,
            guides=[g.get_face_eye(side), g.get_face_eye_aim(side)],
            constraints=BUILD_CONSTRAINTS,
        )
        eye.delete_rig()
        eye.build_rig()
        eye.connect_rig()
        eyes[side] = eye

    return jaw, eyes


# ----------------------------------------------------------------------
# 检查
# ----------------------------------------------------------------------

def check_positions(results):
    u"""所有结构节点必须压在模板定位器的 pivot 上。"""

    print(u"\n[1] 位置对比（关节 / 控制器 vs 模板 pivot）")

    pairs = (
        ("jnt_md_jaw_bind_001", "loc_md_jaw_start_bind_001"),
        ("jnt_md_jaw_tip_001", "loc_md_jaw_end_bind_001"),
        ("ctrl_md_jaw_main_001", "loc_md_jaw_start_bind_001"),
        ("loc_md_jaw_driver_001", "loc_md_jaw_start_bind_001"),
    )

    for node, reference in pairs:
        report("pos", node, reference, results)

    eye_pairs = (
        ("jnt_lf_eye_bind_001", "loc_lf_eye_ball_001"),
        ("ctrl_lf_eye_main_001", "loc_lf_eye_ball_001"),
        ("loc_lf_eye_gaze_001", "loc_lf_eye_aim_001"),
        ("jnt_rt_eye_bind_001", "loc_rt_eye_ball_001"),
        ("ctrl_rt_eye_main_001", "loc_rt_eye_ball_001"),
    )

    for node, reference in eye_pairs:
        report("pos", node, reference, results)


def check_jaw_motion(results):
    u"""转下巴控制器：系数位移 + 关节跟随。"""

    print(u"\n[2] 下巴旋转驱动")

    if not cmds.objExists("ctrl_md_jaw_main_001"):
        print(u"  ❌ 控制器不存在")
        results.append(False)
        return

    before = world_position("jnt_md_jaw_bind_001")
    cmds.setAttr("ctrl_md_jaw_main_001.rotateX", -20.0)

    translate_y = cmds.getAttr("connect_md_jaw_main_001.translateY")
    translate_z = cmds.getAttr("connect_md_jaw_main_001.translateZ")
    after = world_position("jnt_md_jaw_bind_001")

    good = (
        abs(translate_y - (-20.0 * 0.03)) < 1e-4
        and abs(translate_z - (-20.0 * -0.04)) < 1e-4
        and distance(before, after) > 1e-3
    )

    print(u"  connect.translateY = {:+.4f}（期望 -0.6）".format(translate_y))
    print(u"  connect.translateZ = {:+.4f}（期望 +0.8）".format(translate_z))
    print(u"  下颌关节位移 = {:.4f}  {}".format(
        distance(before, after), u"✅" if good else u"❌"))

    cmds.setAttr("ctrl_md_jaw_main_001.rotateX", 0.0)
    results.append(good)


def check_eye_motion(results):
    u"""拖眼球控制器，检查视线角度。"""

    print(u"\n[3] 眼球视线")

    for side in ("lf", "rt"):
        joint = "jnt_{}_eye_bind_001".format(side)
        ctrl = "ctrl_{}_eye_main_001".format(side)
        gaze = "loc_{}_eye_gaze_001".format(side)

        if not (cmds.objExists(joint) and cmds.objExists(gaze)):
            print(u"  ❌ {} 眼球节点缺失".format(side))
            results.append(False)
            continue

        joint_position = world_position(joint)
        original = world_position(ctrl)

        def angle_to_gaze():
            target = world_position(gaze)
            direction = [
                target[index] - joint_position[index]
                for index in range(3)
            ]
            return vector_angle(joint_axis(joint, 0), direction)

        first = angle_to_gaze()

        cmds.xform(
            ctrl, worldSpace=True,
            translation=[
                original[0],
                original[1] + 50.0,
                original[2],
            ]
        )

        second = angle_to_gaze()

        cmds.xform(ctrl, worldSpace=True, translation=original)

        good = first < 1.0 and second < 1.0

        print(u"  {} 初始 {:.3f}° / 上移后 {:.3f}°  {}".format(
            side, first, second, u"✅" if good else u"❌"))

        results.append(good)


# ----------------------------------------------------------------------
# 清理 / 入口
# ----------------------------------------------------------------------

def cleanup():
    u"""删掉测试建的下巴和眼球。"""

    from muziRigTool.systems.rig.guide import Guide
    from muziRigTool.systems.rig.module.face.jaw import Jaw
    from muziRigTool.systems.rig.module.face.eye import Eye

    g = Guide("face")

    Jaw(side="md", guides=[g.get_face_jaw(), g.get_face_jaw_end()]).delete_rig()

    for side in ("lf", "rt"):
        Eye(
            side=side,
            guides=[g.get_face_eye(side), g.get_face_eye_aim(side)]
        ).delete_rig()

    print(u"[清理] 下巴 / 左右眼球已删除")


def run():
    u"""跑完整测试，返回是否全部通过。"""

    print(u"=" * 62)
    print(u"面部绑定 M1 手动测试")
    print(u"=" * 62)

    reload_modules()

    from muziRigTool.systems.rig.guide import Guide

    g = Guide("face")
    g.import_template()
    print(u"[模板] face_guide.ma 已导入")

    build(g)
    print(u"[构建] 下巴 + 左右眼球（约束={}）".format(BUILD_CONSTRAINTS))

    results = []
    check_positions(results)
    check_jaw_motion(results)
    check_eye_motion(results)

    passed = sum(1 for item in results if item)
    total = len(results)

    print(u"\n" + u"=" * 62)
    print(u"结果：{}/{} 通过".format(passed, total))

    if passed == total:
        print(u"全部通过 ✅")
    else:
        print(u"有失败项 ❌ —— 把带 ❌ 的行发我")

    print(u"要清理：在同一个编辑器里直接调用 cleanup()")
    print(u"=" * 62)

    return passed == total


run()
