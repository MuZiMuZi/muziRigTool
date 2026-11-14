# coding=utf-8
u"""下巴模块：旋转驱动的「下巴下落 + 前移」。

真实下巴不是绕一个点纯旋转的：张嘴时它同时往前走一点、往下走一点，
所以动画师只转控制器、位移自动补上，才不用每次手调。

为什么不用「约束提取旋转」：

    下巴控制器上面还有 zero / driven / space 等组，
    如果拿 output 组的旋转去约束 locator，再用 locator 驱动
    connect 组的位移，就会形成环：
        locator → connect → output 世界矩阵 → 旋转约束 → locator
    Maya 会直接报 cycle。

这里用的是 16-04 最后的结论——只取「局部旋转数值」：

    ctrl.rotateX ─┬─ multiplyDivide（× jawDropY）→ connect.translateY
                  └─ multiplyDivide（× jawDropZ）→ connect.translateZ

属性连线只传数值、不读世界矩阵，所以不会成环。

系数放在控制器上（jawDropY / jawDropZ），动画师能按镜头自己调。
默认值沿用笔记：Y 轴 0.03、Z 轴 -0.04（Z 负值是往前）。

层级：

    grp_md_jaw_jnt_001
        └─ jnt_md_face_root_001        承载不需要动的静态权重
            └─ jnt_md_jaw_bind_001     下巴形变关节

    grp_md_jaw_ctrl_001
        └─ zero_md_jaw_main_001 → … → connect_md_jaw_main_001
            └─ ctrl_md_jaw_main_001
"""

from maya import cmds

from .....core.name_utils import Name
from .....core.jnt_utils import Jnt
from .base import FaceModule


