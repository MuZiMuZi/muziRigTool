# coding=utf-8
u"""脊柱模块：FK 链 + 样条 IK + 混合。

三套关节：

    fk 关节链      FK 控制器驱动
    ik 关节链      样条 IK 驱动（曲线端点由根/顶控制器控制）
    bind 关节链    最终变形关节，由 blendColors 混合 fk / ik

    fk 关节 ─┐
             ├─ blendColors（IkFkBend 控制）→ bind 关节
    ik 关节 ─┘

为什么用样条 IK 而不是 ikRP：

    脊柱需要沿整条链均匀弯曲。ikRP 只有两个解算点，
    弯出来是硬折角；ikSplineSolver 沿曲线平滑弯曲，像真正的脊椎。

为什么用 blendColors 而不是驱动关键帧：

    blendColors 的 blender 可以停在 0.5，
    动画师能做出「半 IK 半 FK」的过渡姿态；
    驱动关键帧只能在 0 / 1 之间跳。

结构示例：

    grp_md_spine_jnt_001
        ├─ jnt_md_spine_fk_001~005
        ├─ jnt_md_spine_ik_001~005
        └─ jnt_md_spine_bind_001~005

    grp_md_spine_ctrl_001
        ├─ zero_md_spine_fk_001 → ctrl_md_spine_fk_001~005
        ├─ zero_md_spine_ik_001 → ctrl_md_spine_ik_001    根
        └─ zero_md_spine_ik_002 → ctrl_md_spine_ik_002    顶
"""

from maya import cmds

from ....core.common.name_utils import Name
from ....core.rigging.ctrl_utils import Ctrl
from .base import RigModule


