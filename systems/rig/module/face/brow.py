# coding=utf-8
u"""眉毛模块：关节直驱 + 分段控制器（不走曲线）。

为什么不走曲线：

    眉毛只有 5 个点、一小段弧，曲线驱动要多出
    pointOnCurveInfo / 驱动 locator / aim locator / 曲线蒙皮，
    节点量翻十倍，收益（沿额头滑动）在卡通短片里基本看不出来。

做法：

    5 个关节沿眉毛排开，直接蒙在眉毛上；
    3 个控制器放在内 / 中 / 外，按线性比例约束关节：
        关节 1  ← 内侧 100%
        关节 2  ← 内侧 + 中间 线性
        关节 3  ← 中间 100%
        关节 4  ← 中间 + 外侧 线性
        关节 5  ← 外侧 100%

    抬眉的尖角 / 皱眉的挤压交给 blendshape 修型（face/corrective.py）。

结构：

    grp_lf_brow_jnt_001
        └─ jnt_lf_brow_root_001        主控定位器位置（可选，承载静态权重）
            └─ jnt_lf_brow_bind_001~005

    grp_lf_brow_ctrl_001
        └─ zero_lf_brow_in/mid/out_001 → ctrl_lf_brow_in/mid/out_001
"""

from maya import cmds

from .....core.brow_chain_math import chain_weights
from .....core.name_utils import Name
from .....core.jnt_utils import Jnt
from .base import FaceModule