class Jaw(FaceModule):
    u"""下巴：关节 + 控制器 + 旋转补位移。"""

    def __init__(self, side="md", guides=None, size=2.0, color=17,
                 drop_y=0.03, drop_z=-0.04, root_guide=None, **kwargs):
        super().__init__(
            module="jaw",
            side=side,
            guides=guides,
            **kwargs
        )

        # 可选的静态权重容器：给了才建根关节，不给就只有下颌 + 尖。
        self.root_guide = root_guide

        self.size = size
        self.color = color
        self.drop_y = drop_y
        self.drop_z = drop_z

        self.root_name = ""
        self.joint_name = ""
        self.ctrl_name = ""
        self.mult_names = []
        self.constraint_name = ""

        self.root_joint = None
        self.jaw_joint = None
        self.tip_joint = None
        self.ctrl = None

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""读取 Guide：根（静态权重）/ 下巴枢轴。"""

        super().get_guides()

        if len(self.guide_list) != 2:
            raise RuntimeError(
                u"下巴需要 2 个 Guide（下颌枢轴 / 下巴尖），"
                u"收到 {} 个".format(len(self.guide_list))
            )

        self.build_names()

        return self.guide_list

    def build_names(self):
        u"""生成固定名称。"""

        self.root_name = Name(
            type="jnt", side=self.side, part="face",
            function="root", index=1
        ).name

        self.joint_name = Name(
            type="jnt", side=self.side, part="jaw",
            function="bind", index=1
        ).name

        self.tip_name = Name(
            type="jnt", side=self.side, part="jaw",
            function="tip", index=1
        ).name

        self.ctrl_name = Name(
            type="ctrl", side=self.side, part="jaw",
            function="main", index=1
        ).name

        self.mult_names = [
            Name(
                type="mult", side=self.side, part="jaw",
                function=function, index=1
            ).name
            for function in ("dropy", "dropz")
        ]

        self.constraint_name = Name(
            type="cons", side=self.side, part="jaw",
            function="main", index=1
        ).name

    # ------------------------------------------------------------------
    # 关节 / 控制器
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""下颌关节 + 下巴尖关节，位置严格等于两个定位器。

        不再自己造一个「面部根」关节：
        多出来的关节会和模板控制点对不上，看起来就是一截乱跑的骨头。
        需要静态权重容器时，传 root_guide 再建根关节。
        """

        self.root_joint = None

        if self.root_guide:
            self.root_joint = Jnt.create_jnt(
                self.root_name, target=self.root_guide
            )

        parent = self.root_joint.name if self.root_joint else None

        self.jaw_joint = Jnt.create_jnt(
            self.joint_name,
            target=self.guide_list[0],
            parent=parent
        )

        self.tip_joint = Jnt.create_jnt(
            self.tip_name,
            target=self.guide_list[1],
            parent=self.jaw_joint.name
        )

    def create_ctrls(self):
        u"""下巴控制器：圆形，位移旋转都开放。"""

        self.ctrl = self.create_face_ctrl(
            self.ctrl_name,
            target=self.guide_list[0],
            shape="circle",
            color=self.color,
            size=self.size
        )

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""根关节挂 jnt 组，控制器 zero 组挂 ctrl 组。"""

        super().setup_hierarchy()

        # 有根关节时把根挂到 jnt 组；下颌已经是它的子级。
        if self.root_joint:
            cmds.parent(
                self.root_joint.name, self.jnt_master_grp, absolute=True
            )
        else:
            cmds.parent(
                self.jaw_joint.name, self.jnt_master_grp, absolute=True
            )

        # 挂完层级再吸附一次：parent 过程中的偏移在这里抹平
        self.snap_to(self.guide_list[0], self.jaw_joint.name, rotation=True)
        self.snap_to(self.guide_list[1], self.tip_joint.name, rotation=True)

        zero_grp = self.ctrl_name.replace("ctrl_", "zero_", 1)

        if cmds.objExists(zero_grp):
            self.snap_to(self.guide_list[0], zero_grp, rotation=True)

        zero_grp = self.ctrl_name.replace("ctrl_", "zero_", 1)
        cmds.parent(zero_grp, self.ctrl_master_grp, absolute=True)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""旋转 → 位移系数 → connect 组；控制器 → 下巴关节。"""

        self.add_drop_attrs()
        self.drive_connect_translate()
        self.constrain_jaw()

        return self.constraint_name

    def add_drop_attrs(self):
        u"""在控制器上加两个位移系数。

        jawDropY / jawDropZ 表示「每转 1 度，往下 / 往前补多少单位」。
        """

        self.add_float(
            self.ctrl.name, "jawDropY",
            default=self.drop_y, min_value=-1.0, max_value=1.0
        )
        self.add_float(
            self.ctrl.name, "jawDropZ",
            default=self.drop_z, min_value=-1.0, max_value=1.0
        )

    def drive_connect_translate(self):
        u"""ctrl.rotateX × 系数 → connect 组 translateY / translateZ。"""

        connect_grp = self.ctrl_name.replace("ctrl_", "connect_", 1)

        if not cmds.objExists(connect_grp):
            raise RuntimeError(
                u"找不到控制器的 connect 组：{}".format(connect_grp)
            )

        for index, (attr_name, target_axis) in enumerate((
            ("jawDropY", "translateY"),
            ("jawDropZ", "translateZ"),
        )):
            node = self.mult_names[index]

            if not cmds.objExists(node):
                node = cmds.createNode("multiplyDivide", name=node)

            for source, target in (
                (self.ctrl.name + ".rotateX", node + ".input1X"),
                ("{}.{}".format(self.ctrl.name, attr_name),
                 node + ".input2X"),
                (node + ".outputX", connect_grp + "." + target_axis),
            ):
                if not cmds.isConnected(source, target):
                    cmds.connectAttr(source, target, force=True)

    def constrain_jaw(self):
        u"""控制器 output 经 locator 对约束下巴关节，保留建立时的偏移。"""

        if cmds.objExists(self.constraint_name):
            return self.constraint_name

        record = self.connect_ctrl_to_joint(
            self.ctrl,
            self.jaw_joint.name,
            name=self.constraint_name
        )

        return record["constraint"]

    # ------------------------------------------------------------------
    # 操作
    # ------------------------------------------------------------------

    def set_drop(self, degrees):
        u"""设置下巴旋转角度（负数 = 张嘴方向，具体看朝向）。"""

        cmds.setAttr(self.ctrl.name + ".rotateX", float(degrees))

        return degrees

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        u"""先删连接节点和乘除节点，再删总组。"""

        self.delete_connection_nodes()

        for node in self.mult_names:
            if cmds.objExists(node):
                cmds.delete(node)

        delete_nodes = super().delete_rig()

        self.root_joint = None
        self.jaw_joint = None
        self.tip_joint = None
        self.ctrl = None

        return delete_nodes
