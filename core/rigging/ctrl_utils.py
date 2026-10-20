# coding=utf-8
u"""Controller 基础操作。

层级（从外到内）：

    zero → driven → space → connect → offset → ctrl
                                              ├── subctrl
                                              └── output

    subctrl 与 output 是兄弟，隐藏 subctrl 不会影响 output 下的子物体；
    subctrl 的变换通过属性连接传给 output。

约定：

    Ctrl(name)              引用已存在的控制器
    Ctrl.create_ctrl(...)   显式创建

    形状从 resources/controller_shapes/*.json 读取
    大小通过缩放 CV，不改变 transform 的 scale
    轴向通过旋转 CV，不改变 transform 的 rotate
"""

import json
import math
import os

import maya.cmds as cmds


# 控制器层级，从内到外。
LAYERS = ("offset", "connect", "space", "driven", "zero")

# 形状的基准朝向是 X+；其他轴向通过旋转 CV 得到。
AXIS_ROTATION = {
    "X+": (0.0, 0.0, 0.0),
    "X-": (0.0, 180.0, 0.0),
    "Y+": (0.0, 0.0, 90.0),
    "Y-": (0.0, 0.0, -90.0),
    "Z+": (0.0, -90.0, 0.0),
    "Z-": (0.0, 90.0, 0.0),
}


def _rotate_point(point, degrees):
    u"""按 XYZ 欧拉角旋转一个点。"""

    rad_x, rad_y, rad_z = [math.radians(value) for value in degrees]
    x, y, z = point

    # 绕 X
    y, z = y * math.cos(rad_x) - z * math.sin(rad_x), y * math.sin(rad_x) + z * math.cos(rad_x)
    # 绕 Y
    x, z = x * math.cos(rad_y) + z * math.sin(rad_y), -x * math.sin(rad_y) + z * math.cos(rad_y)
    # 绕 Z
    x, y = x * math.cos(rad_z) - y * math.sin(rad_z), x * math.sin(rad_z) + y * math.cos(rad_z)

    return x, y, z


