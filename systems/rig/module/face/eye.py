# coding=utf-8
u"""眼球模块：控制器 + 目标约束（眼球追踪）。

眼球是球，位置不动、只转方向，所以用目标约束比旋转约束直观：
动画师拖控制器，眼球就「看」向目标点。

模板（face_guide.ma）给的东西：

    loc_<side>_eye_ball_001   眼球中心
    loc_<side>_eye_iris_001   虹膜位置（显示参考，本模块不用）
    loc_<side>_eye_aim_001    视线目标点（在眼球正前方很远）

做法：

    关节放在眼球中心，控制器放在眼球中心，
    复制一个 gaze 定位器到 aim 的位置、挂到控制器下面；
    眼球 X 轴始终盯住 gaze。

这样拖控制器 / 转控制器都会带着 gaze 走，视线就跟着变；
模板里的 aim 定位器保持只读，不会被绑定删掉。

注意：眼球的旋转由目标约束独占，关节不要再接别的旋转驱动。
"""

from maya import cmds

from .....core.name_utils import Name
from .....core.jnt_utils import Jnt
from .base import FaceModule


class Eye(FaceModule):
    u"""单只眼球：关节 + 控制器 + 追踪约束。"""

    def __init__(self, side="lf", guides=None, size=2.0, color=6,
                 shape="sphere", constraints=True, **kwargs):
        super().__init__(
            module="eye",
            side=side,
            guides=guides,
            **kwargs
        )

        self.size = size
        self.constraints = constraints
        self.color = color
        self.shape = shape

        self.joint_name = ""
        self.ctrl_name = ""
        self.gaze_name = ""
        self.constraint_name = ""

        self.joint = None
        self.ctrl = None
        self.gaze_locator = None

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide：眼球中心 / 视线目标点。"""

        super().get_guides()

        if len(self.guide_list) != 2:
            raise RuntimeError(
                u"眼球需要 2 个 Guide（眼球中心 / 视线目标），"
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

        self.gaze_name = Name(
            type="loc", side=self.side, part="eye",
            function="gaze", index=1
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
            self.joint_name,
            position=self.guide_position(self.guide_list[0])
        )

    def create_ctrls(self):
        u"""眼球控制器（球心）+ 视线目标定位器。"""

        self.ctrl = self.create_face_ctrl(
            self.ctrl_name,
            target=self.guide_list[0],
            shape=self.shape,
            color=self.color,
            size=self.size
        )

        self.gaze_locator = cmds.spaceLocator(name=self.gaze_name)[0]
        cmds.setAttr(self.gaze_locator + ".visibility", 0)
        self.copy_world_transform(
            self.guide_list[1], self.gaze_locator,
            position=True, rotation=False
        )

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""关节挂 jnt 组，控制器挂 ctrl 组。"""

        super().setup_hierarchy()

        cmds.parent(self.joint.name, self.jnt_master_grp, absolute=True)

        zero_grp = self.ctrl_name.replace("ctrl_", "zero_", 1)
        cmds.parent(zero_grp, self.ctrl_master_grp, absolute=True)

        # 挂完层级再吸附，保证和模板定位器一致
        self.snap_to(self.guide_list[0], self.joint.name, rotation=False)
        self.snap_to(self.guide_list[0], zero_grp, rotation=False)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""视线目标挂到控制器下，眼球盯住它。"""

        self.add_lid_attrs()
        self.attach_gaze()

        if not self.constraints:
            return None

        if cmds.objExists(self.constraint_name):
            return self.constraint_name

        constraint = cmds.aimConstraint(
            self.gaze_locator,
            self.joint.name,
            aimVector=(1.0, 0.0, 0.0),
            upVector=(0.0, 1.0, 0.0),
            worldUpType="vector",
            worldUpVector=(0.0, 1.0, 0.0),
            maintainOffset=False,
            name=self.constraint_name
        )

        return constraint[0]

    def attach_gaze(self):
        u"""把 gaze 定位器挂到控制器 output 下。

        parent 默认保世界位置，所以局部偏移会自动算成「眼球 → 目标」的向量；
        拖控制器时 gaze 跟着走，眼球方向随之改变。
        """

        if not self.gaze_locator or not cmds.objExists(self.gaze_locator):
            return

        output = self.ctrl.get_output()
        current_parent = cmds.listRelatives(self.gaze_locator, parent=True)

        if not current_parent or current_parent[0] != output:
            cmds.parent(self.gaze_locator, output)

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
        u"""先删约束和 gaze 定位器，再删总组。"""

        if cmds.objExists(self.constraint_name):
            cmds.delete(self.constraint_name)

        if self.gaze_locator and cmds.objExists(self.gaze_locator):
            cmds.delete(self.gaze_locator)

        delete_nodes = super().delete_rig()

        self.joint = None
        self.ctrl = None
        self.gaze_locator = None

        return delete_nodes
