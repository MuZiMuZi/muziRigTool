# coding=utf-8
u"""眼球模块：控制器 + 目标约束（眼球追踪）。

眼球是球，位置不动、只转方向，所以用目标约束比旋转约束直观：
动画师拖控制器，眼球就「看」向控制器。

朝向约定（16-03）：

    X 轴  目标向量（眼睛看出去的方向）
    Y 轴  向上方向，由 up 定位器给出，避免跟着控制器翻滚

所以约束必须带一个稳定的 up 物体：
    worldUpType = objectrotation
    worldUpObject = 面部自己的 up 定位器

如果用 scene up 或 vector，眼球在控制器绕自己转的时候会跟着翻，
左右眼的翻滚方向还容易不一致。

控制器上额外放两个给眼皮用的属性（16-15）：

    blink  0-1   0 正常、1 完全闭合
    link   0-1   0 贴下眼皮、1 贴上眼皮（默认 0.5）

注意：眼球的旋转是「目标约束」独占的，
关节本身不要再连别的旋转驱动，否则两套会打架。
"""

from maya import cmds

from .....core.name_utils import Name
from .....core.jnt_utils import Jnt
from .base import FaceModule


class Eye(FaceModule):
    u"""单只眼球：关节 + 控制器 + 追踪约束。"""

    def __init__(self, side="lf", guides=None, size=1.2, color=6,
                 shape="sphere", forward=6.0, **kwargs):
        super(Eye, self).__init__(
            module="eye",
            side=side,
            guides=guides,
            **kwargs
        )

        self.size = size
        self.color = color
        self.shape = shape

        # 控制器放在眼球中心正前方（+X），拖它决定视线。
        # 放在球心会和关节重合，目标约束的方向就退化了。
        self.forward = forward

        self.joint_name = ""
        self.ctrl_name = ""
        self.up_name = ""
        self.constraint_name = ""

        self.joint = None
        self.ctrl = None
        self.up_locator = None

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide：眼球中心 / up 参考点。"""

        super(Eye, self).get_guides()

        if len(self.guide_list) != 2:
            raise RuntimeError(
                u"眼球需要 2 个 Guide（眼球中心 / up 参考），"
                u"收到 {} 个".format(len(self.guide_list))
            )

        self.build_names()

        return self.guide_list

    def build_names(self):
        u"""生成固定名称。"""

        self.joint_name = Name(
            type="jnt", side=self.side, part="eye",
            function="bind", index=1
        ).name

        self.ctrl_name = Name(
            type="ctrl", side=self.side, part="eye",
            function="main", index=1
        ).name

        self.up_name = Name(
            type="loc", side=self.side, part="eye",
            function="up", index=1
        ).name

        self.constraint_name = Name(
            type="cons", side=self.side, part="eye",
            function="aim", index=1
        ).name

    # ------------------------------------------------------------------
    # 关节 / 控制器
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""眼球关节：蒙皮用，位置在眼球中心。"""

        self.joint = Jnt.create_jnt(
            self.joint_name, target=self.guide_list[0]
        )

    def create_ctrls(self):
        u"""眼球控制器（球心正前方）+ up 定位器。"""

        self.ctrl = self.create_face_ctrl(
            self.ctrl_name,
            target=self.guide_list[0],
            shape=self.shape,
            color=self.color,
            size=self.size
        )

        # 把整个 zero 组前移，而不是只动 ctrl：
        # 这样控制器层级里的偏移值保持为零。
        eye_position = cmds.xform(
            self.guide_list[0], query=True, worldSpace=True,
            translation=True
        )
        zero_grp = self.ctrl_name.replace("ctrl_", "zero_", 1)
        cmds.xform(
            zero_grp,
            worldSpace=True,
            translation=[
                eye_position[0] + self.forward,
                eye_position[1],
                eye_position[2],
            ]
        )

        self.up_locator = cmds.spaceLocator(name=self.up_name)[0]
        cmds.matchTransform(
            self.up_locator,
            self.guide_list[1],
            position=True,
            rotation=False,
            scale=False
        )

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""关节挂 jnt 组，控制器和 up 定位器挂 ctrl 组。"""

        super(Eye, self).setup_hierarchy()

        cmds.parent(self.joint.name, self.jnt_master_grp, absolute=True)

        zero_grp = self.ctrl_name.replace("ctrl_", "zero_", 1)
        cmds.parent(zero_grp, self.ctrl_master_grp, absolute=True)
        cmds.parent(self.up_locator, self.ctrl_master_grp, absolute=True)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""目标约束 + 眼皮要用的 blink / link 属性。"""

        self.add_lid_attrs()

        if cmds.objExists(self.constraint_name):
            return self.constraint_name

        constraint = cmds.aimConstraint(
            self.ctrl.name,
            self.joint.name,
            aimVector=(1.0, 0.0, 0.0),
            upVector=(0.0, 1.0, 0.0),
            worldUpType="objectrotation",
            worldUpObject=self.up_locator,
            maintainOffset=False,
            name=self.constraint_name
        )

        return constraint[0]

    def add_lid_attrs(self):
        u"""给眼皮模块预留的两个属性。"""

        self.add_float(
            self.ctrl.name, "blink",
            default=0.0, min_value=0.0, max_value=1.0
        )
        self.add_float(
            self.ctrl.name, "link",
            default=0.5, min_value=0.0, max_value=1.0
        )

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        u"""先删约束和 up 定位器，再删总组。"""

        if cmds.objExists(self.constraint_name):
            cmds.delete(self.constraint_name)

        if self.up_locator and cmds.objExists(self.up_locator):
            cmds.delete(self.up_locator)

        delete_nodes = super(Eye, self).delete_rig()

        self.joint = None
        self.ctrl = None
        self.up_locator = None

        return delete_nodes