class Ctrl(object):
    u"""单个 Maya 控制器。"""

    # 形状库目录。
    shape_dir = os.path.join(
        os.path.dirname(
            os.path.dirname(
                os.path.dirname(
                    os.path.abspath(__file__)
                )
            )
        ),
        "resources",
        "controller_shapes"
    )

    def __init__(self, name):
        u"""引用一个已经存在的控制器。

        Args:
            name (str): 控制器名称。

        Raises:
            RuntimeError: 节点不存在。
            TypeError: 节点不是 transform。
        """

        if not cmds.objExists(name):
            raise RuntimeError(u"控制器不存在：{}".format(name))

        if cmds.nodeType(name) != "transform":
            raise TypeError(u"{} 不是 transform 节点。".format(name))

        self.name = name

    def __repr__(self):
        return "<Ctrl {}>".format(self.name)

    # ------------------------------------------------------------------
    # 创建
    # ------------------------------------------------------------------

    @classmethod
    def create_ctrl(cls, name, shape="circle", color=17, size=1.0,
                    axis="X+", target=None, hierarchy=True):
        u"""创建一个控制器。

        执行顺序固定：形状 → 颜色 → 大小 → 轴向 → 匹配 → 层级。
        形状必须最先设置，因为替换形状会覆盖之前的显示设置。

        Args:
            name (str): 控制器名称，必须尚未存在。
            shape (str): 形状库名称，例如 circle / square / cube。
            color (int): Maya override color 索引。
            size (float): 显示大小倍率。
            axis (str): 形状朝向，X+ / X- / Y+ / Y- / Z+ / Z-。
            target (str): 对齐目标；None 表示不匹配。
            hierarchy (bool): 是否创建完整控制器层级。

        Returns:
            Ctrl: 新建的控制器。
        """

        if not name:
            raise ValueError(u"控制器名称不能为空。")

        if cmds.objExists(name):
            raise RuntimeError(u"节点已经存在：{}".format(name))

        cmds.createNode("transform", name=name)

        ctrl = cls(name)
        ctrl.set_shape(shape)
        ctrl.set_color(color)
        ctrl.set_size(size)
        ctrl.set_axis(axis)

        if target is not None:
            ctrl.match_transform(target)

        if hierarchy:
            ctrl.create_hierarchy()

        return ctrl

    # ------------------------------------------------------------------
    # 形状
    # ------------------------------------------------------------------

    @classmethod
    def load_shape(cls, shape_name):
        u"""从形状库读取曲线数据。

        Args:
            shape_name (str): 形状名称。

        Returns:
            list: 每条曲线的 points / degree / periodic / knot。

        Raises:
            ValueError: 形状文件不存在。
        """

        path = os.path.join(cls.shape_dir, shape_name + ".json")

        if not os.path.exists(path):
            raise ValueError(u"形状不存在：{}".format(shape_name))

        with open(path, "r") as handle:
            return json.load(handle)

    def get_shapes(self):
        u"""返回控制器下的所有曲线形状。"""

        return cmds.listRelatives(
            self.name,
            shapes=True,
            noIntermediate=True
        ) or []

    def set_shape(self, shape_name):
        u"""替换控制器形状。

        Args:
            shape_name (str): 形状库名称。
        """

        data = self.load_shape(shape_name)

        for old_shape in self.get_shapes():
            cmds.delete(old_shape)

        for entry in data:
            points = entry["points"]
            xyz = [
                (points[index], points[index + 1], points[index + 2])
                for index in range(0, len(points), 3)
            ]

            curve = cmds.curve(
                point=xyz,
                degree=entry.get("degree", 3)
            )

            # 周期曲线不能直接带 knot 创建，先建开放曲线再闭合。
            if entry.get("periodic"):
                cmds.closeCurve(
                    curve,
                    ch=False,
                    preserveShape=True,
                    replaceOriginal=True
                )

            shape = cmds.listRelatives(curve, shapes=True)[0]
            cmds.parent(shape, self.name, shape=True, relative=True)
            cmds.delete(curve)

    # ------------------------------------------------------------------
    # 显示
    # ------------------------------------------------------------------

    def set_color(self, color):
        u"""设置 override color。

        Args:
            color (int): Maya override color 索引。

        Raises:
            ValueError: color 不是 0~31 的整数。
        """

        color = int(color)

        if not 0 <= color <= 31:
            raise ValueError(u"color 必须在 0 ~ 31 之间，收到：{}".format(color))

        for shape in self.get_shapes():
            cmds.setAttr(shape + ".overrideEnabled", 1)
            cmds.setAttr(shape + ".overrideColor", color)

    def set_size(self, size):
        u"""按倍率缩放形状的 CV。

        只缩放曲线点，不修改 transform 的 scale，避免影响子物体。

        Args:
            size (float): 缩放倍率。
        """

        if size <= 0:
            raise ValueError(u"size 必须大于 0，收到：{}".format(size))

        for shape in self.get_shapes():
            for cv in cmds.ls(shape + ".cv[*]", flatten=True):
                position = cmds.xform(
                    cv,
                    query=True,
                    translation=True,
                    objectSpace=True
                )
                cmds.xform(
                    cv,
                    translation=[value * size for value in position],
                    objectSpace=True
                )

    def set_axis(self, axis):
        u"""按绝对轴向旋转形状的 CV。

        Args:
            axis (str): X+ / X- / Y+ / Y- / Z+ / Z-。

        Raises:
            ValueError: axis 不在支持范围内。
        """

        if axis not in AXIS_ROTATION:
            raise ValueError(
                u"axis 只能是 {}，收到：{}".format(
                    " / ".join(AXIS_ROTATION),
                    axis
                )
            )

        rotation = AXIS_ROTATION[axis]

        if rotation == (0.0, 0.0, 0.0):
            return

        for shape in self.get_shapes():
            for cv in cmds.ls(shape + ".cv[*]", flatten=True):
                position = cmds.xform(
                    cv,
                    query=True,
                    translation=True,
                    objectSpace=True
                )
                cmds.xform(
                    cv,
                    translation=_rotate_point(position, rotation),
                    objectSpace=True
                )

    def match_transform(self, target, position=True, rotation=True, scale=True):
        u"""把控制器对齐到目标节点。"""

        cmds.matchTransform(
            self.name,
            target,
            position=position,
            rotation=rotation,
            scale=scale
        )

    # ------------------------------------------------------------------
    # 层级
    # ------------------------------------------------------------------

    def create_hierarchy(self, sub_ctrl=True, sub_shape="circle",
                         sub_color=17, sub_size=0.7):
        u"""创建完整控制器层级。

        从 ctrl 向外依次包上 offset / connect / space / driven / zero，
        然后在 ctrl 下方创建 subctrl 与 output。

        重复执行安全：已存在的层级会被复用，不会重复包裹。

        Args:
            sub_ctrl (bool): 是否创建 subctrl。
            sub_shape (str): subctrl 的形状。
            sub_color (int): subctrl 的颜色。
            sub_size (float): subctrl 的大小。

        Returns:
            str: 最外层的 zero 节点名称。
        """

        current = self.name

        for layer in LAYERS:
            group = self._ensure_parent(current, layer)
            current = group

        if sub_ctrl:
            self.create_sub_ctrl(
                shape=sub_shape,
                color=sub_color,
                size=sub_size
            )

        self._ensure_output()

        return current

    def _ensure_parent(self, child, layer):
        u"""确保 child 的父级是名为 <layer>_... 的组。"""

        # 组名始终从主控制器名生成，不能跟着 child 变。
        group_name = self.name.replace("ctrl_", layer + "_", 1)

        if not cmds.objExists(group_name):
            group = cmds.group(empty=True, name=group_name)
            cmds.matchTransform(group, child)
        else:
            group = group_name

        current_parent = cmds.listRelatives(child, parent=True)

        if not current_parent or current_parent[0] != group:
            cmds.parent(child, group, absolute=True)

        return group

    def _ensure_output(self):
        u"""确保 ctrl 下方有一个 output 组。"""

        output_name = self.name.replace("ctrl_", "output_", 1)

        if not cmds.objExists(output_name):
            group = cmds.group(empty=True, name=output_name)
            cmds.matchTransform(group, self.name)
        else:
            group = output_name

        current_parent = cmds.listRelatives(group, parent=True)

        if not current_parent or current_parent[0] != self.name:
            cmds.parent(group, self.name, absolute=True)

        return group

    def create_sub_ctrl(self, shape="circle", color=17, size=0.7):
        u"""创建次级控制器，并把变换连接到 output。

        Args:
            shape (str): 形状名称。
            color (int): 颜色索引。
            size (float): 大小倍率。

        Returns:
            Ctrl: 次级控制器。
        """

        sub_name = self.name.replace("ctrl_", "subctrl_", 1)

        if cmds.objExists(sub_name):
            sub = Ctrl(sub_name)
        else:
            sub = Ctrl.create_ctrl(
                sub_name,
                shape=shape,
                color=color,
                size=size,
                hierarchy=False
            )
            cmds.parent(sub.name, self.name, absolute=True)

        output_name = self._ensure_output()

        for attribute in ("translate", "rotate", "scale", "rotateOrder"):
            source = sub.name + "." + attribute
            target = output_name + "." + attribute

            if not cmds.isConnected(source, target):
                cmds.connectAttr(source, target, force=True)

        return sub
