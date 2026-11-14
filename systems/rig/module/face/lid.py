# coding=utf-8
u"""眼皮模块：上 3 + 下 3 + 内外眼角，关节绕眼球中心转。

结构（16-11 的做法）：

    root（眼球中心）
      ├─ upper 3 个关节（上眼皮）
      ├─ lower 3 个关节（下眼皮）
      └─ corner inner / outer（眼角）

每个关节一个控制器；`blink` 属性（0-1）用 driven key 驱动
上眼皮向下、下眼皮向上，完成闭眼。

为什么 root 放在眼球中心：

    眼皮关节全部挂在 root 下，root 一旋转，整圈眼皮就绕眼球转，
    形状天然贴着球面，不会出现「皮掉下来」的穿帮。
"""

from maya import cmds

from .....core.name_utils import Name
from .....core.jnt_utils import Jnt
from .base import FaceModule


class Lid(FaceModule):
    u"""单只眼睛的眼皮：上/下三条关节 + 眼角。"""

    def __init__(self, side="lf", upper=None, lower=None, inner=None,
                 outer=None, eye=None, size=3.0, color=14,
                 blink_angle=40.0, **kwargs):
        super().__init__(module="lid", side=side, guides=None, **kwargs)

        self.upper_guides = upper or []
        self.lower_guides = lower or []
        self.inner_guide = inner
        self.outer_guide = outer
        self.eye_guide = eye

        self.size = size
        self.color = color
        self.blink_angle = blink_angle

        self.root_name = ""
        self.upper_names = []
        self.lower_names = []
        self.corner_names = []
        self.ctrl_names = []

        self.root_joints = []
        self.upper_joints = []
        self.lower_joints = []
        self.corner_joints = []
        self.ctrls = []
        self.blink_attr = "blink"

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""眼皮没有统一的 guide 列表，这里只校验输入。"""

        if not self.upper_guides or not self.lower_guides:
            raise RuntimeError(u"眼皮需要上/下眼皮定位器")

        if not self.eye_guide:
            raise RuntimeError(u"眼皮需要一个眼球中心定位器")

        self.build_names()

        return []

    def build_names(self):
        u"""生成关节 / 控制器名字。"""

        self.root_names = [
            Name(
                type="jnt", side=self.side, part="lid",
                function="root", index=index
            ).name
            for index in (1, 2)
        ]

        def joint_names(part, count):
            return [
                Name(
                    type="jnt", side=self.side, part=part,
                    function="bind", index=index
                ).name
                for index in range(1, count + 1)
            ]

        self.upper_names = joint_names("lid_up", len(self.upper_guides))
        self.lower_names = joint_names("lid_low", len(self.lower_guides))
        self.corner_names = joint_names(
            "lid_corner",
            2 if self.inner_guide and self.outer_guide else 0
        )

        self.ctrl_names = (
            [
                Name(type="ctrl", side=self.side, part="lid_up",
                     function="main", index=index).name
                for index in range(1, len(self.upper_guides) + 1)
            ]
            + [
                Name(type="ctrl", side=self.side, part="lid_low",
                     function="main", index=index).name
                for index in range(1, len(self.lower_guides) + 1)
            ]
            + [
                Name(type="ctrl", side=self.side, part="lid_corner",
                     function="main", index=index).name
                for index in range(1, len(self.corner_names) + 1)
            ]
        )

    # ------------------------------------------------------------------
    # 关节 / 控制器
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""上 / 下各一个 root（都在眼球中心），关节挂在各自 root 下。"""

        center = self.guide_position(self.eye_guide)

        self.root_joints = [
            Jnt.create_jnt(name, position=center)
            for name in self.root_names
        ]

        created = []
        created.extend(self._create_chain(
            self.upper_guides, self.upper_names, self.root_joints[0].name
        ))
        created.extend(self._create_chain(
            self.lower_guides, self.lower_names, self.root_joints[1].name
        ))

        corners = []

        for guide in (self.inner_guide, self.outer_guide):
            if guide:
                corners.append(guide)

        for name, guide in zip(self.corner_names, corners):
            created.append(Jnt.create_jnt(
                name,
                position=self.guide_position(guide),
                parent=self.root_joints[0].name
            ))

        self.upper_joints = created[:len(self.upper_names)]
        self.lower_joints = created[
            len(self.upper_names):len(self.upper_names) + len(self.lower_names)
        ]
        self.corner_joints = created[
            len(self.upper_names) + len(self.lower_names):
        ]

    def _create_chain(self, guides, names, root):
        u"""一条眼皮链：第一个挂 root，后面依次串起来。"""

        joints = []
        parent = root

        for name, guide in zip(names, guides):
            joint = Jnt.create_jnt(
                name,
                position=self.guide_position(guide),
                parent=parent
            )
            joints.append(joint)
            parent = joint.name

        return joints

    def create_ctrls(self):
        u"""每个关节一个控制器。"""

        positions = (
            self.upper_joints + self.lower_joints + self.corner_joints
        )

        self.ctrls = []

        for ctrl_name, joint in zip(self.ctrl_names, positions):
            ctrl = self.create_face_ctrl(
                ctrl_name,
                target=None,
                shape="circle",
                color=self.color,
                size=self.size
            )

            offset_grp = ctrl_name.replace("ctrl_", "offset_", 1)
            self.copy_world_transform(
                joint.name, offset_grp,
                position=True, rotation=False
            )

            self.ctrls.append(ctrl)

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""root 挂 jnt 组，控制器挂 ctrl 组，并重新吸附。"""

        super().setup_hierarchy()

        for root in self.root_joints:
            cmds.parent(root.name, self.jnt_master_grp, absolute=True)

        # 控制器挂在对应的 root 下：
        # blink 转 root 时，控制器和关节一起转，约束保持相对关系，
        # 眼皮才会真正绕眼球中心闭合。
        upper_count = len(self.upper_joints)
        lower_count = len(self.lower_joints)

        for index, ctrl_name in enumerate(self.ctrl_names):
            zero_name = ctrl_name.replace("ctrl_", "zero_", 1)

            if not cmds.objExists(zero_name):
                continue

            if index < upper_count:
                parent = self.root_joints[0].name
            elif index < upper_count + lower_count:
                parent = self.root_joints[1].name
            else:
                parent = self.root_joints[0].name

            cmds.parent(zero_name, parent, absolute=True)

        for joint, name in zip(
            self.upper_joints + self.lower_joints + self.corner_joints,
            self.ctrl_names
        ):
            offset_name = name.replace("ctrl_", "offset_", 1)

            if cmds.objExists(offset_name):
                self.snap_to(joint.name, offset_name, rotation=False)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""控制器约束关节 + blink 驱动闭眼。"""

        joints = self.upper_joints + self.lower_joints + self.corner_joints

        for ctrl, joint in zip(self.ctrls, joints):
            name = joint.name.replace("jnt_", "cons_", 1)

            if cmds.objExists(name):
                cmds.delete(name)

            cmds.parentConstraint(
                ctrl.get_output(), joint.name,
                maintainOffset=True,
                name=name
            )

        self.create_blink()

        return self.ctrl_names

    def create_blink(self):
        u"""blink 0-1：上眼皮向下、下眼皮向上。"""

        control = self._blink_control()

        if not cmds.attributeQuery(self.blink_attr, node=control,
                                   exists=True):
            cmds.addAttr(
                control,
                longName=self.blink_attr,
                defaultValue=0.0,
                minValue=0.0,
                maxValue=1.0,
                keyable=True
            )

        # 关节被控制器约束着，rotateX 写不进去；
        # 改驱动两个 root（在眼球中心），整圈眼皮一起转。
        self._driven_blink(
            self.root_joints[0], control, self.blink_angle
        )
        self._driven_blink(
            self.root_joints[1], control, -self.blink_angle
        )

        return control

    def _blink_control(self):
        u"""优先用眼球控制器的 blink，没有就用第一个眼皮控制器。"""

        eye_ctrl = Name(
            type="ctrl", side=self.side, part="eye", function="main",
            index=1
        ).name

        if cmds.objExists(eye_ctrl):
            return eye_ctrl

        return self.ctrls[0].name

    def _driven_blink(self, joint, control, angle):
        u"""blink 0 → 0 度，1 → angle 度。"""

        plug = joint.name + ".rotateX"

        for driver, value in ((0.0, 0.0), (1.0, float(angle))):
            cmds.setDrivenKeyframe(
                plug,
                currentDriver="{}.{}".format(control, self.blink_attr),
                driverValue=driver,
                value=value
            )

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        u"""删约束后再删总组。"""

        for joint in (
            self.upper_joints + self.lower_joints + self.corner_joints
        ):
            name = joint.name.replace("jnt_", "cons_", 1)

            if cmds.objExists(name):
                cmds.delete(name)

        delete_nodes = super().delete_rig()

        self.root_joints = []
        self.upper_joints = []
        self.lower_joints = []
        self.corner_joints = []
        self.ctrls = []

        return delete_nodes