class Spine(RigModule):
    u"""脊柱：FK 链 + 样条 IK + blendColors 混合。"""

    def __init__(
        self,
        side="md",
        guides=None,
        fk_shape="circle",
        ik_shape="cube",
        fk_color=17,
        ik_color=13,
        size=1.0,
        axis="X+",
        jnt_parent=None,
        ctrl_parent=None
    ):
        super(Spine, self).__init__(
            module="spine",
            side=side,
            guides=guides,
            jnt_parent=jnt_parent,
            ctrl_parent=ctrl_parent
        )

        self.fk_shape = fk_shape
        self.ik_shape = ik_shape
        self.fk_color = fk_color
        self.ik_color = ik_color
        self.size = size
        self.axis = axis

        # 名称
        self.fk_jnt_names = []
        self.ik_jnt_names = []
        self.bind_jnt_names = []
        self.fk_ctrl_names = []
        self.root_ctrl_name = ""
        self.tip_ctrl_name = ""
        self.fk_constraint_names = []
        self.blend_constraint_names = []
        self.curve_name = ""
        self.ik_handle_name = ""
        self.reverse_name = ""
        self.blend_attr = "IkFkBend"

        # 场景对象
        self.fk_joints = []
        self.ik_joints = []
        self.bind_joints = []
        self.fk_ctrls = []
        self.root_ctrl = None
        self.tip_ctrl = None
        self.curve = None

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide 并生成名称。

        至少 2 个：根、顶。中间节数由 Guide 数量决定。
        """

        super(Spine, self).get_guides()

        if len(self.guide_list) < 2:
            raise RuntimeError(
                u"脊柱至少需要 2 个 Guide（根 / 顶），收到 {} 个".format(
                    len(self.guide_list)
                )
            )

        self.build_names()

        return self.guide_list

    # ------------------------------------------------------------------
    # 名称
    # ------------------------------------------------------------------

    def build_names(self):
        u"""生成所有固定名称。"""

        count = len(self.guide_list)

        def joint_names(function):
            return [
                Name(
                    type="jnt",
                    side=self.side,
                    part=self.module,
                    function=function,
                    index=index
                ).name
                for index in range(1, count + 1)
            ]

        self.fk_jnt_names = joint_names("fk")
        self.ik_jnt_names = joint_names("ik")
        self.bind_jnt_names = joint_names("bind")

        self.fk_ctrl_names = [
            Name(
                type="ctrl",
                side=self.side,
                part=self.module,
                function="fk",
                index=index
            ).name
            for index in range(1, count + 1)
        ]

        self.root_ctrl_name = Name(
            type="ctrl", side=self.side, part=self.module,
            function="ikroot", index=1
        ).name

        self.tip_ctrl_name = Name(
            type="ctrl", side=self.side, part=self.module,
            function="iktop", index=1
        ).name

        self.fk_constraint_names = [
            Name(
                type="cons",
                side=self.side,
                part=self.module,
                function="fk",
                index=index
            ).name
            for index in range(1, count + 1)
        ]

        self.curve_name = Name(
            type="crv", side=self.side, part=self.module,
            function="ik", index=1
        ).name

        self.ik_handle_name = Name(
            type="ikHandle", side=self.side, part=self.module,
            function="spline", index=1
        ).name

        self.reverse_name = Name(
            type="reverse", side=self.side, part=self.module,
            function="vis", index=1
        ).name

        self.blend_constraint_names = [
            Name(
                type="cons",
                side=self.side,
                part=self.module,
                function="blend",
                index=index
            ).name
            for index in range(1, count + 1)
        ]

    # ------------------------------------------------------------------
    # 关节
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""三套关节：fk / ik / bind。"""

        guides = self.guide_list

        self.fk_joints = self.create_joints_for_guides(guides, self.fk_jnt_names)
        self.ik_joints = self.create_joints_for_guides(guides, self.ik_jnt_names)
        self.bind_joints = self.create_joints_for_guides(guides, self.bind_jnt_names)

        for jnt in self.fk_joints + self.ik_joints:
            cmds.setAttr(jnt.name + ".visibility", 0)

    # ------------------------------------------------------------------
    # 控制器
    # ------------------------------------------------------------------

    def create_ctrls(self):
        u"""FK 控制器链 + 根/顶 IK 控制器。"""

        self.fk_ctrls = self.create_ctrls_for_guides(
            self.guide_list,
            self.fk_ctrl_names,
            shape=self.fk_shape,
            color=self.fk_color,
            size=self.size,
            axis=self.axis
        )

        self.root_ctrl = Ctrl.create_ctrl(
            self.root_ctrl_name,
            shape=self.ik_shape,
            color=self.ik_color,
            size=self.size * 1.2,
            axis=self.axis,
            target=self.guide_list[0],
            hierarchy=True
        )

        self.tip_ctrl = Ctrl.create_ctrl(
            self.tip_ctrl_name,
            shape=self.ik_shape,
            color=self.ik_color,
            size=self.size * 1.2,
            axis=self.axis,
            target=self.guide_list[-1],
            hierarchy=True
        )

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""三套关节各自成链，控制器分组摆放。"""

        super(Spine, self).setup_hierarchy()

        for chain in (self.fk_joints, self.ik_joints, self.bind_joints):
            self.chain_joints(chain)

        self.chain_zero_groups(self.fk_ctrls)

        for ctrl in (self.root_ctrl, self.tip_ctrl):
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)
            cmds.parent(zero_grp, self.ctrl_master_grp, absolute=True)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""FK 驱动、样条 IK、blendColors 混合、开关。"""

        self.create_fk_drivers()
        self.create_spline_ik()

        # 顺序：属性 -> 反向节点 -> 混合约束 -> 可见性
        self.add_blend_attr()
        self.create_reverse()
        self.create_blend_constraints()
        self.setup_visibility()

        return self.ik_handle_name

    def create_fk_drivers(self):
        u"""FK 控制器约束 fk 关节。"""

        for index, jnt in enumerate(self.fk_joints):
            constraint_name = self.fk_constraint_names[index]

            if cmds.objExists(constraint_name):
                continue

            cmds.parentConstraint(
                self.fk_ctrl_names[index],
                jnt.name,
                maintainOffset=True,
                name=constraint_name
            )

    def create_spline_ik(self):
        u"""沿 ik 关节建曲线，再建 spline IK。

        顺序很重要：先建 IK 再挂 cluster。
        spline IK 会接管曲线并重建它的历史，
        如果在 IK 之前挂 cluster，会被一起清掉。
        """

        positions = [
            cmds.xform(jnt.name, query=True, worldSpace=True, translation=True)
            for jnt in self.ik_joints
        ]

        # 曲线穿过所有 ik 关节
        self.curve = cmds.curve(
            point=positions,
            degree=3,
            name=self.curve_name
        )

        # 样条 IK：曲线形状决定关节弯曲
        ik_handle = cmds.ikHandle(
            name=self.ik_handle_name,
            startJoint=self.ik_joints[0].name,
            endEffector=self.ik_joints[-1].name,
            solver="ikSplineSolver",
            curve=self.curve,
            createCurve=False
        )

        # ikHandle 挂到根控制器下，跟着根一起走
        cmds.parent(ik_handle[0], self.root_ctrl.name, absolute=True)

        # 曲线放进 ctrl 组，跟着整体走
        cmds.parent(self.curve, self.ctrl_master_grp, absolute=True)

        # IK 建好后再用 cluster 控制曲线首尾：
        # pointConstraint 不能直接约束 CV，CV 不是独立节点。
        first_cluster, first_handle = cmds.cluster(
            self.curve + ".cv[0]",
            name="{}_start".format(self.curve_name)
        )
        cmds.pointConstraint(self.root_ctrl.name, first_handle)

        last_index = len(positions) - 1
        last_cluster, last_handle = cmds.cluster(
            self.curve + ".cv[{}]".format(last_index),
            name="{}_end".format(self.curve_name)
        )
        cmds.pointConstraint(self.tip_ctrl.name, last_handle)

        return ik_handle[0]

    def create_blend_constraints(self):
        u"""用 parentConstraint 混合 fk / ik 的世界变换。

        为什么不用 blendColors：

            fk / ik 关节是父子链，局部 translate 天然是 0，
            混合局部属性等于什么都没做。
            约束作用于世界变换，混合才真正有效。

        一个约束挂两个目标：

            target[0] = ik 关节，权重 = IkFkBend
            target[1] = fk 关节，权重 = 1 - IkFkBend
        """

        control = self.root_ctrl.name

        for index, bind_jnt in enumerate(self.bind_joints):
            constraint_name = self.blend_constraint_names[index]

            if cmds.objExists(constraint_name):
                continue

            constraint = cmds.parentConstraint(
                self.ik_joints[index].name,
                self.fk_joints[index].name,
                bind_jnt.name,
                maintainOffset=True,
                name=constraint_name
            )[0]

            cmds.connectAttr(
                control + "." + self.blend_attr,
                constraint + ".target[0].targetWeight",
                force=True
            )
            cmds.connectAttr(
                self.reverse_name + ".outputX",
                constraint + ".target[1].targetWeight",
                force=True
            )

    # ------------------------------------------------------------------
    # 开关
    # ------------------------------------------------------------------

    def setup_switch(self):
        u"""建 IkFkBend 属性并接上可见性。

        单独调用时也能用：已经建过的属性会跳过。
        """

        self.add_blend_attr()
        self.setup_visibility()

    def add_blend_attr(self):
        u"""在根控制器上加 IkFkBend 属性。"""

        control = self.root_ctrl.name

        if cmds.attributeQuery(self.blend_attr, node=control, exists=True):
            return

        cmds.addAttr(
            control,
            longName=self.blend_attr,
            defaultValue=1.0,
            minValue=0.0,
            maxValue=1.0,
            keyable=True
        )

    def create_reverse(self):
        u"""建反向节点：FK 权重 = 1 - IkFkBend。"""

        control = self.root_ctrl.name

        if not cmds.objExists(self.reverse_name):
            reverse = cmds.createNode("reverse", name=self.reverse_name)
        else:
            reverse = self.reverse_name

        if not cmds.isConnected(control + "." + self.blend_attr, reverse + ".inputX"):
            cmds.connectAttr(
                control + "." + self.blend_attr,
                reverse + ".inputX",
                force=True
            )

        return reverse

    def setup_visibility(self):
        u"""让 IK / FK 控制器互斥显示。"""

        control = self.root_ctrl.name
        reverse = self.create_reverse()

        # IK 控制器：IkFkBend=1 可见
        for ctrl in (self.root_ctrl, self.tip_ctrl):
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)

            if not cmds.objExists(zero_grp):
                continue

            if not cmds.isConnected(zero_grp + ".visibility", control + "." + self.blend_attr):
                cmds.connectAttr(
                    control + "." + self.blend_attr,
                    zero_grp + ".visibility",
                    force=True
                )

        # FK 控制器：IkFkBend=0 时可见（用反向值）
        if self.fk_ctrls:
            fk_zero = self.fk_ctrls[0].name.replace("ctrl_", "zero_", 1)

            if cmds.objExists(fk_zero):
                if not cmds.isConnected(fk_zero + ".visibility", reverse + ".outputX"):
                    cmds.connectAttr(
                        reverse + ".outputX",
                        fk_zero + ".visibility",
                        force=True
                    )

    # ------------------------------------------------------------------
    # 切换
    # ------------------------------------------------------------------

    def set_blend(self, value):
        u"""设置 IkFkBend。

        Args:
            value (float): 0 = 全 FK，1 = 全 IK，中间值是过渡。
        """

        cmds.setAttr(
            self.root_ctrl.name + "." + self.blend_attr,
            max(0.0, min(1.0, float(value)))
        )

        return value

    def switch_to_ik(self):
        u"""切到 IK。"""

        return self.set_blend(1.0)

    def switch_to_fk(self):
        u"""切到 FK。"""

        return self.set_blend(0.0)

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        u"""删约束、ikHandle、曲线、反向节点，再删两组。"""

        for constraint_name in (
            self.fk_constraint_names + self.blend_constraint_names
        ):
            if cmds.objExists(constraint_name):
                cmds.delete(constraint_name)

        if cmds.objExists(self.ik_handle_name):
            cmds.delete(self.ik_handle_name)

        if self.curve and cmds.objExists(self.curve):
            cmds.delete(self.curve)

        if cmds.objExists(self.reverse_name):
            cmds.delete(self.reverse_name)

        delete_nodes = super(Spine, self).delete_rig()

        self.fk_joints = []
        self.ik_joints = []
        self.bind_joints = []
        self.fk_ctrls = []
        self.root_ctrl = None
        self.tip_ctrl = None
        self.curve = None

        return delete_nodes
