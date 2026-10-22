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


# 控制器层级，从内到外排列。
# create_hierarchy 会按这个顺序，一层层把 ctrl 往外包。
hierarchy = ("offset", "connect", "space", "driven", "zero")

# 形状库里的曲线都按 X+ 朝向制作。
# 其他朝向不需要另做一套形状，直接把这些 CV 旋转过去即可。
axis_rotation = {
    "X+": (0.0, 0.0, 0.0),
    "X-": (0.0, 180.0, 0.0),
    "Y+": (0.0, 0.0, 90.0),
    "Y-": (0.0, 0.0, -90.0),
    "Z+": (0.0, -90.0, 0.0),
    "Z-": (0.0, 90.0, 0.0),
}


def _rotate_point(point, degrees):
    u"""按 XYZ 欧拉角旋转一个点。

    Maya 的旋转顺序是 X → Y → Z，这里按同样顺序依次套用三个旋转矩阵。
    """

    rad_x, rad_y, rad_z = [math.radians(value) for value in degrees]
    x, y, z = point

    # 绕 X 轴旋转：Y / Z 变化
    y, z = (
        y * math.cos(rad_x) - z * math.sin(rad_x),
        y * math.sin(rad_x) + z * math.cos(rad_x)
    )

    # 绕 Y 轴旋转：X / Z 变化
    x, z = (
        x * math.cos(rad_y) + z * math.sin(rad_y),
        -x * math.sin(rad_y) + z * math.cos(rad_y)
    )

    # 绕 Z 轴旋转：X / Y 变化
    x, y = (
        x * math.cos(rad_z) - y * math.sin(rad_z),
        x * math.sin(rad_z) + y * math.cos(rad_z)
    )

    return x, y, z


