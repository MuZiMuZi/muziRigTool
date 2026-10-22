# coding=utf-8
u"""FK 链模块。

最基础的绑定模块：一条 Guide 链，长出关节链和控制器链。

结构：

    grp_<side>_<module>_jnt_001
        └─ jnt_001
            └─ jnt_002
                └─ jnt_003

    grp_<side>_<module>_ctrl_001
        └─ zero_001
            └─ ctrl_001
                └─ output_001
                    └─ zero_002
                        └─ ctrl_002
                            └─ output_002

连接：每个控制器的 output 用 parentConstraint 驱动对应关节。

和旧库的差异：

    - 名称改成建链时一次生成，旧库在 __init__ 里就写死
    - 约束名称固定，重复 connect 直接跳过
    - 删除时先删约束再删组，避免约束悬空
"""

from maya import cmds

from ....core.common.name_utils import Name
from .base import RigModule


class FkChain(RigModule):
    u"""FK 链：Guide 链 -> 关节链 + 控制器链。"""

    def __init__(
        self,
        module="chain",
        side="md",
        guides=None,
        shape="circle",
        color=17,
        size=1.0,
        axis="X+",
        jnt_parent=None,
        ctrl_parent=None
    ):
        super(FkChain, self).__init__(
            module=module,
            side=side,
            guides=guides,
            jnt_parent=jnt_parent,
            ctrl_parent=ctrl_parent
        )

        self.shape = shape
        self.color = color
        self.size = size
        self.axis = axis

        # 稳定名称：只生成一次，重建时复用，避免节点越建越多
        self.jnt_names = []
        self.ctrl_names = []
        self.constraint_names = []

        self.jnt_objects = []
        self.ctrl_objects = []

    def build_names(self):
        u"""按 Guide 数量生成关节、控制器、约束的固定名称。"""

        count = len(self.guide_list)

        self.jnt_names = [
            Name(
                type="jnt",
                side=self.side,
                part=self.module,
                function="bind",
                index=index
            ).name
            for index in range(1, count + 1)
        ]

        self.ctrl_names = [
            Name(
                type="ctrl",
                side=self.side,
                part=self.module,
                function="fk",
                index=index
            ).name
            for index in range(1, count + 1)
        ]

        self.constraint_names = [
            Name(
                type="cons",
                side=self.side,
                part=self.module,
                function="fk",
                index=index
            ).name
            for index in range(1, count + 1)
        ]

    def get_guides(self):
        u"""读取 Guide 并生成对应的固定名称。"""

        super(FkChain, self).get_guides()
        self.build_names()

        return self.guide_list

    def create_joints(self):
        u"""每个 Guide 建一个关节。"""

        self.jnt_objects = self.create_joints_for_guides(
            self.guide_list,
            self.jnt_names
        )

    def create_ctrls(self):
        u"""每个 Guide 建一个 FK 控制器。"""

        self.ctrl_objects = self.create_ctrls_for_guides(
            self.guide_list,
            self.ctrl_names,
            shape=self.shape,
            color=self.color,
            size=self.size,
            axis=self.axis
        )

    def setup_hierarchy(self):
        u"""关节串成链，控制器通过 zero 组串成链。"""

        super(FkChain, self).setup_hierarchy()

        self.chain_joints(self.jnt_objects)
        self.chain_zero_groups(self.ctrl_objects)

    def connect_rig(self):
        u"""用控制器的 output 约束对应关节。

        约束名固定，重复执行时已经存在就跳过。

        Returns:
            list: 约束名列表。
        """

        for index, jnt in enumerate(self.jnt_objects):
            driver = self.ctrl_objects[index].get_output()
            constraint_name = self.constraint_names[index]

            if not cmds.objExists(driver):
                raise RuntimeError(
                    u"控制器 output 不存在：{}".format(driver)
                )

            if not cmds.objExists(jnt.name):
                raise RuntimeError(
                    u"关节不存在：{}".format(jnt.name)
                )

            if cmds.objExists(constraint_name):
                continue

            cmds.parentConstraint(
                driver,
                jnt.name,
                maintainOffset=True,
                name=constraint_name
            )

        return self.constraint_names

    def delete_rig(self):
        u"""先删约束，再删两组。

        Returns:
            list: 被删除的总组。
        """

        for constraint_name in self.constraint_names:
            if cmds.objExists(constraint_name):
                cmds.delete(constraint_name)

        delete_nodes = super(FkChain, self).delete_rig()

        # 清掉 Python 侧引用，稳定名称保留，方便再次 build
        self.jnt_objects = []
        self.ctrl_objects = []

        return delete_nodes
