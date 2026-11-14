# coding=utf-8
u"""表情面板：大动作控制器 → 次级控制器。

思路（ADV 式）：

    小的次级控制器（内 / 中 / 外）负责微调；
    另起一组贴在旁边的「表情面板」控制器负责大动作，
    例如把「抬眉」控制器往上拖，三个次级控制器按比例一起上移。

连法：

    面板控制器 translateY ──multiplyDivide（× 权重）──▸ zero 组的 translateY

    每个次级控制器有自己的权重（内侧最大、外侧最小），
    所以抬眉时眉毛整体上移、外侧略少；次级控制器本身仍然可以继续微调。

这里只放「抬眉 / 压眉」两个，后面有需要再加（皱眉、内挤等）。
"""

from maya import cmds

from .....core.name_utils import Name
from .base import FaceModule


class ExpressionPanel(FaceModule):
    u"""一侧眉毛的表情面板：抬眉 / 压眉两个大控制器。"""

    def __init__(self, side="lf", guides=None, targets=None,
                 offset=(60.0, 0.0, 0.0), size=20.0, color=20,
                 raise_weights=None, lower_weights=None, **kwargs):
        super().__init__(
            module="brow_expr",
            side=side,
            guides=guides,
            **kwargs
        )

        # targets: [(ctrl 对象, zero 组名), ...]，由 Brow 传进来
        self.targets = targets or []
        self.offset = offset
        self.size = size
        self.color = color

        self.raise_weights = raise_weights or (1.0, 0.7, 0.45)
        self.lower_weights = lower_weights or (1.0, 0.55, 0.25)

        self.ctrl_names = []
        self.mult_names = []
        self.add_names = []

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

    def get_guides(self):
        u"""面板只要一个锚点定位器（眉毛主控）。"""

        super().get_guides()

        if len(self.guide_list) != 1:
            raise RuntimeError(
                u"表情面板需要 1 个锚点 Guide，收到 {} 个".format(
                    len(self.guide_list)
                )
            )

        self.build_names()

        return self.guide_list

    def build_names(self):
        u"""生成抬眉 / 压眉控制器的名字。"""

        self.ctrl_names = [
            Name(
                type="ctrl", side=self.side, part="brow_expr",
                function=function, index=1
            ).name
            for function in ("raise", "lower")
        ]

        self.mult_names = []

        for function in ("raise", "lower"):
            for index in range(len(self.targets)):
                self.mult_names.append(
                    Name(
                        type="mult", side=self.side, part="brow_expr",
                        function=function, index=index + 1
                    ).name
                )

        self.add_names = [
            Name(
                type="add", side=self.side, part="brow_expr",
                function="main", index=index + 1
            ).name
            for index in range(len(self.targets))
        ]

    # ------------------------------------------------------------------
    # 控制器
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""面板没有关节。"""

    def create_ctrls(self):
        u"""在锚点旁边建抬眉 / 压眉控制器。"""

        anchor = self.guide_position(self.guide_list[0])
        sign = 1.0 if self.side == "lf" else -1.0

        position = [
            anchor[0] + self.offset[0] * sign,
            anchor[1] + self.offset[1],
            anchor[2] + self.offset[2],
        ]

        self.ctrls = []

        for ctrl_name in self.ctrl_names:
            ctrl = self.create_face_ctrl(
                ctrl_name,
                target=None,
                shape="arrow_1_thinbev",
                color=self.color,
                size=self.size,
                axis="Y+"
            )

            zero_name = ctrl_name.replace("ctrl_", "zero_", 1)

            cmds.xform(zero_name, worldSpace=True, translation=position)
            self.ctrls.append(ctrl)

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""面板控制器挂自己的 ctrl 组。"""

        super().setup_hierarchy()

        for ctrl_name in self.ctrl_names:
            zero_name = ctrl_name.replace("ctrl_", "zero_", 1)

            if cmds.objExists(zero_name):
                cmds.parent(zero_name, self.ctrl_master_grp, absolute=True)

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def connect_rig(self):
        u"""抬眉 / 压眉 → 相加 → 各次级控制器的 zero 组位移。"""

        if not self.targets:
            return []

        weights_list = (self.raise_weights, self.lower_weights)
        nodes = []

        # 每个 target 先建一个加法节点：raise 和 lower 都从它汇总
        add_nodes = []

        for index in range(len(self.targets)):
            name = self.add_names[index]

            if cmds.objExists(name):
                node = name
            else:
                node = cmds.createNode("plusMinusAverage", name=name)

            add_nodes.append(node)
            nodes.append(node)

        for ctrl_index, ctrl in enumerate(self.ctrls):
            weights = weights_list[ctrl_index]

            for target_index, (_, zero_name) in enumerate(self.targets):
                if target_index >= len(weights):
                    continue

                node_name = self.mult_names[
                    ctrl_index * len(self.targets) + target_index
                ]

                if cmds.objExists(node_name):
                    node = node_name
                else:
                    node = cmds.createNode("multiplyDivide", name=node_name)

                for source, target in (
                    (ctrl.name + ".translateY", node + ".input1Y"),
                    (
                        node + ".outputY",
                        add_nodes[target_index] + ".input1D[{}]".format(
                            ctrl_index
                        )
                    ),
                ):
                    if not cmds.isConnected(source, target):
                        cmds.connectAttr(source, target, force=True)

                cmds.setAttr(
                    node + ".input2Y", float(weights[target_index])
                )

                nodes.append(node)

        for target_index, (_, zero_name) in enumerate(self.targets):
            source = add_nodes[target_index] + ".output1D"
            target = zero_name + ".translateY"

            if not cmds.isConnected(source, target):
                cmds.connectAttr(source, target, force=True)

        return nodes

    # ------------------------------------------------------------------
    # 删除
    # ------------------------------------------------------------------

    def delete_rig(self):
        u"""先删乘除节点，再删总组。"""

        for name in self.mult_names + self.add_names:
            if cmds.objExists(name):
                cmds.delete(name)

        delete_nodes = super().delete_rig()

        self.ctrls = []

        return delete_nodes
