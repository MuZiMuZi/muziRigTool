# coding=utf-8
u"""IK/FK 四肢模块（通用基类）。

三链结构：

    bp 关节（定位，隐藏）        只用于创建时定位，不参与驱动
    ik 关节链（隐藏）            ikHandle 驱动
    fk 关节链（隐藏）            FK 控制器约束

    ik 关节 ─┐
             ├─ parentConstraint → deform 关节（蒙皮用）
    fk 关节 ─┘

    Switch 属性（0=IK / 1=FK）
        ├─ 驱动两个约束的 w0 / w1
        └─ 驱动 ik / fk 控制器组的可见性

为什么是三套关节而不是一套：

    ikHandle 会直接改写关节的旋转，如果再叠一个 parentConstraint，
    两套驱动会互相覆盖。拆成「ik 链 + fk 链 + 最终 deform 关节」，
    各自独立计算，只在最后用权重混合，互不干扰。

Guide 顺序（4 个）：

    [0] 根关节 / [1] 中间关节 / [2] 末端关节 / [3] 极向量

极向量位置由第 4 个 Guide 直接决定，模板导入时就该带着它。

Arm / Leg 继承这个类，只覆盖默认配置。
"""

from maya import cmds

from ....core.common.name_utils import Name
from .base import RigModule


class LimbConfig(object):
    u"""四肢的显示配置。

    把这些从 __init__ 参数里拆出来，Arm / Leg 才能只写差异。
    """

    def __init__(
        self,
        fk_shape="circle",
        ik_shape="cube",
        pole_shape="sphere",
        fk_color=17,
        ik_color=13,
        pole_color=6,
        size=1.0,
        axis="X+"
    ):
        self.fk_shape = fk_shape
        self.ik_shape = ik_shape
        self.pole_shape = pole_shape
        self.fk_color = fk_color
        self.ik_color = ik_color
        self.pole_color = pole_color
        self.size = size
        self.axis = axis


