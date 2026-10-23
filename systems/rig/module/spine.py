# coding=utf-8
u"""脊柱模块：FK 链 + 样条 IK + skinCluster 驱动曲线。

三套关节：

    fk 关节链      FK 控制器驱动
    ik 关节链      样条 IK 驱动（曲线形状决定弯曲）
    bind 关节链    最终变形关节，由约束混合 fk / ik

曲线的驱动方式（关键）：

    两个驱动关节
        hip_driver      胯部位置
        chest_driver    胸腔位置
            │ skinCluster（权重可调）
            ▼
        曲线 CV
            │ spline IK
            ▼
        ik 关节链

为什么用 skinCluster 而不是直接约束 CV：

    直接约束只能控制首尾两个 CV，中间 CV 是死的，
    拖动胸腔时只有末端弯曲，中间几乎不动。

    蒙皮到关节后，每个 CV 的权重都能单独调：
        CV0  → 胯部 1.0
        CVn  → 胸腔 1.0
        中间  → 按距离插值
    过渡自然，而且可以手动微调让某一段更软。

结构示例：

    grp_md_spine_jnt_001
        ├─ jnt_md_spine_fk_001~005
        ├─ jnt_md_spine_ik_001~005
        ├─ jnt_md_spine_bind_001~005
        ├─ jnt_md_spine_hip_001        驱动曲线的胯部关节
        └─ jnt_md_spine_chest_001      驱动曲线的胸腔关节

    grp_md_spine_ctrl_001
        ├─ zero_md_spine_fk_001 → ctrl_md_spine_fk_001~005
        ├─ zero_md_spine_hip_001 → ctrl_md_spine_hip_001
        └─ zero_md_spine_chest_001 → ctrl_md_spine_chest_001

    grp_md_spine_world_001             世界组，曲线放这里避免双重变换
        └─ crv_md_spine_ik_001
"""

from maya import cmds

from ....core.common.hierarchy_utils import ensure_group, ensure_group_at
from ....core.common.name_utils import Name
from ....core.rigging.ctrl_utils import Ctrl
from .base import RigModule


