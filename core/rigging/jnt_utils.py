# coding=utf-8
u"""Joint 基础操作。

只处理「单个关节」：创建、引用、删除、对齐、朝向、显示、Label。

    不处理成链      链操作放在 jnt_chain_utils
    不处理命名规则  五段式解析由 Name 负责
    不依赖其他 core 只用 maya.cmds 与 Name

约定：

    Jnt(name)              引用一个已存在的关节，不创建、不修改场景
    Jnt.create_jnt(...)    显式创建关节，返回 Jnt

    数值用属性写       jnt.radius = 0.5 / jnt.joint_orient = (10, 0, 0)
    开关用方法         jnt.set_jnt_axis(True) / jnt.set_scale_compensate(False)

构造与创建分开，是为了避免「拼错一个变量名就在场景里留一个垃圾节点」。
"""

import maya.cmds as cmds

from ..common.name_utils import Name


class Jnt(object):
    u"""单个 Maya 关节。"""

    # Maya 关节 label 的 side 取值。
    label_side = {"md": 0, "lf": 1, "rt": 2}

    def __init__(self, name):
        u"""引用一个已经存在的关节。

        Args:
            name (str): 关节名称。

        Raises:
            RuntimeError: 节点不存在。
            TypeError: 节点存在但不是 joint。
        """

        if not cmds.objExists(name):
            raise RuntimeError(u"关节不存在：{}".format(name))

        if cmds.nodeType(name) != "joint":
            raise TypeError(u"{} 已存在，但不是 joint 节点。".format(name))

        self.name = name

    def __repr__(self):
        return "<Jnt {}>".format(self.name)

    # ------------------------------------------------------------------
    # 创建与删除
    # ------------------------------------------------------------------

    @classmethod
    def create_jnt(cls, name, target=None, position=None, rotation=None,
               parent=None, radius=None, match_rotation=True):
        u"""创建一个新关节。

        两种定位方式，二选一：

            传 target           按目标节点的世界位置创建（Guide 常用）
            传 position/rotation 直接指定世界坐标

        Args:
            name (str): 关节名称，必须尚未存在。
            target (str): 定位目标，传入时忽略 position / rotation。
            position (tuple): 世界位置。
            rotation (tuple): 世界旋转，不是 jointOrient。
            parent (str): 父节点，None 表示留在世界层级。
            radius (float): 显示半径。
            match_rotation (bool): 传 target 时是否同时匹配旋转。

        Returns:
            Jnt: 新建的关节。
        """

        if not name:
            raise ValueError(u"关节名称不能为空。")

        if cmds.objExists(name):
            raise RuntimeError(u"节点已经存在：{}".format(name))

        if target is not None:
            position = cmds.xform(target, query=True, worldSpace=True, translation=True)
            rotation = None

            if match_rotation:
                rotation = cmds.xform(target, query=True, worldSpace=True, rotation=True)

        node = cmds.createNode("joint", name=name)

        if parent is not None:
            cmds.parent(node, parent, absolute=True)

        if position is not None:
            cmds.xform(node, worldSpace=True, translation=position)

        if rotation is not None:
            cmds.xform(node, worldSpace=True, rotation=rotation)

        if radius is not None:
            cmds.setAttr(node + ".radius", radius)

        return cls(node)

    def delete_jnt(self, keep_children=True):
        u"""删除当前关节。

        Maya 删除关节时是递归的——直接 cmds.delete 会连子关节一起删掉。
        因此 keep_children=True 时必须先把子级提升到上一级，再删除自身。

        Args:
            keep_children (bool): True 保留子关节并重挂到上一级，False 连子级一起删除。
        """

        if not keep_children:
            cmds.delete(self.name)
            return

        children = cmds.listRelatives(self.name, children=True) or []
        parent = cmds.listRelatives(self.name, parent=True)
        target = parent[0] if parent else None

        for child in children:
            if target:
                cmds.parent(child, target, absolute=True)
            else:
                cmds.parent(child, world=True, absolute=True)

        cmds.delete(self.name)

    # ------------------------------------------------------------------
    # 对齐与朝向
    # ------------------------------------------------------------------

    def match_transform(self, target, position=True, rotation=True):
        u"""把当前关节对齐到目标节点。

        Args:
            target (str): 对齐目标。
            position (bool): 是否匹配位置。
            rotation (bool): 是否匹配旋转。
        """

        cmds.matchTransform(self.name, target, position=position, rotation=rotation)

    def rebuild_orient(self, primary_axis="xyz", secondary_axis="xup"):
        u"""按直接子关节整理 jointOrient。

        没有子关节时把 orientJoint 设为 none，避免 Maya 计算出无意义朝向。

        Args:
            primary_axis (str): 主轴向。
            secondary_axis (str): 次轴向。
        """

        children = cmds.listRelatives(self.name, children=True, type="joint") or []

        if not children:
            cmds.joint(self.name, edit=True, orientJoint="none")
            return

        cmds.joint(
            self.name,
            edit=True,
            zeroScaleOrient=True,
            orientJoint=primary_axis,
            secondaryAxisOrient=secondary_axis
        )

    # ------------------------------------------------------------------
    # 数值属性
    # ------------------------------------------------------------------

    @property
    def radius(self):
        u"""关节显示半径。"""

        return cmds.getAttr(self.name + ".radius")

    @radius.setter
    def radius(self, value):
        cmds.setAttr(self.name + ".radius", value)

    @property
    def joint_orient(self):
        u"""jointOrientXYZ。

        读：jnt.joint_orient            -> (x, y, z)
        写：jnt.joint_orient = (10,0,0)
        清零：jnt.joint_orient = (0,0,0)
        """

        return cmds.getAttr(self.name + ".jointOrient")[0]

    @joint_orient.setter
    def joint_orient(self, values):
        if values is None or len(values) != 3:
            raise ValueError(u"jointOrient 必须包含 3 个数值。")

        for index, axis in enumerate(("X", "Y", "Z")):
            cmds.setAttr("{}.jointOrient{}".format(self.name, axis), values[index])

    # ------------------------------------------------------------------
    # 布尔开关
    # ------------------------------------------------------------------

    def set_jnt_axis(self, axis_value):
        u"""显示或隐藏 Local Rotation Axis。

        Args:
            axis_value (bool): True 显示，False 隐藏。
        """

        cmds.setAttr(self.name + ".displayLocalAxis", 1 if axis_value else 0)

    def get_jnt_axis(self):
        u"""返回 Local Rotation Axis 是否显示。"""

        return bool(cmds.getAttr(self.name + ".displayLocalAxis"))

    def set_scale_compensate(self, enabled=True):
        u"""设置 segmentScaleCompensate。

        Args:
            enabled (bool): True 启用，False 关闭。
        """

        cmds.setAttr(self.name + ".segmentScaleCompensate", bool(enabled))

    def get_scale_compensate(self):
        u"""返回 segmentScaleCompensate 是否启用。"""

        return bool(cmds.getAttr(self.name + ".segmentScaleCompensate"))

    # ------------------------------------------------------------------
    # Label
    # ------------------------------------------------------------------

    def set_label(self, side=None, label_type=18, other_type=None):
        u"""设置 Maya 关节 Label。

        不传 side 时按五段式名称自动解析：

            jnt_lf_upper_lid_bind_001
                side        lf   -> 1
                otherType   upper_lid_bind

        Args:
            side (str): md / lf / rt；None 表示从名称解析。
            label_type (int): Maya label 类型，默认 18（Other）。
            other_type (str): 自定义标签文字；None 表示从名称解析。

        Raises:
            ValueError: side 不是 md / lf / rt，或名称不符合五段式规则。
        """

        if side is None:
            parsed = Name(name=self.name.split("|")[-1])
            side = parsed.side

            if other_type is None:
                other_type = "{}_{}".format(parsed.part, parsed.function)

        if side not in self.label_side:
            raise ValueError(u"side 只能是 md / lf / rt，收到：{!r}".format(side))

        cmds.setAttr(self.name + ".side", self.label_side[side])
        cmds.setAttr(self.name + ".type", int(label_type))
        cmds.setAttr(self.name + ".otherType", other_type or "", type="string")
