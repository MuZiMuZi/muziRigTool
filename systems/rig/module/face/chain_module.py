# coding=utf-8
u"""通用链式部位：关节链 + 每关节一个控制器。

耳朵、舌头、鼻子、脸颊、颧骨、下颚、牙齿、拉伸这些部位结构相同：

    定位器 → 关节链 → 每个关节一个控制器 → 约束

差别只在名字、形状、大小和是否需要额外的驱动（鼻子缩放、zip 等），
所以做成一个可配置的基类，子类只写差异。
"""

from maya import cmds

from .....core.name_utils import Name
from .base import FaceModule


class ChainedPart(FaceModule):
    u"""按定位器建一条（或多条）关节链并配控制器。"""

    # 子类覆盖
    part = "part"
    shape = "circle"
    size = 2.0
    color = 17
    root_name_function = "root"

    def __init__(self, side="md", chains=None, shape=None, size=None,
                 color=None, module=None, **kwargs):
        u"""chains：list of (part, guides)，支持多组链。"""

        super().__init__(
            module=module or self.part, side=side, guides=None, **kwargs
        )

        self.chains = chains or []
        self.shape = shape or self.shape
        self.size = size if size is not None else self.size
        self.color = color if color is not None else self.color
        self.joint_names = []
        self.ctrl_names = []
        self.cons_names = []
        self.root_joints = []
        self.joints = []
        self.ctrls = []

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        if not self.chains:
            raise RuntimeError(u"{} 需要至少一条链".format(
                type(self).__name__))

        self.build_names()

        return []

    def build_names(self):
        u"""每条链：root 关节 + bind 关节 + 控制器。"""

        self.joint_names = []
        self.ctrl_names = []
        self.cons_names = []

        for part, guides in self.chains:
            count = len(guides)

            self.joint_names.append([
                Name(type="jnt", side=self.side, part=part,
                     function="bind", index=index).name
                for index in range(1, count + 1)
            ])

            self.ctrl_names.append([
                Name(type="ctrl", side=self.side, part=part,
                     function="main", index=index).name
                for index in range(1, count + 1)
            ])

            self.cons_names.append([
                Name(type="cons", side=self.side, part=part,
                     function="main", index=index).name
                for index in range(1, count + 1)
            ])

    # ------------------------------------------------------------------
    # 关节 / 控制器
    # ------------------------------------------------------------------

    def create_joints(self):
        self.root_joints = []
        self.joints = []

        for (part, guides), names in zip(self.chains, self.joint_names):
            root_name = Name(
                type="jnt", side=self.side, part=part,
                function=self.root_name_function, index=1
            ).name

            from .....core.jnt_utils import Jnt

            root = Jnt.create_jnt(
                root_name,
                position=self.guide_position(guides[0])
            )
            self.root_joints.append(root)

            chain = self.create_chain_from_guides(
                names, guides, parent=root.name
            )
            self.joints.append(chain)

    def create_ctrls(self):
        self.ctrls = []

        for names, joint_chain in zip(self.ctrl_names, self.joints):
            controls = []

            for name, joint in zip(names, joint_chain):
                ctrl = self.create_joint_ctrl(
                    name, joint.name,
                    shape=self.shape, size=self.size, color=self.color
                )
                controls.append(ctrl)

            self.ctrls.append(controls)

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        super().setup_hierarchy()

        for root in self.root_joints:
            cmds.parent(root.name, self.jnt_master_grp, absolute=True)

        for names in self.ctrl_names:
            self.attach_zero_groups(names, self.ctrl_master_grp)

        for joints, names in zip(self.joints, self.ctrl_names):
            for joint, ctrl_name in zip(joints, names):
                offset_name = ctrl_name.replace("ctrl_", "offset_", 1)

                if cmds.objExists(offset_name):
                    self.snap_to(joint.name, offset_name, rotation=False)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        for joints, names, cons in zip(
            self.joints, self.ctrl_names, self.cons_names
        ):
            for joint, ctrl_name, cons_name in zip(joints, names, cons):
                ctrl = self.ctrl_by_name(ctrl_name)

                if ctrl is not None:
                    self.constrain_ctrl(ctrl, joint.name, name=cons_name)

        return self.cons_names

    def ctrl_by_name(self, name):
        for group in self.ctrls:
            for ctrl in group:
                if ctrl.name == name:
                    return ctrl

        return None

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        for cons in self.cons_names:
            for name in cons:
                if cmds.objExists(name):
                    cmds.delete(name)

        delete_nodes = super().delete_rig()

        self.root_joints = []
        self.joints = []
        self.ctrls = []

        return delete_nodes