class Spine(RigModule):
    u"""脊柱：FK 链 + 样条 IK + skinCluster 曲线驱动。"""

    def __init__(
        self,
        side="md",
        guides=None,
        fk_shape="circle",
        ik_shape="cube",
        fk_color=17,
        ik_color=13,
        size=8,
        axis="Y+",
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
        self.hip_ctrl_name = ""
        self.chest_ctrl_name = ""
        self.hip_driver_name = ""
        self.chest_driver_name = ""
        self.fk_constraint_names = []
        self.blend_constraint_names = []
        self.curve_name = ""
        self.ik_handle_name = ""
        self.skin_cluster_name = ""
        self.reverse_name = ""
        self.world_grp = ""
        self.blend_attr = "IkFkBend"

        # 场景对象
        self.fk_joints = []
        self.ik_joints = []
        self.bind_joints = []
        self.fk_ctrls = []
        self.hip_ctrl = None
        self.chest_ctrl = None
        self.hip_driver = None
        self.chest_driver = None
        self.curve = None
        self.skin_cluster = None

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide 并生成名称。

        至少 2 个：根（胯部）、顶（胸腔）。
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

        self.cog_ctrl_name =  Name(
            type="ctrl", side=self.side, part=self.module,
            function="cog", index=1
        ).name

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

        self.hip_ctrl_name = Name(
            type="ctrl", side=self.side, part='hip',
            function="ik", index=1
        ).name

        self.chest_ctrl_name = Name(
            type="ctrl", side=self.side, part='chest',
            function="ik", index=1
        ).name

        self.hip_driver_name = Name(
            type="jnt", side=self.side, part='hip',
            function="driver", index=1
        ).name

        self.chest_driver_name = Name(
            type="jnt", side=self.side, part='chest',
            function="driver", index=1
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

        self.curve_name = Name(
            type="crv", side=self.side, part=self.module,
            function="ik", index=1
        ).name

        self.ik_handle_name = Name(
            type="ikHandle", side=self.side, part=self.module,
            function="ik", index=1
        ).name

        self.ik_twist_loc1_name = Name(
            type="loc", side=self.side, part=self.module,
            function="twist", index=1
        ).name

        self.ik_twist_loc2_name = Name(
            type="loc", side=self.side, part=self.module,
            function="twist", index=2
        ).name


        self.skin_cluster_name = Name(
            type="skin", side=self.side, part=self.module,
            function="ik", index=1
        ).name

        self.reverse_name = Name(
            type="reverse", side=self.side, part=self.module,
            function="vis", index=1
        ).name

        self.world_grp = Name(
            type="grp", side=self.side, part=self.module,
            function="world", index=1
        ).name

    # ------------------------------------------------------------------
    # 关节
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""三套关节 + 两个曲线驱动关节。"""

        guides = self.guide_list

        self.fk_joints = self.create_joints_for_guides(guides, self.fk_jnt_names)
        self.ik_joints = self.create_joints_for_guides(guides, self.ik_jnt_names)
        self.bind_joints = self.create_joints_for_guides(guides, self.bind_jnt_names)

        for jnt in self.fk_joints + self.ik_joints:
            cmds.setAttr(jnt.name + ".visibility", 0)

        # 驱动关节：胯部在根，胸腔在顶
        self.hip_driver = self.create_joints_for_guides(
            self.guide_list[:1], [self.hip_driver_name]
        )[0]
        self.chest_driver = self.create_joints_for_guides(
            self.guide_list[-1:], [self.chest_driver_name]
        )[0]

        for jnt in (self.hip_driver, self.chest_driver):
            cmds.setAttr(jnt.name + ".visibility", 0)

    # ------------------------------------------------------------------
    # 控制器
    # ------------------------------------------------------------------

    def create_ctrls(self):
        u"""FK 控制器链 + 胯部 / 胸腔控制器。"""
        self.cog_ctrl = Ctrl.create_ctrl(self.cog_ctrl_name,shape='hex',
            color=self.ik_color,
            size=self.size * 5,
            axis=self.axis,
            target=self.guide_list[0],
            hierarchy=True)



        self.fk_ctrls = self.create_ctrls_for_guides(
            self.guide_list,
            self.fk_ctrl_names,
            shape=self.fk_shape,
            color=self.fk_color,
            size=self.size,
            axis='X+',
        match_rotation = False
        )

        self.hip_ctrl = Ctrl.create_ctrl(
            self.hip_ctrl_name,
            shape=self.ik_shape,
            color=self.ik_color,
            size=self.size * 1.2,
            axis=self.axis,
            target=self.guide_list[0],
            hierarchy=True,
            match_rotation = False
        )

        self.chest_ctrl = Ctrl.create_ctrl(
            self.chest_ctrl_name,
            shape=self.ik_shape,
            color=self.ik_color,
            size=self.size * 1.2,
            axis=self.axis,
            target=self.guide_list[-1],
            hierarchy=True,
            match_rotation = False
        )

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""关节成链，控制器分组，曲线放世界组。"""

        super(Spine, self).setup_hierarchy()

        for chain in (self.fk_joints, self.ik_joints, self.bind_joints):
            self.chain_joints(chain)

        # 两个驱动关节也挂在 jnt 组下，但不参与关节链
        for jnt in (self.hip_driver, self.chest_driver):
            cmds.parent(jnt.name, self.jnt_master_grp, absolute=True)

        self.chain_zero_groups(self.fk_ctrls)

        for ctrl in (self.hip_ctrl, self.chest_ctrl):
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)
            cmds.parent(zero_grp, self.ctrl_master_grp, absolute=True)

        # 世界组：曲线放这里，避免跟着控制器 double transform
        ensure_group(self.world_grp)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""建驱动关系。

        当前步骤：

            1. FK 约束
            2. 按关节位置建曲线
            3. 曲线蒙皮到 hip / chest 两个驱动关节
            4. 曲线绑定 spline IK
            5. 控制器约束两个驱动关节

        现在移动 ctrl_md_spine_chest_001 就能带动整条脊柱。
        """

        self.create_fk_drivers()
        self.create_curve()
        self.create_curve_skin()
        self.create_spline_ik()
        self.create_curve_drivers()

        # 混合和 Switch 还没接
        # self.add_blend_attr()
        # self.create_reverse()
        # self.create_blend_constraints()
        # self.setup_visibility()

        return self.ik_handle_name

    def create_curve(self):
        u"""按 ik 关节的位置建曲线。

        每个 CV 直接放在对应关节上，曲线首尾必然经过关节，
        中间段落由 cubic 平滑过渡——和教程里手动吸附关节的做法一致。

        用 degree=3：cubic 比 linear 圆滑，弯起来不会出现折角。
        """

        positions = [
            cmds.xform(jnt.name, query=True, worldSpace=True, translation=True)
            for jnt in self.ik_joints
        ]

        self.curve = cmds.curve(
            point=positions,
            degree=3,
            name=self.curve_name
        )

        # 曲线放世界组，避免跟着控制器 double transform
        cmds.parent(self.curve, self.world_grp, absolute=True)
        cmds.setAttr(self.curve + ".visibility", 0)

        return self.curve

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

    def create_curve_skin(self):
        u"""曲线蒙皮到两个驱动关节。

        权重分配：
            CV0      胯部 1.0
            CVn      胸腔 1.0
            中间     按位置线性插值

        中间 CV 的权重决定弯曲过渡的软硬，
        后续可以手动调某一段让它更柔和。
        """

        self.skin_cluster = cmds.skinCluster(
            self.hip_driver.name,
            self.chest_driver.name,
            self.curve,
            toSelectedBones=True,
            name=self.skin_cluster_name
        )[0]

        # CV 数量从曲线读，不假设和关节数一致——
        # spline IK 自动生成的曲线 CV 数由 Maya 决定
        cv_count = len(cmds.ls(self.curve + ".cv[*]", flatten=True))

        for index in range(cv_count):
            ratio = float(index) / float(cv_count - 1)

            cmds.skinPercent(
                self.skin_cluster,
                self.curve + ".cv[{}]".format(index),
                transformValue=[
                    (self.hip_driver.name, 1.0 - ratio),
                    (self.chest_driver.name, ratio),
                ]
            )

        return self.skin_cluster

    def create_spline_ik(self):
        u"""样条 IK：用已有的曲线绑定 ik 关节链。

        createCurve=False：
        不让 ikHandle 自己生成曲线，直接绑定 create_curve 建好的那条。
        这样 CV 位置完全由我们控制（放在关节上），
        也方便后续对它做 skinCluster。
        """

        ik_handle = cmds.ikHandle(
            name=self.ik_handle_name,
            startJoint=self.ik_joints[0].name,
            endEffector=self.ik_joints[-1].name,
            solver="ikSplineSolver",
            curve=self.curve,
            createCurve=False
        )[0]

        # ikHandle 挂到胯部控制器下，跟着整体走
        cmds.parent(ik_handle, self.hip_ctrl.name, absolute=True)


        # 给 ikHandle 增添横向旋转的功能
        cmds.setAttr(ik_handle + ".dTwistControlEnable", 1)

        # 创建两个定位器作为参考向量
        # 用 spaceLocator：createNode('locator') 只建 shape，返回的不是 transform
        ik_twist_loc1 = cmds.spaceLocator(name=self.ik_twist_loc1_name)[0]
        ik_twist_loc2 = cmds.spaceLocator(name=self.ik_twist_loc2_name)[0]

        # 吸附到对应的关节：只吸位置，旋转保持世界对齐
        cmds.matchTransform(
            ik_twist_loc1, self.ik_joints[0].name,
            position=True, rotation=False, scale=False
        )
        cmds.matchTransform(
            ik_twist_loc2, self.ik_joints[-1].name,
            position=True, rotation=False, scale=False
        )

        # 给 locator 加层级：loc -> zero -> offset
        # zero 管位置，offset 留给后面调参考向量的朝向
        for loc in (ik_twist_loc1, ik_twist_loc2):
            zero_name = loc.replace("loc_", "zero_", 1)
            offset_name = loc.replace("loc_", "offset_", 1)

            offset = ensure_group_at(offset_name, loc)
            zero = ensure_group_at(zero_name, loc)

            cmds.parent(zero, offset)
            cmds.parent(loc, zero)

        # 挂到对应控制器的 output 组：
        # 起始 locator 跟胯部，末端 locator 跟胸腔，
        # 这样它们始终贴着曲线两端，不会跑偏。
        for loc, ctrl in (
            (ik_twist_loc1, self.hip_ctrl),
            (ik_twist_loc2, self.chest_ctrl),
        ):
            offset_name = loc.replace("loc_", "offset_", 1)
            cmds.parent(offset_name, ctrl.get_output(), absolute=False)

        return ik_handle

    def create_curve_drivers(self):
        u"""驱动关节直接挂到控制器层级下，靠父子关系跟随。

        不用 parentConstraint：
        约束会让驱动关节的世界变换被完全覆盖，
        关节自己的旋转/位置调不了，排查问题时也不方便。

        父子关系更直接：
            移动控制器 → 驱动关节跟着走
            关节自身仍然可以单独调整
        """

        for ctrl, driver in (
            (self.hip_ctrl, self.hip_driver),
            (self.chest_ctrl, self.chest_driver),
        ):
            output = ctrl.get_output()
            cmds.parent(driver.name, output, absolute=True)

    def create_blend_constraints(self):
        u"""约束混合 fk / ik 的世界变换。

        一个约束挂两个目标：
            target[0] = ik 关节，权重 = IkFkBend
            target[1] = fk 关节，权重 = 1 - IkFkBend
        """

        control = self.hip_ctrl.name

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

    def add_blend_attr(self):
        u"""在胯部控制器上加 IkFkBend 属性。"""

        control = self.hip_ctrl.name

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
        u"""反向节点：FK 权重 = 1 - IkFkBend。"""

        control = self.hip_ctrl.name

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
        u"""IK / FK 控制器互斥显示。"""

        control = self.hip_ctrl.name
        reverse = self.create_reverse()

        for ctrl in (self.hip_ctrl, self.chest_ctrl):
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)

            if not cmds.objExists(zero_grp):
                continue

            if not cmds.isConnected(zero_grp + ".visibility", control + "." + self.blend_attr):
                cmds.connectAttr(
                    control + "." + self.blend_attr,
                    zero_grp + ".visibility",
                    force=True
                )

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
        u"""设置 IkFkBend：0 = 全 FK，1 = 全 IK。"""

        cmds.setAttr(
            self.hip_ctrl.name + "." + self.blend_attr,
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
        u"""删约束、ikHandle、曲线蒙皮、曲线、反向节点，再删总组。"""

        for constraint_name in (
            self.fk_constraint_names + self.blend_constraint_names
        ):
            if cmds.objExists(constraint_name):
                cmds.delete(constraint_name)

        if cmds.objExists(self.ik_handle_name):
            cmds.delete(self.ik_handle_name)

        if self.curve and cmds.objExists(self.curve):
            if self.skin_cluster and cmds.objExists(self.skin_cluster):
                cmds.delete(self.curve, constructionHistory=False)
            else:
                cmds.delete(self.curve)

        if cmds.objExists(self.reverse_name):
            cmds.delete(self.reverse_name)

        if cmds.objExists(self.world_grp):
            cmds.delete(self.world_grp)

        delete_nodes = super(Spine, self).delete_rig()

        self.fk_joints = []
        self.ik_joints = []
        self.bind_joints = []
        self.fk_ctrls = []
        self.hip_ctrl = None
        self.chest_ctrl = None
        self.hip_driver = None
        self.chest_driver = None
        self.curve = None
        self.skin_cluster = None

        return delete_nodes
