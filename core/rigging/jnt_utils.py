# coding=utf-8
u"""Joint 基础操作。

两个粒度：

    Jnt         单个关节：创建、引用、删除、对齐、朝向、显示、Label
    JntChain    关节链：收集、创建、插入、删除、改名、镜像

    不处理命名规则  五段式解析由 Name 负责
    不依赖其他 core 只用 maya.cmds 与 Name

约定：

    Jnt(name)              引用一个已存在的关节，不创建、不修改场景
    Jnt.create_jnt(...)    显式创建关节，返回 Jnt
    JntChain(root)         从根关节收集整条链

    数值用属性写       jnt.radius = 0.5
    其余用方法         jnt.set_joint_orient(...) / jnt.set_jnt_axis(...)

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
    # 数值读写
    # ------------------------------------------------------------------

    @property
    def radius(self):
        u"""关节显示半径。"""

        return cmds.getAttr(self.name + ".radius")

    @radius.setter
    def radius(self, value):
        cmds.setAttr(self.name + ".radius", value)

    def get_joint_orient(self):
        u"""返回 jointOrientXYZ。"""

        return cmds.getAttr(self.name + ".jointOrient")[0]

    def set_joint_orient(self, values):
        u"""设置 jointOrientXYZ。

        jointOrient 是复合属性，三个分量可以一次写完。

        Args:
            values (tuple): 三个数值。

        Raises:
            ValueError: 不是三个数值。
        """

        if values is None or len(values) != 3:
            raise ValueError(u"jointOrient 必须包含 3 个数值。")

        cmds.setAttr(self.name + ".jointOrient", values[0], values[1], values[2])

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


class JntChain(object):
    u"""一条没有分支的关节链。

    构造时从根关节向下收集，遇到分支立即报错——链就该是一条线，
    有分支说明它其实是两套结构，应该分开处理。
    """

    def __init__(self, root):
        u"""从根关节收集整条链。

        Args:
            root (str): 链的根关节。

        Raises:
            RuntimeError: 关节不存在，或链在中途出现分支。
            TypeError: 根节点不是 joint。
        """

        if not cmds.objExists(root):
            raise RuntimeError(u"关节不存在：{}".format(root))

        if cmds.nodeType(root) != "joint":
            raise TypeError(u"{} 不是 joint 节点。".format(root))

        self.root = Jnt(root)
        self.joints = self._collect(root)

    def __len__(self):
        return len(self.joints)

    def __repr__(self):
        return "<JntChain {} joints, root={}>".format(len(self.joints), self.root.name)

    @staticmethod
    def _collect(root):
        u"""从根关节一路向下收集，遇到分支报错。"""

        joints = [Jnt(root)]
        current = root

        while True:
            children = cmds.listRelatives(current, children=True, type="joint") or []

            if not children:
                return joints

            if len(children) > 1:
                raise RuntimeError(
                    u"链在 {} 处出现 {} 个分支，不是单链。".format(
                        current,
                        len(children)
                    )
                )

            current = children[0]
            joints.append(Jnt(current))

    # ------------------------------------------------------------------
    # 查询
    # ------------------------------------------------------------------

    def get_joints(self):
        u"""返回链上的关节，从根到叶。"""

        return list(self.joints)

    def get_names(self):
        u"""返回链上每个关节的名称，从根到叶。"""

        return [jnt.name for jnt in self.joints]

    # ------------------------------------------------------------------
    # 创建
    # ------------------------------------------------------------------

    @classmethod
    def create_chain(cls, points, names=None, parent=None, radius=None):
        u"""按点位创建一条链。

        Args:
            points (list): 世界坐标列表，按从根到叶的顺序。
            names (list): 关节名称；None 时自动生成 jnt_001、jnt_002……
            parent (str): 第一个关节的父节点。
            radius (float): 统一显示半径。

        Returns:
            JntChain: 新建的链。

        Raises:
            ValueError: points 为空，或 names 数量与 points 不一致。
        """

        if not points:
            raise ValueError(u"points 不能为空。")

        if names is None:
            names = [
                "jnt_{:03d}".format(index + 1)
                for index in range(len(points))
            ]

        if len(names) != len(points):
            raise ValueError(
                u"names 数量必须与 points 一致：{} != {}".format(
                    len(names),
                    len(points)
                )
            )

        parent_node = parent

        for point, name in zip(points, names):
            jnt = Jnt.create_jnt(
                name,
                position=point,
                parent=parent_node,
                radius=radius
            )
            parent_node = jnt.name

        return cls(names[0])

    # ------------------------------------------------------------------
    # 编辑
    # ------------------------------------------------------------------

    def insert(self, name, position=None, before=None):
        u"""在链中插入一个关节。

        默认追加到链尾；指定 before 时插到该关节之前，并把 before 接到新关节下面，
        保证链不断开。

        Args:
            name (str): 新关节名称。
            position (tuple): 世界位置；None 表示与插入点重合。
            before (str): 插到哪个关节之前。

        Returns:
            Jnt: 新关节。

        Raises:
            ValueError: before 不在当前链上。
        """

        if before is None:
            last = self.joints[-1]

            if position is None:
                position = cmds.xform(
                    last.name,
                    query=True,
                    worldSpace=True,
                    translation=True
                )

            jnt = Jnt.create_jnt(name, position=position, parent=last.name)
            self.joints.append(jnt)
            return jnt

        names = self.get_names()

        if before not in names:
            raise ValueError(u"{} 不在当前链上。".format(before))

        parent = cmds.listRelatives(before, parent=True)
        jnt = Jnt.create_jnt(
            name,
            position=position,
            parent=parent[0] if parent else None
        )

        # 把 before 挂到新关节下，链才连续
        cmds.parent(before, jnt.name, absolute=True)

        self.joints.insert(names.index(before), jnt)
        return jnt

    def remove(self, name, keep_children=True):
        u"""删除链上的一个关节。

        删除后子关节会重挂到上一级，链仍然连续（位置保持不变）。

        Args:
            name (str): 要删除的关节。
            keep_children (bool): 是否保留子关节。

        Raises:
            ValueError: 关节不在当前链上。
        """

        names = self.get_names()

        if name not in names:
            raise ValueError(u"{} 不在当前链上。".format(name))

        Jnt(name).delete_jnt(keep_children=keep_children)
        del self.joints[names.index(name)]

    def rename(self, names):
        u"""按顺序重命名整条链。

        名称由调用方生成（通常用 Name），这里只负责顺序和冲突检查。

        Args:
            names (list): 与链长度一致的名称列表。

        Raises:
            ValueError: 数量不一致，或目标名称已被其他节点占用。
        """

        if len(names) != len(self.joints):
            raise ValueError(
                u"names 数量必须与链长度一致：{} != {}".format(
                    len(names),
                    len(self.joints)
                )
            )

        current_names = set(self.get_names())

        for new_name in names:
            if cmds.objExists(new_name) and new_name not in current_names:
                raise ValueError(u"名称已被占用：{}".format(new_name))

        for jnt, new_name in zip(self.joints, names):
            cmds.rename(jnt.name, new_name)
            jnt.name = new_name

    # ------------------------------------------------------------------
    # 镜像
    # ------------------------------------------------------------------

    def mirror(self, search=None, replace=None):
        u"""镜像整条链。

        使用 Maya 的 mirrorJoint，jointOrient 会一并镜像。

        Args:
            search (str): 名称中需要替换的片段，例如 lf。
            replace (str): 替换成的片段，例如 rt。

        Returns:
            JntChain: 镜像出来的新链。
        """

        kwargs = {
            "mirrorYZ": True,
            "mirrorBehavior": True,
        }

        if search and replace:
            kwargs["searchReplace"] = (search, replace)

        result = cmds.mirrorJoint(self.root.name, **kwargs)

        return JntChain(result[0])
