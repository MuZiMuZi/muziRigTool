# coding=utf-8
u"""spline_ctrl_tool 的构建逻辑测试（桩掉 maya.cmds / Ctrl / 曲线采样）。

不启动 Maya，用假 cmds 记录所有调用，验证：
    控制器数量与顺序、比例驱动链路、分组、骨骼与 IK、
    FK 层与 curl、ctrlType 切换、跳过控制点、重建保留骨骼、异常路径。

用法：
    python tests/test_spline_ctrl_tool.py
"""
from __future__ import print_function

import io
import os
import sys
import types

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

PASS = []
FAIL = []

# 假曲线：从下往上，first 点放主控制器。
POINTS = [
    [0.0, 0.0, 0.0],
    [0.0, 1.0, 0.0],
    [0.0, 2.0, 0.0],
    [0.0, 3.0, 0.0],
]


def check(label, condition, detail=u""):
    if condition:
        PASS.append(label)
        print(u"  [PASS] {}{}".format(label, u"  " + detail if detail else u""))
    else:
        FAIL.append(label)
        print(u"  [FAIL] {}{}".format(label, u"  " + detail if detail else u""))


class FakeCmds(object):
    u"""记录所有调用的假 maya.cmds。"""

    def __init__(self):
        self.nodes = {}
        self.created = []
        self.connections = []
        self.parent_constraints = []
        self.parents = []
        self.xforms = {}
        self.deleted = []
        self.undo_calls = []
        self.selected = []
        self.added_attrs = []
        self.rebuild_calls = []
        self.clusters = []
        self.ik_calls = []
        self.set_attrs = []

    def objExists(self, name):
        return name in self.nodes

    def delete(self, name):
        self.deleted.append(name)
        self.nodes.pop(name, None)

    def ls(self, *args, **kwargs):
        if kwargs.get("selection"):
            return self.selected
        return []

    def createNode(self, node_type, name=None):
        created = name or "{}_1".format(node_type)
        self.nodes[created] = node_type
        self.created.append((node_type, created))
        return created

    def parent(self, child, parent_name, **kwargs):
        self.parents.append((child, parent_name, kwargs))
        return child

    def pointConstraint(self, driver, driven, maintainOffset=True, **kwargs):
        self.point_constraints.append((driver, driven, maintainOffset))
        return ["pointConstraint1"]

    def parentConstraint(self, driver, driven, maintainOffset=True, **kwargs):
        self.parent_constraints.append((driver, driven, maintainOffset))
        return ["parentConstraint1"]

    def connectAttr(self, source, target, force=False, **kwargs):
        self.connections.append((source, target))

    def xform(self, node, **kwargs):
        self.xforms[node] = kwargs

    def rename(self, node, new_name):
        node_type = self.nodes.pop(node, "transform")
        self.nodes[new_name] = node_type
        return new_name

    def duplicateCurve(self, curve, **kwargs):
        name = u"dup_curve_{}".format(len(self.created) + 1)
        self.nodes[name] = u"transform"
        self.created.append((u"duplicateCurve", name))
        return [name]

    def cluster(self, cv, name=None):
        deformer = name or u"cluster1"
        handle = deformer + u"Handle"
        self.nodes[deformer] = u"cluster"
        self.nodes[handle] = u"transform"
        self.clusters.append({"cv": cv, "deformer": deformer, "handle": handle})
        return [deformer, handle]

    def ikHandle(self, **kwargs):
        self.ik_calls.append(kwargs)
        name = kwargs.get("name") or u"ikHandle1"
        self.nodes[name] = u"ikHandle"
        return [name, u"effector1"]

    def setAttr(self, plug, *values, **kwargs):
        self.set_attrs.append((plug, values, kwargs))

    def undoInfo(self, **kwargs):
        self.undo_calls.append(kwargs)

    def warning(self, message):
        print(u"    [warning] {}".format(message))

    def attributeQuery(self, attr, node=None, exists=False, **kwargs):
        return False

    def addAttr(self, node, **kwargs):
        self.added_attrs.append((node, kwargs))

    def listRelatives(self, node, shapes=False, **kwargs):
        if not shapes:
            return []
        return [node + u"Shape"] if self.nodes.get(node) else []

    def pointOnCurve(self, curve, parameter=0.0, position=False, **kwargs):
        # 假曲线：沿 y 轴 0 → 3，参数线性映射，便于验证等距。
        return [0.0, 3.0 * parameter, 0.0]