class Brow(FaceModule):
    u"""一侧眉毛：关节直驱 + 内 / 中 / 外三段控制器。"""

    # 控制器代号 → 名字段
    region_names = ("in", "mid", "out")

    def __init__(self, side="lf", guides=None, size=4.0, color=13,
                 region_count=3, main_guide=None, constraints=True,
                 panel=False, panel_offset=(60.0, 0.0, 0.0),
                 panel_size=20.0, panel_color=20, reference_mesh=None,
                 **kwargs):
        super().__init__(
            module="brow",
            side=side,
            guides=guides,
            **kwargs
        )

        self.size = size
        self.color = color
        self.region_count = region_count
        self.main_guide = main_guide
        self.constraints = constraints

        # 表情面板（大动作控制器），需要 main_guide 当锚点
        self.panel = panel
        self.panel_offset = panel_offset
        self.panel_size = panel_size
        self.panel_color = panel_color
        self.panel_rig = None

        # 参考面：只吃 BS，控制器用 uvPin 钉在上面（B 方案）
        self.reference_mesh = reference_mesh
        self.pin_nodes = []

        self.root_name = ""
        self.joint_names = []
        self.ctrl_names = []
        self.constraint_names = []

        self.root_joint = None
        self.joints = []
        self.ctrls = []

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide：眉毛关节定位器（3 个以上）。"""

        super().get_guides()

        if len(self.guide_list) < 3:
            raise RuntimeError(
                u"眉毛至少需要 3 个 Guide（沿眉毛排开），收到 {} 个".format(
                    len(self.guide_list)
                )
            )

        self.build_names()

        return self.guide_list

    def build_names(self):
        u"""生成固定名称。"""

        count = len(self.guide_list)

        self.root_name = Name(
            type="jnt", side=self.side, part="brow",
            function="root", index=1
        ).name

        self.joint_names = [
            Name(
                type="jnt", side=self.side, part="brow",
                function="bind", index=index
            ).name
            for index in range(1, count + 1)
        ]

        self.ctrl_names = [
            Name(
                type="ctrl", side=self.side, part="brow",
                function=self.region_names[index], index=1
            ).name
            for index in range(self.region_count)
        ]

        self.constraint_names = [
            Name(
                type="cons", side=self.side, part="brow",
                function="main", index=index
            ).name
            for index in range(1, count + 1)
        ]

    # ------------------------------------------------------------------
    # 关节 / 控制器
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""关节严格放在模板定位器上，可选一个根关节。"""

        self.root_joint = None

        if self.main_guide:
            self.root_joint = Jnt.create_jnt(
                self.root_name,
                position=self.guide_position(self.main_guide)
            )

        parent = self.root_joint.name if self.root_joint else None

        self.joints = []

        for name, guide in zip(self.joint_names, self.guide_list):
            joint = Jnt.create_jnt(
                name,
                position=self.guide_position(guide),
                parent=parent
            )
            self.joints.append(joint)

    def create_ctrls(self):
        u"""内 / 中 / 外三个控制器，放在对应关节位置。"""

        positions = (
            self.joints[0],
            self.joints[len(self.joints) // 2],
            self.joints[-1],
        )

        self.ctrls = []

        for index, ctrl_name in enumerate(self.ctrl_names):
            ctrl = self.create_face_ctrl(
                ctrl_name,
                target=None,
                shape="circle",
                color=self.color,
                size=self.size
            )

            # 世界位置写进 offset 组，zero 组留空——
            # 表情面板要驱动 zero 组做叠加位移，位置占了这个通道会被覆盖。
            offset_grp = ctrl_name.replace("ctrl_", "offset_", 1)

            self.copy_world_transform(
                positions[index].name, offset_grp,
                position=True, rotation=False
            )

            self.ctrls.append(ctrl)

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""关节挂 jnt 组，控制器挂 ctrl 组，并重新吸附。"""

        super().setup_hierarchy()

        if self.root_joint:
            cmds.parent(
                self.root_joint.name, self.jnt_master_grp, absolute=True
            )
        else:
            cmds.parent(
                self.joints[0].name, self.jnt_master_grp, absolute=True
            )

        for zero_name in (
            name.replace("ctrl_", "zero_", 1) for name in self.ctrl_names
        ):
            if cmds.objExists(zero_name):
                cmds.parent(zero_name, self.ctrl_master_grp, absolute=True)

        # 挂完层级再吸附一次
        for joint, guide in zip(self.joints, self.guide_list):
            self.snap_to(guide, joint.name, rotation=True)

        anchors = (self.joints[0], self.joints[len(self.joints) // 2],
                   self.joints[-1])

        for ctrl, anchor in zip(self.ctrls, anchors):
            offset_name = ctrl.name.replace("ctrl_", "offset_", 1)

            if cmds.objExists(offset_name):
                self.snap_to(anchor.name, offset_name, rotation=False)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""按线性比例把关节约束到控制器上。"""

        if not self.constraints:
            return None

        count = len(self.joints)

        for index, joint in enumerate(self.joints):
            weights = chain_weights(index, count, self.region_count)
            constraint_name = self.constraint_names[index]

            if cmds.objExists(constraint_name):
                cmds.delete(constraint_name)

            targets = [
                self.ctrls[region].get_output()
                for region, _ in weights
            ]

            constraint = cmds.parentConstraint(
                *targets,
                joint.name,
                maintainOffset=True,
                name=constraint_name
            )[0]

            # 约束权重必须走 w0 / w1：
            # target[i].targetWeight 默认已经连到 w 属性，直接写会被锁。
            if len(weights) == 2:
                cmds.setAttr(constraint + ".w0", weights[0][1])
                cmds.setAttr(constraint + ".w1", weights[1][1])

        self.create_expression_panel()
        self.pin_controls_to_reference()

        return self.constraint_names

    def pin_controls_to_reference(self):
        u"""把三个次级控制器钉到参考面上，跟随 BS 形变。"""

        if not self.reference_mesh:
            return []

        if not cmds.objExists(self.reference_mesh):
            raise RuntimeError(
                u"找不到参考面：{}".format(self.reference_mesh)
            )

        from .surface_pin import pin_control

        results = []

        for index, ctrl in enumerate(self.ctrls):
            zero_name = ctrl.name.replace("ctrl_", "zero_", 1)

            if not cmds.objExists(zero_name):
                continue

            result = pin_control(
                zero_name,
                self.reference_mesh,
                side=self.side,
                part="brow",
                index=index + 1,
            )
            results.append(result)

        self.pin_nodes = results

        return results

    def create_expression_panel(self):
        u"""建表情面板：抬眉 / 压眉 → 三个次级控制器。"""

        if not self.panel or not self.main_guide:
            return None

        from .expression import ExpressionPanel

        targets = [
            (ctrl, ctrl.name.replace("ctrl_", "zero_", 1))
            for ctrl in self.ctrls
        ]

        self.panel_rig = ExpressionPanel(
            side=self.side,
            guides=[self.main_guide],
            targets=targets,
            offset=self.panel_offset,
            size=self.panel_size,
            color=self.panel_color,
        )
        self.panel_rig.build_rig()
        self.panel_rig.connect_rig()

        return self.panel_rig

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        u"""先删约束，再交给基类删组。"""

        if self.panel_rig is not None:
            self.panel_rig.delete_rig()
            self.panel_rig = None

        # 钉住时 zero 组被挂到了 uvPin 组下，先删这些组
        for result in self.pin_nodes:
            for node in (result.get("node"), result.get("group"),
                         result.get("driver")):
                if node and cmds.objExists(node):
                    cmds.delete(node)

        self.pin_nodes = []

        for name in self.constraint_names:
            if cmds.objExists(name):
                cmds.delete(name)

        delete_nodes = super().delete_rig()

        self.root_joint = None
        self.joints = []
        self.ctrls = []

        return delete_nodes
