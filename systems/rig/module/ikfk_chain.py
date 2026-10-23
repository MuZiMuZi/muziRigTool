# coding=utf-8
u"""链式 IK/FK：N 节关节链 + IK/FK 切换。

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

和 LimbIkFk 的区别：

    LimbIkFk 多一个极向量控制器（四肢需要控制肘/膝朝向）
    这里没有极向量——脊柱、尾巴这类链用不到

Guide 顺序（3 个）：

    [0] 根关节 / [1] 中间关节 / [2] 末端关节

Spine、Tail 等直接继承这个类。
"""

from maya import cmds

from ....core.common.name_utils import Name
from ....core.rigging.ctrl_utils import Ctrl
from .base import RigModule


class LimbConfig(object):
    u"""链式模块的显示配置。

    把这些从 __init__ 参数里拆出来，子类才能只写差异。
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


class IkFkChain(RigModule):
    u"""链式 IK/FK：三链结构，不带极向量。"""

    def __init__(
        self,
        module="chain",
        side="md",
        guides=None,
        config=None,
        jnt_parent=None,
        ctrl_parent=None
    ):
        super(IkFkChain, self).__init__(
            module=module,
            side=side,
            guides=guides,
            jnt_parent=jnt_parent,
            ctrl_parent=ctrl_parent
        )

        self.config = config or self.default_config()

        # 名称
        self.deform_names = []
        self.bp_names = []
        self.ik_jnt_names = []
        self.fk_jnt_names = []
        self.fk_ctrl_names = []
        self.ik_ctrl_name = ""
        self.fk_drive_constraint_names = []
        self.blend_constraint_names = []
        self.ik_handle_name = ""

        # 场景对象
        self.deform_joints = []
        self.bp_joints = []
        self.ik_joints = []
        self.fk_joints = []
        self.fk_ctrls = []
        self.ik_ctrl = None

    @staticmethod
    def default_config():
        u"""默认外观；子类可以覆盖。"""

        return LimbConfig()

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide 并生成名称。

        至少需要 3 个：根 / 中间 / 末端。
        """

        super(IkFkChain, self).get_guides()

        if len(self.guide_list) < 3:
            raise RuntimeError(
                u"IK/FK 链至少需要 3 个 Guide（根 / 中 / 末端），"
                u"收到 {} 个".format(len(self.guide_list))
            )

        self.build_names()

        return self.guide_list

    # ------------------------------------------------------------------
    # 名称
    # ------------------------------------------------------------------

    def get_chain_length(self):
        u"""返回链长（不包含极向量）。

        子类如果有额外 Guide（比如极向量），覆盖这个方法。
        """

        return len(self.guide_list)

    def build_names(self):
        u"""生成所有固定名称。"""

        self.build_joint_names()
        self.build_ctrl_names()
        self.build_constraint_names()

    def build_joint_names(self):
        u"""四套关节名。"""

        count = self.get_chain_length()

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

        count = self.get_chain_length()

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

    def build_constraint_names(self):
        u"""约束和 ikHandle 名。"""

        count = self.get_chain_length()

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

        count = self.get_chain_length()

        self.deform_joints = self.create_joints_for_guides(
            self.guide_list[:count],
            self.deform_names
        )

    def create_driver_joints(self):
        u"""bp / ik / fk 三套驱动关节，全部隐藏。"""

        count = self.get_chain_length()
        guides = self.guide_list[:count]

        self.bp_joints = self.create_joints_for_guides(guides, self.bp_names)
        self.ik_joints = self.create_joints_for_guides(guides, self.ik_jnt_names)
        self.fk_joints = self.create_joints_for_guides(guides, self.fk_jnt_names)

        for jnt in self.bp_joints + self.ik_joints + self.fk_joints:
            cmds.setAttr(jnt.name + ".visibility", 0)

    # ------------------------------------------------------------------
    # 创建控制器
    # ------------------------------------------------------------------

    def create_ctrls(self):
        u"""FK 控制器链 + IK 末端控制器。"""

        self.create_fk_ctrls()
        self.create_ik_ctrls()

    def create_fk_ctrls(self):
        u"""每个关节一个 FK 控制器。"""

        count = self.get_chain_length()

        self.fk_ctrls = self.create_ctrls_for_guides(
            self.guide_list[:count],
            self.fk_ctrl_names,
            shape=self.config.fk_shape,
            color=self.config.fk_color,
            size=self.config.size,
            axis=self.config.axis
        )

    def create_ik_ctrls(self):
        u"""末端 IK 控制器。"""

        end_position = cmds.xform(
            self.guide_list[2],
            query=True,
            worldSpace=True,
            translation=True
        )

        self.ik_ctrl = Ctrl.create_ctrl(
            self.ik_ctrl_name,
            shape=self.config.ik_shape,
            color=self.config.ik_color,
            size=self.config.size,
            axis=self.config.axis,
            hierarchy=True
        )
        cmds.xform(self.ik_ctrl.name, worldSpace=True, translation=end_position)

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""关节成链、FK 控制器成链、IK 控制器平铺。"""

        super(IkFkChain, self).setup_hierarchy()

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
        u"""IK 控制器平铺在 ctrl 组下。"""

        zero_grp = self.ik_ctrl.name.replace("ctrl_", "zero_", 1)
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

        self.create_pole_constraint(ik_handle[0])

    def create_pole_constraint(self, ik_handle):
        u"""极向量约束；没有极向量的链什么都不做。

        LimbIkFk 覆盖这个方法接入极向量。
        """

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
            defaultValue=1.0,
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

        targets = [(self.ik_ctrl.name.replace("ctrl_", "zero_", 1), 1.0)]

        if self.fk_ctrls:
            targets.append(
                (self.fk_ctrls[0].name.replace("ctrl_", "zero_", 1), 0.0)
            )

        self.add_visibility_targets(targets)
        self.finalize_switch(targets)

    def add_visibility_targets(self, targets):
        u"""给可见性列表补额外的控制器；子类可以覆盖。"""

    def finalize_switch(self, targets):
        u"""写入可见性驱动帧并复位 Switch。"""

        control = self.ik_ctrl.name

        for target, ik_visible in targets:
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

        # 复位到 FK：脊柱这类链通常默认 FK
        cmds.setAttr(control + ".Switch", 1.0)

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

        delete_nodes = super(IkFkChain, self).delete_rig()

        self.deform_joints = []
        self.bp_joints = []
        self.ik_joints = []
        self.fk_joints = []
        self.fk_ctrls = []
        self.ik_ctrl = None

        return delete_nodes

    def get_constraint_names(self):
        u"""子类可以补额外的约束名。"""

        return (
            self.fk_drive_constraint_names
            + self.blend_constraint_names
        )

    def delete_constraints(self):
        u"""删所有约束。"""

        for constraint_name in self.get_constraint_names():
            if cmds.objExists(constraint_name):
                cmds.delete(constraint_name)

    def delete_ik_handle(self):
        u"""删 ikHandle。"""

        if cmds.objExists(self.ik_handle_name):
            cmds.delete(self.ik_handle_name)