def build_environment():
    u"""把假模块塞进 sys.modules，返回假 cmds。"""

    fake = FakeCmds()

    cmds_module = types.ModuleType("maya.cmds")
    for name in dir(fake):
        if name.startswith("_"):
            continue
        setattr(cmds_module, name, getattr(fake, name))

    maya_module = types.ModuleType("maya")
    maya_module.__path__ = []
    maya_module.cmds = cmds_module

    mixin_module = types.ModuleType("maya.app.general.mayaMixin")
    mixin_module.MayaQWidgetBaseMixin = type("MayaQWidgetBaseMixin", (), {})

    app_module = types.ModuleType("maya.app")
    app_module.__path__ = []
    general_module = types.ModuleType("maya.app.general")
    general_module.__path__ = []
    general_module.mayaMixin = mixin_module

    pyside = types.ModuleType("PySide2")
    pyside.__path__ = []
    widgets = types.ModuleType("PySide2.QtWidgets")
    widgets.QWidget = type("QWidget", (), {})
    pyside.QtWidgets = widgets

    for name, module in (
        ("maya", maya_module),
        ("maya.cmds", cmds_module),
        ("maya.app", app_module),
        ("maya.app.general", general_module),
        ("maya.app.general.mayaMixin", mixin_module),
        ("PySide2", pyside),
        ("PySide2.QtWidgets", widgets),
    ):
        sys.modules[name] = module

    if os.path.dirname(REPO) not in sys.path:
        sys.path.insert(0, os.path.dirname(REPO))

    return fake


def install_stubs(fake, tool):
    u"""替换掉依赖 Maya 真实行为的部分。"""

    created_ctrls = []

    def fake_create_ctrl(name, **kwargs):
        zero_name = name.replace("ctrl_", "zero_", 1)
        driven_name = name.replace("ctrl_", "driven_", 1)
        output_name = name.replace("ctrl_", "output_", 1)
        for node in (zero_name, driven_name, output_name, name):
            fake.nodes[node] = "transform"
        created_ctrls.append(name)
        return object()

    tool.Ctrl.create_ctrl = staticmethod(fake_create_ctrl)

    def fake_ensure_group(name):
        fake.nodes[name] = "transform"
        return name

    def fake_parent_keep_world(child, parent_name):
        fake.parents.append((child, parent_name, {"keep_world": True}))
        return parent_name

    tool.hierarchy_utils.ensure_group = fake_ensure_group
    tool.hierarchy_utils.parent_keep_world = fake_parent_keep_world

    fake.nodes[u"sourceCurve"] = u"transform"

    def fake_get_curve_shape(node):
        if "Mesh" in node:
            raise RuntimeError(u"不是曲线：{}".format(node))
        return node if node.endswith("Shape") else node + "Shape"

    tool.curve_utils.get_curve_shape = fake_get_curve_shape

    def fake_rebuild(curve, spans, degree=3):
        fake.rebuild_calls.append((curve, spans, degree))
        name = u"rebuilt_curve_{}".format(len(fake.rebuild_calls))
        fake.nodes[name] = u"transform"
        return name

    tool.curve_utils.rebuild_curve = fake_rebuild
    tool.curve_utils.get_curve_cv_positions = lambda curve, world_space=True: list(POINTS)

    # sample_curve_points 不桩：假 cmds 已经支持 pointOnCurve，
    # 直接跑真实实现，bounds 截断的逻辑才验证得到。

    chains = []

    def fake_create_chain(points, names=None, parent=None, radius=None):
        chains.append({
            "points": [list(p) for p in points],
            "names": list(names or []),
            "parent": parent,
        })
        for joint_name in (names or []):
            fake.nodes[joint_name] = "joint"
        return object()

    tool.jnt_utils.JntChain.create_chain = staticmethod(fake_create_chain)

    return created_ctrls, chains