class Ctrl(object):
    u"""单个 Maya 控制器。"""

    # 形状库目录：从本文件往上三层到包根，再进 resources。
    # core/rigging/ctrl_utils.py -> core -> muziRigTool
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

        只做引用，不创建节点。要创建请用 create_ctrl()。

        Args:
            name (str): 控制器名称。

        Raises:
            RuntimeError: 节点不存在。
            TypeError: 节点不是 transform。
        """

        if not cmds.objExists(name):
            raise RuntimeError(u"控制器不存在：{}".format(name))

        # 控制器必须是 transform；curve / joint 之类的节点不能当控制器用。
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

        形状必须最先设置：set_shape 会删掉旧 shape 再建新的，
        如果先设颜色或大小，换形状之后这些显示设置会全部丢失。

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

        # 用 createNode 而不是 cmds.circle 等命令：
        # createNode 不会改变当前选择，也不会自动挂到别的节点下面。
        cmds.createNode("transform", name=name)

        ctrl = cls(name)

        # 顺序不能调换，理由见 docstring。
        ctrl.set_shape(shape)
        ctrl.set_color(color)
        ctrl.set_size(size)
        ctrl.set_axis(axis)

        # 匹配目标放在形状设置之后：形状是本地数据，不影响位置。
        if target is not None:
            ctrl.match_transform(target)

        if hierarchy:
            ctrl.create_hierarchy(sub_ctrl=True, sub_shape=shape,
                         sub_color=color, sub_size=size*0.7)

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
        u"""返回控制器下的所有曲线形状。

        noIntermediate=True 用来排除曲线自带的 intermediate shape，
        否则同一个形状会被返回两次。
        """

        return cmds.listRelatives(
            self.name,
            shapes=True,
            noIntermediate=True
        ) or []

    def set_shape(self, shape_name):
        u"""替换控制器形状。

        一个控制器可以由多条曲线组成（例如十字 + 外圈），
        所以 JSON 里是一个列表，每条曲线单独创建。

        Args:
            shape_name (str): 形状库名称。
        """

        data = self.load_shape(shape_name)

        # 先删掉旧形状，避免新旧重叠。
        for old_shape in self.get_shapes():
            cmds.delete(old_shape)

        for entry in data:
            points = entry["points"]

            # JSON 里的 points 是扁平数组 [x, y, z, x, y, z, ...]，
            # 每三个一组还原成一个坐标点。
            xyz = [
                (points[index], points[index + 1], points[index + 2])
                for index in range(0, len(points), 3)
            ]

            curve = cmds.curve(
                point=xyz,
                degree=entry.get("degree", 3)
            )

            # 周期曲线（圆环、方形等闭合形状）不能用 cmds.curve 的 knot 参数直接创建，
            # Maya 会报「控制点太少」。先建开放曲线，再用 closeCurve 转成周期曲线。
            if entry.get("periodic"):
                cmds.closeCurve(
                    curve,
                    ch=False,
                    preserveShape=True,
                    replaceOriginal=True
                )

            # 曲线创建时是一个独立 transform，
            # 这里把它的 shape 移到控制器下面，再删掉多余的空 transform。
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

        # Maya 的 override color 索引固定是 0 ~ 31。
        if not 0 <= color <= 31:
            raise ValueError(u"color 必须在 0 ~ 31 之间，收到：{}".format(color))

        for shape in self.get_shapes():
            cmds.setAttr(shape + ".overrideEnabled", 1)
            cmds.setAttr(shape + ".overrideColor", color)

    def set_size(self, size):
        u"""按倍率缩放形状的 CV。

        只缩放曲线点，不修改 transform 的 scale。
        如果改 scale，控制器下方的子物体也会跟着变大，这不是想要的效果。

        Args:
            size (float): 缩放倍率。
        """

        if size <= 0:
            raise ValueError(u"size 必须大于 0，收到：{}".format(size))

        for shape in self.get_shapes():
            # 逐个 CV 读写坐标，坐标是 objectSpace（相对于控制器自身）。
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

        和 set_size 同理：旋转曲线点而不是 transform，
        这样控制器的 rotate 保持为 0，动画数据从干净的零值开始。

        Args:
            axis (str): X+ / X- / Y+ / Y- / Z+ / Z-。

        Raises:
            ValueError: axis 不在支持范围内。
        """

        if axis not in axis_rotation:
            raise ValueError(
                u"axis 只能是 {}，收到：{}".format(
                    " / ".join(axis_rotation),
                    axis
                )
            )

        rotation = axis_rotation[axis]

        # X+ 是基准，不需要旋转，直接返回省一次 CV 遍历。
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

        从 ctrl 开始，由内向外一层层包：
        ctrl → offset → connect → space → driven → zero

        之所以从内往外建：每建一层，只需要把「当前最外层」挂到「新组」下面，
        逻辑是单向的；如果从外往里建，每次都要去找内层的父节点。

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

        for layer in hierarchy:
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
        u"""确保 child 的父级是指定层的组。

        「确保」= 有就复用、没有就建、挂错了就纠正，
        所以这个方法执行一次和十次的结果完全一样。
        """

        # 组名始终从主控制器名生成。
        # 不能写成 child.replace(...)：第二次循环时 child 已经是 offset_xxx，
        # 里面已经没有 "ctrl_" 了，替换会失效。
        group_name = self.name.replace("ctrl_", layer + "_", 1)

        if not cmds.objExists(group_name):
            # 组不存在：新建一个空组，并对齐到当前节点，保证不动位置。
            group = cmds.group(empty=True, name=group_name)
            cmds.matchTransform(group, child)
        else:
            # 组已存在：直接复用，不重复创建。
            group = group_name

        current_parent = cmds.listRelatives(child, parent=True)

        # 父级不是这个组时才重新挂接。
        # absolute=True 保证挂接过程中世界位置不变。
        if not current_parent or current_parent[0] != group:
            cmds.parent(child, group, absolute=True)

        return group

    def _ensure_output(self):
        u"""确保 ctrl 下方有一个 output 组。

        output 用来放子物体。它和 subctrl 是兄弟关系：
        subctrl 被隐藏时，output 下面的物体不会被一起隐藏。
        """

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

        为什么是连接而不是父子关系：
        父子关系下，隐藏 subctrl 会连带隐藏它下面的所有子物体；
        兄弟 + 属性连接则只共享变换，隐藏互不影响。

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
            # hierarchy=False：subctrl 只是 ctrl 下面的一层，不需要自己再包八层。
            sub = Ctrl.create_ctrl(
                sub_name,
                shape=shape,
                color=color,
                size=size,
                hierarchy=False
            )
            cmds.parent(sub.name, self.name, absolute=True)

        # 确保 output 已经存在，否则下面的连接没有目标。
        output_name = self._ensure_output()

        # 把 subctrl 的变换实时传给 output。
        # 先判断是否已经连过，避免重复执行时反复连接产生警告。
        for attribute in ("translate", "rotate", "scale", "rotateOrder"):
            source = sub.name + "." + attribute
            target = output_name + "." + attribute

            if not cmds.isConnected(source, target):
                cmds.connectAttr(source, target, force=True)

        return sub
