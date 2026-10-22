# coding=utf-8
u"""IK/FK 四肢模块（arm / leg 共用）。

三链结构：

    bp 关节（定位，隐藏）
        └─ 只用于创建时定位，不参与驱动

    ik 关节链（隐藏）← ikHandle 驱动
    fk 关节链（隐藏）← FK 控制器约束

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

    [0] 根关节        upr
    [1] 中间关节      mid
    [2] 末端关节      end
    [3] 极向量        pole

极向量位置由第 4 个 Guide 直接决定，不从关节位置推算——
骨架模板导入时就该带着它，动画师摆在哪就是哪。

结构示例（arm）：

    grp_lf_arm_jnt_001
        ├─ jnt_lf_arm_bind_001~003     deform，蒙皮用
        ├─ jnt_lf_arm_bp_001~003       bp，隐藏
        ├─ jnt_lf_arm_ik_001~003       ik，隐藏
        └─ jnt_lf_arm_fk_001~003       fk，隐藏
"""

from maya import cmds

from ....core.common.name_utils import Name
from .base import RigModule


class LimbIkFk(RigModule):
    u"""IK/FK 四肢：三链结构。"""

    def __init__(
        self,
        module="arm",
        side="md",
        guides=None,
        fk_shape="circle",
        ik_shape="cube",
        pole_shape="sphere",
        fk_color=17,
        ik_color=13,
        pole_color=6,
        size=1.0,
        axis="X+",
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

        self.fk_shape = fk_shape
        self.ik_shape = ik_shape
        self.pole_shape = pole_shape
        self.fk_color = fk_color
        self.ik_color = ik_color
        self.pole_color = pole_color
        self.size = size
        self.axis = axis

        # 四套关节名
        self.deform_names = []
        self.bp_names = []
        self.ik_jnt_names = []
        self.fk_jnt_names = []

        # 控制器
        self.fk_ctrl_names = []
        self.ik_ctrl_name = ""
        self.pole_ctrl_name = ""

        # 约束
        self.fk_drive_constraint_names = []
        self.blend_constraint_names = []
        self.pole_constraint_name = ""

        self.ik_handle_name = ""

        # Python 侧对象
        self.deform_joints = []
        self.bp_joints = []
        self.ik_joints = []
        self.fk_joints = []
        self.fk_ctrls = []
        self.ik_ctrl = None
        self.pole_ctrl = None

    # ------------------------------------------------------------------
    # 名称
    # ------------------------------------------------------------------

    def build_names(self):
        u"""生成四套关节和控制器、约束的固定名称。

        guide_list 是 4 个（3 关节 + 1 极向量），
        关节和控制器只按前 3 个算，所以 count 单独减一。
        """

        count = len(self.guide_list) - 1

        self.deform_names = [
            Name(type="jnt", side=self.side, part=self.module,
                 function="bind", index=index).name
            for index in range(1, count + 1)
        ]

        self.bp_names = [
            Name(type="jnt", side=self.side, part=self.module,
                 function="bp", index=index).name
            for index in range(1, count + 1)
        ]

        self.ik_jnt_names = [
            Name(type="jnt", side=self.side, part=self.module,
                 function="ik", index=index).name
            for index in range(1, count + 1)
        ]

        self.fk_jnt_names = [
            Name(type="jnt", side=self.side, part=self.module,
                 function="fk", index=index).name
            for index in range(1, count + 1)
        ]

        self.fk_ctrl_names = [
            Name(type="ctrl", side=self.side, part=self.module,
                 function="fk", index=index).name
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

        self.fk_drive_constraint_names = [
            Name(type="cons", side=self.side, part=self.module,
                 function="fkdrive", index=index).name
            for index in range(1, count + 1)
        ]

        self.blend_constraint_names = [
            Name(type="cons", side=self.side, part=self.module,
                 function="blend", index=index).name
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
    # 创建关节
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""创建四套关节：deform / bp / ik / fk。

        只处理前 3 个 Guide，第 4 个是极向量位置。
        """

        self.deform_joints = []
        self.bp_joints = []
        self.ik_joints = []
        self.fk_joints = []

        for index, guide in enumerate(self.guide_list[:3]):
            self.deform_joints.append(
                self.create_joint(self.deform_names[index], guide=guide)
            )
            self.bp_joints.append(
                self.create_joint(self.bp_names[index], guide=guide)
            )
            self.ik_joints.append(
                self.create_joint(self.ik_jnt_names[index], guide=guide)
            )
            self.fk_joints.append(
                self.create_joint(self.fk_jnt_names[index], guide=guide)
            )

        # bp / ik / fk 都是中间层，隐藏起来
        for jnt in self.bp_joints + self.ik_joints + self.fk_joints:
            cmds.setAttr(jnt.name + ".visibility", 0)

    # ------------------------------------------------------------------
    # 创建控制器
    # ------------------------------------------------------------------

    def create_ctrls(self):
        u"""FK 控制器链 + IK 末端控制器 + 极向量控制器。

        FK 和 IK 控制器按前 3 个 Guide 定位，
        极向量控制器直接放在第 4 个 Guide 的位置。
        """

        self.fk_ctrls = []

        for index, guide in enumerate(self.guide_list[:3]):
            ctrl = self.create_ctrl(
                self.fk_ctrl_names[index],
                guide=guide,
                shape=self.fk_shape,
                color=self.fk_color,
                size=self.size,
                axis=self.axis,
                hierarchy=True
            )
            self.fk_ctrls.append(ctrl)

        positions = [
            cmds.xform(guide, query=True, worldSpace=True, translation=True)
            for guide in self.guide_list[:3]
        ]

        # IK 末端控制器：放在 end 关节位置
        self.ik_ctrl = self.create_ctrl(
            self.ik_ctrl_name,
            shape=self.ik_shape,
            color=self.ik_color,
            size=self.size,
            axis=self.axis,
            hierarchy=True
        )
        cmds.xform(self.ik_ctrl.name, worldSpace=True, translation=positions[2])

        # 极向量控制器：直接用 Guide 的位置，不做推算
        pole_position = cmds.xform(
            self.guide_list[3],
            query=True,
            worldSpace=True,
            translation=True
        )

        self.pole_ctrl = self.create_ctrl(
            self.pole_ctrl_name,
            shape=self.pole_shape,
            color=self.pole_color,
            size=self.size * 0.5,
            axis=self.axis,
            hierarchy=True
        )
        cmds.xform(self.pole_ctrl.name, worldSpace=True, translation=pole_position)

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""四套关节各自成链，控制器按 FK/IK 分开放。"""

        super(LimbIkFk, self).setup_hierarchy()

        joint_chains = (
            self.deform_joints,
            self.bp_joints,
            self.ik_joints,
            self.fk_joints,
        )

        for chain in joint_chains:
            parent = self.jnt_master_grp

            for jnt in chain:
                cmds.parent(jnt.name, parent, absolute=True)
                parent = jnt.name

        # FK 控制器链
        parent = self.ctrl_master_grp

        for ctrl in self.fk_ctrls:
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)
            cmds.parent(zero_grp, parent, absolute=True)
            parent = ctrl.get_output()

        # IK 和极向量平铺
        for ctrl in (self.ik_ctrl, self.pole_ctrl):
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)
            cmds.parent(zero_grp, self.ctrl_master_grp, absolute=True)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""FK 控制器驱动 fk 关节，ikHandle 驱动 ik 关节，再混合到 deform。"""

        # 1. FK 控制器驱动 fk 关节链
        #    bp 关节只用于创建时定位，不参与驱动——
        #    如果 bp 也约束 fk 关节，两套约束会把关节钉在原地。
        for index in range(len(self.deform_joints)):
            constraint_name = self.fk_drive_constraint_names[index]

            if not cmds.objExists(constraint_name):
                cmds.parentConstraint(
                    self.fk_ctrl_names[index],
                    self.fk_jnt_names[index],
                    maintainOffset=True,
                    name=constraint_name
                )

        # 2. ikHandle 建在 ik 链上
        ik_handle = cmds.ikHandle(
            name=self.ik_handle_name,
            startJoint=self.ik_jnt_names[0],
            endEffector=self.ik_jnt_names[-1],
            solver="ikRPsolver"
        )

        # ikHandle 命令没有 parent 参数，建完再挂到 IK 控制器下
        cmds.parent(ik_handle[0], self.ik_ctrl.name, absolute=True)

        # 3. 极向量约束
        if not cmds.objExists(self.pole_constraint_name):
            cmds.poleVectorConstraint(
                self.pole_ctrl.name,
                ik_handle[0],
                name=self.pole_constraint_name
            )

        # 4. ik / fk 混合驱动 deform 关节
        for index in range(len(self.deform_joints)):
            constraint_name = self.blend_constraint_names[index]

            if not cmds.objExists(constraint_name):
                cmds.parentConstraint(
                    self.ik_jnt_names[index],
                    self.fk_jnt_names[index],
                    self.deform_names[index],
                    maintainOffset=True,
                    name=constraint_name
                )

        # 5. Switch 属性 + 驱动关键帧
        self._setup_switch()

        return self.ik_handle_name

    def _setup_switch(self):
        u"""在 IK 控制器上建 Switch 属性，驱动权重和可见性。"""

        control = self.ik_ctrl.name

        if not cmds.attributeQuery("Switch", node=control, exists=True):
            cmds.addAttr(
                control,
                longName="Switch",
                defaultValue=0.0,
                minValue=0.0,
                maxValue=1.0,
                keyable=True
            )

        # 权重：Switch=0 -> IK 权重 1；Switch=1 -> FK 权重 1
        for constraint_name in self.blend_constraint_names:
            if not cmds.objExists(constraint_name):
                continue

            for switch_value, ik_weight, fk_weight in ((0.0, 1.0, 0.0), (1.0, 0.0, 1.0)):
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

        # 可见性：Switch=0 显示 IK 控制器，Switch=1 显示 FK 控制器
        ik_zero = self.ik_ctrl.name.replace("ctrl_", "zero_", 1)
        pole_zero = self.pole_ctrl.name.replace("ctrl_", "zero_", 1)

        for target, ik_visible in (
            (ik_zero, 1.0),
            (pole_zero, 1.0),
            (self.fk_ctrls[0].name.replace("ctrl_", "zero_", 1), 0.0),
        ):
            if not cmds.objExists(target):
                continue

            for switch_value in (0.0, 1.0):
                cmds.setAttr(control + ".Switch", switch_value)
                visibility = ik_visible if switch_value == 0.0 else 1.0 - ik_visible

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
        u"""删驱动关键帧、约束、ikHandle，再删两组。"""

        all_constraints = (
            self.fk_drive_constraint_names
            + self.blend_constraint_names
            + [self.pole_constraint_name]
        )

        for constraint_name in all_constraints:
            if cmds.objExists(constraint_name):
                cmds.delete(constraint_name)

        if cmds.objExists(self.ik_handle_name):
            cmds.delete(self.ik_handle_name)

        delete_nodes = super(LimbIkFk, self).delete_rig()

        self.deform_joints = []
        self.bp_joints = []
        self.ik_joints = []
        self.fk_joints = []
        self.fk_ctrls = []
        self.ik_ctrl = None
        self.pole_ctrl = None

        return delete_nodes