class LimbIkFk(RigModule):
    u"""IK/FK 四肢：三链结构。"""

    def __init__(
        self,
        module="limb",
        side="md",
        guides=None,
        config=None,
        jnt_parent=None,
        ctrl_parent=None
    ):
        super(LimbIkFk, self).__init__(
            module=module,
            side=side,
            guides=guides,
            jnt_parent=jnt_parent,
            ctrl_parent=ctrl_parent
        )

        self.config = config or LimbConfig()

        # 名称
        self.deform_names = []
        self.bp_names = []
        self.ik_jnt_names = []
        self.fk_jnt_names = []
        self.fk_ctrl_names = []
        self.ik_ctrl_name = ""
        self.pole_ctrl_name = ""
        self.fk_drive_constraint_names = []
        self.blend_constraint_names = []
        self.pole_constraint_name = ""
        self.ik_handle_name = ""

        # 场景对象
        self.deform_joints = []
        self.bp_joints = []
        self.ik_joints = []
        self.fk_joints = []
        self.fk_ctrls = []
        self.ik_ctrl = None
        self.pole_ctrl = None

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide 并生成名称。

        需要 4 个 Guide：3 个关节位置 + 1 个极向量位置。
        """

        super(LimbIkFk, self).get_guides()

        if len(self.guide_list) != 4:
            raise RuntimeError(
                u"IK/FK 四肢需要 4 个 Guide（根 / 中 / 末端 / 极向量），"
                u"收到 {} 个".format(len(self.guide_list))
            )

        self.build_names()

        return self.guide_list

    # ------------------------------------------------------------------
    # 名称
    # ------------------------------------------------------------------

    def build_names(self):
        u"""生成所有固定名称。"""

        self.build_joint_names()
        self.build_ctrl_names()
        self.build_constraint_names()

    def build_joint_names(self):
        u"""四套关节名。"""

        count = len(self.guide_list) - 1

        def names(function):
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

        self.deform_names = names("bind")
        self.bp_names = names("bp")
        self.ik_jnt_names = names("ik")
        self.fk_jnt_names = names("fk")

    def build_ctrl_names(self):
        u"""控制器名。"""

        count = len(self.guide_list) - 1

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

        self.ik_ctrl_name = Name(
            type="ctrl", side=self.side, part=self.module,
            function="ik", index=1
        ).name

        self.pole_ctrl_name = Name(
            type="ctrl", side=self.side, part=self.module,
            function="pole", index=1
        ).name

    def build_constraint_names(self):
        u"""约束和 ikHandle 名。"""

        count = len(self.guide_list) - 1

        self.fk_drive_constraint_names = [
            Name(
                type="cons",
                side=self.side,
                part=self.module,
                function="fkdrive",
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

        self.pole_constraint_name = Name(
            type="cons", side=self.side, part=self.module,
            function="pole", index=1
        ).name

        self.ik_handle_name = Name(
            type="ikHandle", side=self.side, part=self.module,
            function="main", index=1
        ).name

    # ------------------------------------------------------------------
    # 创建关节
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""创建 deform 关节和两套驱动关节。"""

        self.create_deform_joints()
        self.create_driver_joints()

    def create_deform_joints(self):
        u"""deform 关节：蒙皮用，可见。"""

        self.deform_joints = self.create_joints_for_guides(
            self.guide_list[:3],
            self.deform_names
        )

    def create_driver_joints(self):
        u"""bp / ik / fk 三套驱动关节，全部隐藏。"""

        guides = self.guide_list[:3]

        self.bp_joints = self.create_joints_for_guides(guides, self.bp_names)
        self.ik_joints = self.create_joints_for_guides(guides, self.ik_jnt_names)
        self.fk_joints = self.create_joints_for_guides(guides, self.fk_jnt_names)

        for jnt in self.bp_joints + self.ik_joints + self.fk_joints:
            cmds.setAttr(jnt.name + ".visibility", 0)

    # ------------------------------------------------------------------
    # 创建控制器
    # ------------------------------------------------------------------

    def create_ctrls(self):
        u"""FK 控制器链 + IK 控制器 + 极向量控制器。"""

        self.create_fk_ctrls()
        self.create_ik_ctrls()

    def create_fk_ctrls(self):
        u"""每个关节一个 FK 控制器。"""

        self.fk_ctrls = self.create_ctrls_for_guides(
            self.guide_list[:3],
            self.fk_ctrl_names,
            shape=self.config.fk_shape,
            color=self.config.fk_color,
            size=self.config.size,
            axis=self.config.axis
        )

    def create_ik_ctrls(self):
        u"""末端 IK 控制器 + 极向量控制器。"""

        end_position = cmds.xform(
            self.guide_list[2],
            query=True,
            worldSpace=True,
            translation=True
        )

        self.ik_ctrl = self.create_ctrl(
            self.ik_ctrl_name,
            shape=self.config.ik_shape,
            color=self.config.ik_color,
            size=self.config.size,
            axis=self.config.axis,
            hierarchy=True
        )
        cmds.xform(self.ik_ctrl.name, worldSpace=True, translation=end_position)

        # 极向量直接用第 4 个 Guide 的位置，不做推算
        pole_position = cmds.xform(
            self.guide_list[3],
            query=True,
            worldSpace=True,
            translation=True
        )

        self.pole_ctrl = self.create_ctrl(
            self.pole_ctrl_name,
            shape=self.config.pole_shape,
            color=self.config.pole_color,
            size=self.config.size * 0.5,
            axis=self.config.axis,
            hierarchy=True
        )
        cmds.xform(self.pole_ctrl.name, worldSpace=True, translation=pole_position)

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""关节成链、FK 控制器成链、IK 控制器平铺。"""

        super(LimbIkFk, self).setup_hierarchy()

        for chain in (
            self.deform_joints,
            self.bp_joints,
            self.ik_joints,
            self.fk_joints,
        ):
            self.chain_joints(chain)

        self.chain_zero_groups(self.fk_ctrls)
        self.place_ik_ctrls()

    def place_ik_ctrls(self):
        u"""IK 和极向量控制器平铺在 ctrl 组下。"""

        for ctrl in (self.ik_ctrl, self.pole_ctrl):
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)
            cmds.parent(zero_grp, self.ctrl_master_grp, absolute=True)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""建驱动关系。"""

        self.create_fk_drivers()
        self.create_ik_handle()
        self.create_blend_constraints()
        self.setup_switch()

        return self.ik_handle_name

    def create_fk_drivers(self):
        u"""FK 控制器驱动 fk 关节。

        bp 关节只用于创建时定位，不参与驱动——
        如果 bp 也约束 fk 关节，两套约束会把关节钉在原地。
        """

        for index in range(len(self.deform_joints)):
            constraint_name = self.fk_drive_constraint_names[index]

            if cmds.objExists(constraint_name):
                continue

            cmds.parentConstraint(
                self.fk_ctrl_names[index],
                self.fk_jnt_names[index],
                maintainOffset=True,
                name=constraint_name
            )

    def create_ik_handle(self):
        u"""在 ik 链上建 ikHandle，挂到 IK 控制器下。"""

        ik_handle = cmds.ikHandle(
            name=self.ik_handle_name,
            startJoint=self.ik_jnt_names[0],
            endEffector=self.ik_jnt_names[-1],
            solver="ikRPsolver"
        )

        # ikHandle 命令没有 parent 参数，建完再挂
        cmds.parent(ik_handle[0], self.ik_ctrl.name, absolute=True)

        if not cmds.objExists(self.pole_constraint_name):
            cmds.poleVectorConstraint(
                self.pole_ctrl.name,
                ik_handle[0],
                name=self.pole_constraint_name
            )

    def create_blend_constraints(self):
        u"""ik / fk 两套关节混合驱动 deform 关节。"""

        for index in range(len(self.deform_joints)):
            constraint_name = self.blend_constraint_names[index]

            if cmds.objExists(constraint_name):
                continue

            cmds.parentConstraint(
                self.ik_jnt_names[index],
                self.fk_jnt_names[index],
                self.deform_names[index],
                maintainOffset=True,
                name=constraint_name
            )

    # ------------------------------------------------------------------
    # Switch
    # ------------------------------------------------------------------

    def setup_switch(self):
        u"""建 Switch 属性并接上驱动。"""

        self.add_switch_attr()
        self.drive_blend_weights()
        self.drive_ctrl_visibility()

    def add_switch_attr(self):
        u"""在 IK 控制器上加 Switch 属性。"""

        control = self.ik_ctrl.name

        if cmds.attributeQuery("Switch", node=control, exists=True):
            return

        cmds.addAttr(
            control,
            longName="Switch",
            defaultValue=0.0,
            minValue=0.0,
            maxValue=1.0,
            keyable=True
        )

    def drive_blend_weights(self):
        u"""Switch 驱动两个约束的权重。"""

        control = self.ik_ctrl.name

        for constraint_name in self.blend_constraint_names:
            if not cmds.objExists(constraint_name):
                continue

            for switch_value, ik_weight, fk_weight in (
                (0.0, 1.0, 0.0),
                (1.0, 0.0, 1.0)
            ):
                cmds.setAttr(control + ".Switch", switch_value)

                cmds.setDrivenKeyframe(
                    constraint_name + ".w0",
                    currentDriver=control + ".Switch",
                    driverValue=switch_value,
                    value=ik_weight
                )
                cmds.setDrivenKeyframe(
                    constraint_name + ".w1",
                    currentDriver=control + ".Switch",
                    driverValue=switch_value,
                    value=fk_weight
                )

    def drive_ctrl_visibility(self):
        u"""Switch 驱动控制器显示：IK 组和 FK 组互斥。"""

        control = self.ik_ctrl.name

        ik_zero = self.ik_ctrl.name.replace("ctrl_", "zero_", 1)
        pole_zero = self.pole_ctrl.name.replace("ctrl_", "zero_", 1)
        fk_zero = self.fk_ctrls[0].name.replace("ctrl_", "zero_", 1)

        for target, ik_visible in (
            (ik_zero, 1.0),
            (pole_zero, 1.0),
            (fk_zero, 0.0)
        ):
            if not cmds.objExists(target):
                continue

            for switch_value in (0.0, 1.0):
                cmds.setAttr(control + ".Switch", switch_value)

                visibility = (
                    ik_visible if switch_value == 0.0 else 1.0 - ik_visible
                )

                cmds.setDrivenKeyframe(
                    target + ".visibility",
                    currentDriver=control + ".Switch",
                    driverValue=switch_value,
                    value=visibility
                )

        # 复位到 IK
        cmds.setAttr(control + ".Switch", 0.0)

    # ------------------------------------------------------------------
    # 切换
    # ------------------------------------------------------------------

    def switch_to_ik(self):
        u"""切到 IK，末端控制器对齐当前 deform 关节位置。"""

        cmds.xform(
            self.ik_ctrl.name,
            worldSpace=True,
            translation=cmds.xform(
                self.deform_names[-1],
                query=True,
                worldSpace=True,
                translation=True
            )
        )

        cmds.setAttr(self.ik_ctrl.name + ".Switch", 0.0)

        return 0.0

    def switch_to_fk(self):
        u"""切到 FK，FK 控制器对齐当前 deform 关节旋转。"""

        for index, ctrl in enumerate(self.fk_ctrls):
            cmds.xform(
                ctrl.name,
                worldSpace=True,
                rotation=cmds.xform(
                    self.deform_names[index],
                    query=True,
                    worldSpace=True,
                    rotation=True
                )
            )

        cmds.setAttr(self.ik_ctrl.name + ".Switch", 1.0)

        return 1.0

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        u"""先删约束和 ikHandle，再删两组。"""

        self.delete_constraints()
        self.delete_ik_handle()

        delete_nodes = super(LimbIkFk, self).delete_rig()

        self.deform_joints = []
        self.bp_joints = []
        self.ik_joints = []
        self.fk_joints = []
        self.fk_ctrls = []
        self.ik_ctrl = None
        self.pole_ctrl = None

        return delete_nodes

    def delete_constraints(self):
        u"""删所有约束。"""

        names = (
            self.fk_drive_constraint_names
            + self.blend_constraint_names
            + [self.pole_constraint_name]
        )

        for constraint_name in names:
            if cmds.objExists(constraint_name):
                cmds.delete(constraint_name)

    def delete_ik_handle(self):
        u"""删 ikHandle。"""

        if cmds.objExists(self.ik_handle_name):
            cmds.delete(self.ik_handle_name)