def main():
    fake = build_environment()

    sys.path.insert(0, REPO)

    from muziRigTool.tools.controller import spline_ctrl_tool as tool

    created_ctrls, chains = install_stubs(fake, tool)

    # ==================================================================
    print(u"==== 1. 控制器数量 / 命名 / 顺序 ====")

    result = tool.create_spline_ctrl(
        part_name="spline", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_ik=False)

    check(u"rebuild_curve 传了跨度数和次数",
          fake.rebuild_calls == [(u"sourceCurveShape", 2, 3)],
          str(fake.rebuild_calls))
    check(u"5 个控制器（1 主 + 4 小）", len(created_ctrls) == 5,
          str(len(created_ctrls)))
    check(u"主控制器名", created_ctrls[0] == u"ctrl_md_spline_main_001",
          created_ctrls[0])
    check(u"小控制器命名",
          created_ctrls[1:] == [
              u"ctrl_md_spline_sub_001", u"ctrl_md_spline_sub_002",
              u"ctrl_md_spline_sub_003", u"ctrl_md_spline_sub_004"],
          u", ".join(created_ctrls[1:]))

    print(u"")
    print(u"==== 2. 编号越大越靠近主控制器 ====")

    check(u"主控制器在第一个点",
          fake.xforms.get(u"zero_md_spline_main_001", {}).get("translation") == POINTS[0],
          str(fake.xforms.get(u"zero_md_spline_main_001")))
    check(u"sub_001 在曲线末端",
          fake.xforms.get(u"zero_md_spline_sub_001", {}).get("translation") == POINTS[-1],
          str(fake.xforms.get(u"zero_md_spline_sub_001")))
    check(u"sub_004 在主控制器那一端",
          fake.xforms.get(u"zero_md_spline_sub_004", {}).get("translation") == POINTS[0],
          str(fake.xforms.get(u"zero_md_spline_sub_004")))

    print(u"")
    print(u"==== 3. pos 组与约束 ====")

    pos = u"grp_md_spline_pos_001"
    pos_parents = [p for p in fake.parents if p[0] == pos]

    check(u"pos 挂在主控制器的 zero 下",
          len(pos_parents) == 1 and pos_parents[0][1] == u"zero_md_spline_main_001",
          str(pos_parents))
    check(u"parentConstraint 驱动 pos（位移 + 旋转）",
          fake.parent_constraints == [(u"ctrl_md_spline_main_001", pos, False)],
          str(fake.parent_constraints))

    print(u"")
    print(u"==== 4. 驱动链路 ====")

    clamps = [n for t, n in fake.created if t == u"clamp"]
    mul_nodes = [n for t, n in fake.created if t == u"multiplyDivide"]
    translate_muls = [n for n in mul_nodes if u"_ratio_" in n]
    rotate_muls = [n for n in mul_nodes if u"_rot_" in n]

    check(u"建了 1 个 clamp", len(clamps) == 1, str(clamps))
    check(u"4 个位移节点 / 1 个旋转节点",
          len(translate_muls) == 4 and len(rotate_muls) == 1,
          u"ratio={} rot={}".format(len(translate_muls), len(rotate_muls)))

    clamp = clamps[0] if clamps else u""

    check(u"pos 位移接进 clamp 的 RGB",
          all((u"{}.translate{}".format(pos, axis),
               u"{}.input{}".format(clamp, channel)) in fake.connections
              for axis, channel in ((u"X", u"R"), (u"Y", u"G"), (u"Z", u"B"))),
          str([c for c in fake.connections if u".inputR" in c[1]]))

    check(u"clamp 上限由 maximumLength 驱动",
          all((u"ctrl_md_spline_main_001.maximumLength",
               u"{}.max{}".format(clamp, channel)) in fake.connections
              for channel in (u"R", u"G", u"B")),
          str([c for c in fake.connections if u".max" in c[1]]))

    ok_translate = True

    for index in range(1, 5):
        mul = u"mul_md_spline_ratio_{:03d}".format(index)
        driven = u"driven_md_spline_sub_{:03d}".format(index)
        ratio = u"ctrl_md_spline_main_001.ratio_{:03d}".format(index)

        for axis, channel in ((u"X", u"R"), (u"Y", u"G"), (u"Z", u"B")):
            if (u"{}.output{}".format(clamp, channel),
                    u"{}.input1{}".format(mul, axis)) not in fake.connections:
                ok_translate = False
            if (ratio, u"{}.input2{}".format(mul, axis)) not in fake.connections:
                ok_translate = False

        if (u"{}.output".format(mul),
                u"{}.translate".format(driven)) not in fake.connections:
            ok_translate = False

    check(u"位移链路完整：clamp → ×ratio → driven", ok_translate)

    rotate_links = [c for c in fake.connections
                    if u"driven" in c[1] and c[1].endswith(u".rotate")]

    check(u"旋转只接给最后一个控制器（1 条）",
          rotate_links == [(u"mul_md_spline_rot_004.output",
                            u"driven_md_spline_sub_004.rotate")],
          str(rotate_links))

    print(u"")
    print(u"==== 4b. 比例属性默认值 ====")

    ratio_attrs = [a for a in fake.added_attrs
                   if a[1].get(u"longName", u"").startswith(u"ratio_")]
    defaults = [a[1].get(u"defaultValue") for a in ratio_attrs]

    check(u"4 个控制器 → 0.25 / 0.5 / 0.75 / 1.0",
          defaults == [0.25, 0.5, 0.75, 1.0], str(defaults))
    check(u"最近主控制器的给满 1.0", defaults[-1] == 1.0, str(defaults[-1]))

    print(u"")
    print(u"==== 4c. 属性分隔条 ====")

    all_attrs = [a[1].get(u"longName") for a in fake.added_attrs]
    separators = [n for n in all_attrs if n.startswith(u"sep_")]

    check(u"分隔条 sep_limit / sep_ratio / sep_show",
          separators == [u"sep_limit", u"sep_ratio", u"sep_show"], str(separators))
    check(u"分隔条显示名是虚线",
          all(a[1].get(u"niceName", u"").startswith(u"--------")
              for a in fake.added_attrs
              if a[1].get(u"longName", u"").startswith(u"sep_")),
          str([a[1].get(u"niceName") for a in fake.added_attrs
               if a[1].get(u"longName", u"").startswith(u"sep_")]))
    check(u"分隔条排在分组之前",
          all_attrs.index(u"sep_limit") < all_attrs.index(u"maximumLength")
          and all_attrs.index(u"sep_ratio") < all_attrs.index(u"ratio_001"),
          str(all_attrs[:4]))

    print(u"")
    print(u"==== 5. 分组 jnt / crv / ctrl ====")

    group_parents = {p[0]: p[1] for p in fake.parents
                     if p[0].startswith(u"grp_md_spline_")}

    check(u"三个分组都挂在根组下",
          all(group_parents.get(g) == u"grp_md_spline_rig_001"
              for g in (u"grp_md_spline_jnt_001",
                        u"grp_md_spline_crv_001",
                        u"grp_md_spline_ctrl_001")),
          str(group_parents))

    check(u"曲线挂在曲线组下",
          result["curve"] == u"crv_md_spline_spline_001"
          and any(p[0] == u"crv_md_spline_spline_001"
                  and p[1] == u"grp_md_spline_crv_001" for p in fake.parents),
          str(result["curve"]))

    check(u"小控制器挂在控制器组下",
          all(p[1] == u"grp_md_spline_ctrl_001" for p in fake.parents
              if p[0].startswith("zero_md_spline_sub_")),
          str([p for p in fake.parents if p[0].startswith("zero_md_spline_sub_")]))

    print(u"")
    print(u"==== 6. 可见性开关 ====")

    switch_links = [c for c in fake.connections if c[1].endswith(u".visibility")]

    check(u"show_jnt / show_crv 接上",
          (u"ctrl_md_spline_main_001.show_jnt",
           u"grp_md_spline_jnt_001.visibility") in switch_links
          and (u"ctrl_md_spline_main_001.show_crv",
               u"grp_md_spline_crv_001.visibility") in switch_links,
          str(switch_links))

    print(u"")
    print(u"==== 7. 不勾 IK 时不建骨骼 ====")

    check(u"没有骨骼链", chains == [], str(len(chains)))
    check(u"result joints 为空", result["joints"] == [], str(result["joints"]))
    check(u"result ik_handle 为 None", result["ik_handle"] is None,
          str(result["ik_handle"]))

    print(u"")
    print(u"==== 8. 变形骨骼直接跟随控制器 ====")

    chains[:] = []
    fake.clusters = []
    fake.ik_calls = []
    fake.set_attrs = []
    fake.point_constraints = []

    result_ik = tool.create_spline_ctrl(
        part_name="deform", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_ik=True)

    check(u"骨骼数量 = 控制器数量",
          len(chains[0]["names"]) == 4, str(chains[0]["names"]))
    check(u"骨骼命名",
          chains[0]["names"] == [
              u"jnt_md_deform_bind_001", u"jnt_md_deform_bind_002",
              u"jnt_md_deform_bind_003", u"jnt_md_deform_bind_004"],
          u", ".join(chains[0]["names"]))
    check(u"骨骼建在控制器位置",
          [round(p[1], 2) for p in chains[0]["points"]] == [0.0, 1.0, 2.0, 3.0],
          str([p[1] for p in chains[0]["points"]]))

    check(u"不再打簇（不走曲线）", fake.clusters == [], str(len(fake.clusters)))
    check(u"不再建 spline IK", fake.ik_calls == [], str(len(fake.ik_calls)))

    parent_map = {item[0]: item[1] for item in fake.parents
                  if item[0].startswith(u"jnt_md_deform_bind_")}

    check(u"每根关节挂在对应控制器的 output 下",
          parent_map.get(u"jnt_md_deform_bind_001") == u"output_md_deform_sub_004"
          and parent_map.get(u"jnt_md_deform_bind_002") == u"output_md_deform_sub_003"
          and parent_map.get(u"jnt_md_deform_bind_004") == u"output_md_deform_sub_001",
          str(parent_map))
    check(u"不用 pointConstraint（改父级就够了）",
          fake.point_constraints == [], str(len(fake.point_constraints)))

    print(u"")
    print(u"==== 10. 跳过第 2 / 倒数第 2 个控制点 ====")

    fake.xforms = {}
    fake.clusters = []

    result_skip = tool.create_spline_ctrl(
        part_name="ends", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=True, with_ik=False)

    check(u"4 个点只剩 2 个控制器",
          len(result_skip["controls"]) == 2, str(result_skip["controls"]))
    check(u"主控制器仍在第一个点",
          fake.xforms.get(u"zero_md_ends_main_001", {}).get("translation") == POINTS[0],
          str(fake.xforms.get(u"zero_md_ends_main_001")))
    check(u"最远的控制器在最后一个点",
          fake.xforms.get(u"zero_md_ends_sub_001", {}).get("translation") == POINTS[3],
          str(fake.xforms.get(u"zero_md_ends_sub_001")))

    chains[:] = []
    fake.point_constraints = []

    tool.create_spline_ctrl(
        part_name="endsik", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=True, with_ik=True)

    check(u"跳过后关节也只有 2 根",
          len(chains[0]["names"]) == 2, str(chains[0]["names"]))
    skip_parents = {item[0]: item[1] for item in fake.parents
                    if item[0].startswith(u"jnt_md_endsik_bind_")}

    check(u"2 根关节分别挂在两个控制器下",
          len(skip_parents) == 2
          and u"output_md_endsik_sub_002" in skip_parents.values()
          and u"output_md_endsik_sub_001" in skip_parents.values(),
          str(skip_parents))

    print(u"")
    print(u"==== 11. FK 层 + ctrlType + curl ====")

    fake.created = []
    fake.parents = []
    fake.added_attrs = []
    fake.connections = []
    fake.set_attrs = []

    result_fk = tool.create_spline_ctrl(
        part_name="curl", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_fk=True, with_ik=False)

    fk_names = [u"ctrl_md_curl_fk_{:03d}".format(i) for i in range(1, 5)]

    check(u"建了 4 个 FK 控件",
          all(name in fake.nodes for name in fk_names),
          str([n for n in fake.nodes if u"_fk_" in n and n.startswith(u"ctrl_")]))

    fk_parents = {p[0]: p[1] for p in fake.parents if u"zero_md_curl_fk_" in p[0]}

    check(u"FK 挂在主控制器 output 下（跟着走）",
          fk_parents.get(u"zero_md_curl_fk_004") == u"output_md_curl_main_001",
          str(fk_parents.get(u"zero_md_curl_fk_004")))
    check(u"FK 串成父子链",
          fk_parents.get(u"zero_md_curl_fk_003") == u"output_md_curl_fk_004",
          str(fk_parents.get(u"zero_md_curl_fk_003")))

    sub_parents = {p[0]: p[1] for p in fake.parents if u"zero_md_curl_sub_" in p[0]}

    check(u"比例控制器挂在 FK 下面",
          sub_parents.get(u"zero_md_curl_sub_004") == u"output_md_curl_fk_004",
          str(sub_parents.get(u"zero_md_curl_sub_004")))

    check(u"ctrlType 是 enum（IK:FK:Both）",
          any(a[1].get(u"longName") == u"ctrlType"
              and a[1].get(u"enumName") == u"IK:FK:Both"
              for a in fake.added_attrs),
          str([a[1] for a in fake.added_attrs
               if a[1].get(u"longName") == u"ctrlType"]))

    shape_links = [c for c in fake.connections if c[1].endswith(u"Shape.visibility")]

    check(u"FK 形状接 clamp，IK 形状接 reverse",
          len(shape_links) == 8
          and len([c for c in shape_links
                   if c[0].startswith(u"clm_md_curl_type_")]) == 4
          and len([c for c in shape_links
                   if c[0].startswith(u"rev_md_curl_type_")]) == 4,
          str(shape_links))

    curl_attr = [a[1] for a in fake.added_attrs if a[1].get(u"longName") == u"curl"]

    check(u"curl 属性 0~1",
          len(curl_attr) == 1
          and curl_attr[0].get(u"minValue") == 0.0
          and curl_attr[0].get(u"maxValue") == 1.0,
          str(curl_attr))

    curl_links = [c for c in fake.connections
                  if c[1].endswith(u".rotateX") and u"_fk_" in c[1]]

    check(u"4 节 FK 都被 curl 驱动",
          len(curl_links) == 4
          and all(c[0].startswith(u"mul_md_curl_curl_") for c in curl_links),
          str(curl_links))

    slopes = []

    for position in range(1, 5):
        plug = u"mul_md_curl_curl_{:03d}.input2X".format(position)
        values = [v[0] for p, v, _ in fake.set_attrs if p == plug]
        slopes.append(values[0] if values else None)

    check(u"角度均匀递减（斜率等量增加）",
          None not in slopes
          and all(abs((slopes[i + 1] - slopes[i]) -
                      (slopes[1] - slopes[0])) < 1e-6
                  for i in range(1, len(slopes) - 1)),
          str([round(s, 2) for s in slopes if s is not None]))

    onsets = []

    for position in range(1, 5):
        plug = u"pma_md_curl_curl_{:03d}.input1D[1]".format(position)
        values = [v[0] for p, v, _ in fake.set_attrs if p == plug]
        onsets.append(values[0] if values else None)

    check(u"启动时间逐节后移（尖端最早）",
          None not in onsets and all(onsets[i] > onsets[i + 1] for i in range(3)),
          str(onsets))

    try:
        tool.create_spline_ctrl(
            part_name="bad", crv_name="sourceCurve",
            rebuild=True, spans=2, degree=3,
            drive_mode=tool.DRIVE_MODE_CHAIN, with_fk=True)
        check(u"父子链模式不许叠 FK", False)
    except ValueError as error:
        check(u"父子链模式不许叠 FK", u"父子链" in str(error), str(error))

    print(u"")
    print(u"==== 12. 父子链驱动模式 ====")

    fake.parents = []
    fake.parent_constraints = []
    fake.connections = []
    fake.added_attrs = []

    tool.create_spline_ctrl(
        part_name="hair", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        drive_mode=tool.DRIVE_MODE_CHAIN,
        skip_points=False, with_ik=False)

    chain_parents = {p[0]: p[1] for p in fake.parents
                     if p[0].startswith(u"zero_md_hair_sub_")}

    check(u"sub_004 挂在主控制器 output 下",
          chain_parents.get(u"zero_md_hair_sub_004") == u"output_md_hair_main_001",
          str(chain_parents.get(u"zero_md_hair_sub_004")))
    check(u"sub_001 挂在 sub_002 的 output 下",
          chain_parents.get(u"zero_md_hair_sub_001") == u"output_md_hair_sub_002",
          str(chain_parents.get(u"zero_md_hair_sub_001")))
    check(u"父子链模式不生成比例属性",
          not [a for a in fake.added_attrs
               if a[1].get(u"longName", u"").startswith(u"ratio_")],
          str([a[1].get(u"longName") for a in fake.added_attrs]))
    check(u"父子链模式没有驱动连接",
          not [c for c in fake.connections if not c[1].endswith(u".visibility")],
          str([c for c in fake.connections
               if not c[1].endswith(u".visibility")]))

    print(u"")
    print(u"==== 13. 重建保留骨骼 ====")

    tool.create_spline_ctrl(
        part_name="keep", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_ik=True)

    fake.deleted = []
    fake.parents = []
    chains[:] = []
    fake.xforms = {}

    tool.create_spline_ctrl(
        part_name="keep", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_ik=True)

    check(u"没有删整个根组",
          u"grp_md_keep_rig_001" not in fake.deleted, str(fake.deleted))
    check(u"没有删骨骼组",
          u"grp_md_keep_jnt_001" not in fake.deleted, str(fake.deleted))
    check(u"没有重建骨骼链", chains == [], str(chains))
    check(u"重建时关节重新挂回控制器",
          any(item[0].startswith(u"jnt_md_keep_bind_") for item in fake.parents),
          str([item for item in fake.parents
               if item[0].startswith(u"jnt_md_keep_bind_")][:4]))

    # 控制器数量变了（4 → 6），骨骼名对不上，只能整套重建
    tool.curve_utils.get_curve_cv_positions = (
        lambda curve, world_space=True: list(POINTS) + [[0.0, 4.0, 0.0], [0.0, 5.0, 0.0]])

    fake.deleted = []
    tool.create_spline_ctrl(
        part_name="keep", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_ik=True)

    check(u"控制器数量变了就整套重建",
          u"grp_md_keep_rig_001" in fake.deleted, str(fake.deleted))

    tool.curve_utils.get_curve_cv_positions = (
        lambda curve, world_space=True: list(POINTS))

    print(u"")
    print(u"==== 14. 不重建模式 ====")

    fake.rebuild_calls = []
    result_dup = tool.create_spline_ctrl(
        part_name="strap", crv_name="sourceCurve",
        rebuild=False, spans=2, degree=3,
        skip_points=False, with_ik=False)

    check(u"不调用 rebuild_curve", fake.rebuild_calls == [], str(fake.rebuild_calls))
    check(u"复制出一条自己的曲线",
          result_dup["curve"] == u"crv_md_strap_spline_001", str(result_dup["curve"]))

    print(u"")
    print(u"==== 15. 重复构建 / undo ====")

    fake.undo_calls = []
    tool.create_spline_ctrl(
        part_name="twice", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_ik=False)
    fake.deleted = []
    tool.create_spline_ctrl(
        part_name="twice", crv_name="sourceCurve",
        rebuild=True, spans=2, degree=3,
        skip_points=False, with_ik=False)

    check(u"第二次删旧根组",
          u"grp_md_twice_rig_001" in fake.deleted, str(fake.deleted))

    opens = [c for c in fake.undo_calls if c.get("openChunk")]
    closes = [c for c in fake.undo_calls if c.get("closeChunk")]
    check(u"undo chunk 成对", len(opens) == len(closes) and opens,
          u"open={} close={}".format(len(opens), len(closes)))

    print(u"")
    print(u"==== 16. 异常路径 ====")

    tool.curve_utils.get_curve_cv_positions = lambda curve, world_space=True: [[0.0, 0.0, 0.0]]

    try:
        tool.create_spline_ctrl(
            part_name="bad", crv_name="sourceCurve",
            rebuild=True, spans=2, degree=3,
            skip_points=False, with_ik=False)
        check(u"控制点不足时报错", False)
    except RuntimeError as error:
        check(u"控制点不足时报错", u"控制点不足" in str(error), str(error))

    tool.curve_utils.get_curve_cv_positions = lambda curve, world_space=True: list(POINTS)

    fake.selected = []
    try:
        tool.create_spline_ctrl(part_name="none", crv_name=None,
                                rebuild=True, spans=2, degree=3,
                                skip_points=False, with_ik=False)
        check(u"没曲线时明确报错", False)
    except RuntimeError as error:
        check(u"没曲线时明确报错", u"请先选择" in str(error), str(error))

    try:
        tool.create_spline_ctrl(
            part_name="badmode", crv_name="sourceCurve",
            rebuild=True, spans=2, degree=3,
            drive_mode="nope", skip_points=False, with_ik=False)
        check(u"非法驱动方式报错", False)
    except ValueError as error:
        check(u"非法驱动方式报错", u"驱动方式" in str(error), str(error))

    print(u"")
    print(u"==== 17. 拾取曲线 ====")

    class FakeEdit(object):
        def __init__(self):
            self.text = u""

        def setText(self, value):
            self.text = value

    class FakeWindow(object):
        def __init__(self):
            self.curve_edit = FakeEdit()

    FakeWindow.pick_curve = tool.SplineCtrlWindow.pick_curve

    window = FakeWindow()

    fake.selected = [u"|rig|grp|myCurve"]
    window.pick_curve()
    check(u"拾取到曲线短名", window.curve_edit.text == u"myCurve",
          window.curve_edit.text)

    window.curve_edit.text = u""
    fake.selected = [u"|rig|someMesh"]
    window.pick_curve()
    check(u"非曲线不填", window.curve_edit.text == u"", window.curve_edit.text)

    window.curve_edit.text = u""
    fake.selected = [u"|rig|someMesh", u"|rig|grp|myCurve"]
    window.pick_curve()
    check(u"跳过非曲线，取第一条曲线", window.curve_edit.text == u"myCurve",
          window.curve_edit.text)

    print(u"")
    print(u"==== 汇总 ====")
    print(u"  通过 {} 项，失败 {} 项".format(len(PASS), len(FAIL)))
    for label in FAIL:
        print(u"  失败: " + label)

    return 0 if not FAIL else 1


if __name__ == "__main__":
    sys.exit(main())
