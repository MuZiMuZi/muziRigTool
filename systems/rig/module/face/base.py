# coding=utf-8
u"""面部绑定模块基类。

面部和身体的差别，决定了这里多出来的东西：

    控制器用小尺寸                    脸上空间小，控制器要一眼能认
    控制器 → 关节走 locator 对        不直接约束 output：
                                     控制器层级里还有 zero / driven /
                                     space / connect，直接约束会把
                                     世界位置关系一起锁死
    曲线由定位器生成                  眉毛、眼皮的驱动曲线不手画，
                                     按 face_guide.ma 的定位器现建

locator 对的来历（16-03 与课程 connect_facial_joint.py）：

    ctrl.output ──parentConstraint──→ loc_..._driver
                                        │ 连 translate / rotate
                                        ▼
                                     loc_..._driven
                                        │ parentConstraint
                                        ▼
                                     关节

中间这两个 locator 只做「传值」：
    - driver 跟随控制器，driven 复制 driver 的通道值
    - 关节约束 driven，而不是约束控制器
    - 控制器换父级、或上层带动时，只传数值，不卷世界矩阵

每个模块拥有自己的 jnt / ctrl 总组（来自 RigModule）。
"""

from maya import cmds

from .....core.attr_utils import Attr
from .....core.ctrl_utils import Ctrl
from .....core.name_utils import Name
from ..base import RigModule


class FaceModule(RigModule):
    u"""面部模块基类：控制器风格 + 控制器到关节的连接 + 曲线工具。"""

    # 面部控制器默认尺寸：比身体小一个量级，避免挡住模型。
    default_size = 2.0
    default_color = 17

    def __init__(self, module, side="md", guides=None,
                 jnt_parent=None, ctrl_parent=None):
        super().__init__(
            module=module,
            side=side,
            guides=guides,
            jnt_parent=jnt_parent,
            ctrl_parent=ctrl_parent
        )

        # 本模块建的连接节点（删除时统一清理）。
        self.connection_nodes = []

    # ------------------------------------------------------------------
    # 对齐
    # ------------------------------------------------------------------

    @staticmethod
    def copy_world_transform(source, target, position=True, rotation=True):
        u"""复制世界位置 / 旋转。

        不能用 cmds.matchTransform：模板定位器带 rotatePivot 偏移，
        matchTransform 会按枢轴对齐，结果落在原点 + 枢轴的位置。
        直接读世界平移 / 旋转再写回去才稳。

        Args:
            source (str): 取变换的对象（模板定位器）。
            target (str): 被对齐的对象（关节 / 控制器 / zero 组）。
            position (bool): 是否复制位置。
            rotation (bool): 是否复制旋转。
        """

        if position:
            cmds.xform(
                target,
                worldSpace=True,
                translation=cmds.xform(
                    source, query=True, worldSpace=True, translation=True
                )
            )

        if rotation:
            cmds.xform(
                target,
                worldSpace=True,
                rotation=cmds.xform(
                    source, query=True, worldSpace=True, rotation=True
                )
            )

    # ------------------------------------------------------------------
    # 控制器
    # ------------------------------------------------------------------

    def create_face_ctrl(self, name, target=None, shape="circle",
                         color=None, size=None, axis="Y+",
                         hierarchy=True, match_rotation=False):
        u"""创建面部控制器。

        默认不继承目标旋转：面部关节朝向常常是斜的，
        控制器跟着歪掉之后，动画师反而不好拖。

        Returns:
            Ctrl: 控制器对象。
        """

        ctrl = Ctrl.create_ctrl(
            name,
            shape=shape,
            color=self.default_color if color is None else color,
            size=self.default_size if size is None else size,
            axis=axis,
            hierarchy=hierarchy,
            match_position=False,
            match_rotation=False,
            match_scale=False
        )

        if target is not None:
            # 对齐最外层的 zero 组，控制器在组内部保持零偏移。
            # 对齐 ctrl 本身会把变换写进组内的局部值，之后组一动就翻倍。
            zero_grp = name.replace("ctrl_", "zero_", 1)
            anchor = zero_grp if (
                hierarchy and cmds.objExists(zero_grp)
            ) else ctrl.name

            self.copy_world_transform(
                target, anchor,
                position=True,
                rotation=match_rotation
            )

        return ctrl

    # ------------------------------------------------------------------
    # 属性
    # ------------------------------------------------------------------

    def add_float(self, node, name, default=0.0, min_value=None,
                  max_value=None, keyable=True):
        u"""给节点加一个浮点属性（已存在则复用）。

        Returns:
            str: 属性全名。
        """

        attr = Attr(node)

        if not attr.attr_exists(name):
            attr.add_attr(
                name,
                attr_type="double",
                default=default,
                min_value=min_value,
                max_value=max_value
            )

        plug = "{}.{}".format(node, name)

        if keyable is not None:
            cmds.setAttr(plug, keyable=keyable)

        return plug

    # ------------------------------------------------------------------
    # 控制器 → 关节
    # ------------------------------------------------------------------

    def connect_ctrl_to_joint(self, ctrl, joint, name=None,
                              parent_ctrl=None):
        u"""用 locator 对把控制器接到关节上。

        Args:
            ctrl (Ctrl): 源头控制器。
            joint (str): 目标关节。
            name (str): 关节侧约束名；None 交给 Maya 自动命名。
            parent_ctrl (Ctrl): 上层控制器；给了就把两个 zero 组
                挂到上层控制器对应的 locator 下，形成层级联动。

        Returns:
            dict: driver / driven / zero / constraint 节点名。
        """

        parsed = Name(name=ctrl.name)

        driver = Name(
            type="loc", side=parsed.side, part=parsed.part,
            function="driver", index=parsed.index
        ).name
        driven = Name(
            type="loc", side=parsed.side, part=parsed.part,
            function="driven", index=parsed.index
        ).name

        # 同名旧节点先清掉：重建时旧模块的 locator 在世界层，
        # 不一定跟着 jnt / ctrl 组一起删掉，留着会抢名字。
        for node in (
            driver, driven,
            driver.replace("loc_", "zero_", 1),
            driven.replace("loc_", "zero_", 1),
        ):
            if cmds.objExists(node):
                cmds.delete(node)

        if name and cmds.objExists(name):
            cmds.delete(name)

        zero_driver = cmds.createNode(
            "transform", name=driver.replace("loc_", "zero_", 1)
        )
        zero_driven = cmds.createNode(
            "transform", name=driven.replace("loc_", "zero_", 1)
        )

        # 两个 zero 组各自对齐到控制器，保证初始偏移为零。
        # 注意：不能写成 matchTransform(zero_driver, zero_driven, ctrl)——
        # Maya 只把第一个对象对齐到最后一个源，第二个会留在原点。
        for zero in (zero_driver, zero_driven):
            self.copy_world_transform(
                ctrl.name, zero, position=True, rotation=True
            )

        loc_driver = cmds.spaceLocator(name=driver)[0]
        loc_driven = cmds.spaceLocator(name=driven)[0]

        # parent 默认会保世界位置，locator 建在原点后挂到 zero 组下
        # 会留下一个反向偏移；挂接后把它清零，让它和 zero 重合。
        # 用短名操作：spaceLocator 在重名时可能返回带竖线的全路径。
        for locator, zero in (
            (loc_driver, zero_driver),
            (loc_driven, zero_driven),
        ):
            cmds.parent(locator, zero)

            short_name = locator.split("|")[-1]

            cmds.setAttr(short_name + ".translate", 0.0, 0.0, 0.0)
            cmds.setAttr(short_name + ".rotate", 0.0, 0.0, 0.0)
            cmds.setAttr(short_name + ".scale", 1.0, 1.0, 1.0)

        cmds.parentConstraint(
            ctrl.get_output(), loc_driver, maintainOffset=True
        )

        for attribute in ("translate", "rotate"):
            cmds.connectAttr(
                loc_driver + "." + attribute,
                loc_driven + "." + attribute,
                force=True
            )

        constraint = cmds.parentConstraint(
            loc_driven, joint, maintainOffset=True, **(
                {"name": name} if name else {}
            )
        )[0]

        # 上层控制器存在时，把本层 zero 组挂到上层 locator 下：
        # 动上层控制器 → 下层跟着动，且下层自己的偏移不丢。
        if parent_ctrl is not None:
            parent_parsed = Name(name=parent_ctrl.name)
            parent_driver = Name(
                type="loc", side=parent_parsed.side,
                part=parent_parsed.part, function="driver",
                index=parent_parsed.index
            ).name
            parent_driven = Name(
                type="loc", side=parent_parsed.side,
                part=parent_parsed.part, function="driven",
                index=parent_parsed.index
            ).name

            if cmds.objExists(parent_driver):
                cmds.parent(zero_driver, parent_driver)
            if cmds.objExists(parent_driven):
                cmds.parent(zero_driven, parent_driven)

        record = {
            "driver": loc_driver,
            "driven": loc_driven,
            "zero_driver": zero_driver,
            "zero_driven": zero_driven,
            "constraint": constraint,
        }

        self.connection_nodes.extend(
            [loc_driver, loc_driven, zero_driver, zero_driven, constraint]
        )

        return record

    # ------------------------------------------------------------------
    # 曲线
    # ------------------------------------------------------------------

    def curve_shape(self, curve):
        u"""返回曲线的 shape 节点。

        pointOnCurveInfo 的 inputCurve 必须连 shape，不能连 transform。
        """

        if not cmds.objExists(curve):
            raise RuntimeError(u"曲线不存在：{}".format(curve))

        shapes = cmds.listRelatives(curve, shapes=True, type="nurbsCurve")

        if not shapes:
            raise RuntimeError(u"{} 不是 NURBS 曲线。".format(curve))

        return shapes[0]

    def point_on_curve(self, curve, parameter):
        u"""取曲线上某个参数位置的世界坐标。"""

        return cmds.pointOnCurve(
            curve, parameter=parameter, position=True
        )

    def nearest_parameter(self, curve, position):
        u"""求点在曲线上的最近参数（0~1），算完即删临时节点。"""

        shape = self.curve_shape(curve)
        node = cmds.createNode("nearestPointOnCurve")

        try:
            cmds.connectAttr(shape + ".worldSpace[0]", node + ".inputCurve")
            cmds.setAttr(node + ".inPosition", *position)

            return float(cmds.getAttr(node + ".parameter"))
        finally:
            cmds.delete(node)

    def create_curve_from_locators(self, name, locators, degree=3,
                                   parent=None):
        u"""按定位器的世界坐标生成曲线。

        眉毛 / 眼皮的驱动曲线都从 face_guide.ma 的定位器来：
        定位器只提供 CV 位置，曲线本身是新建的，之后可以重建或直接拖 CV。

        Args:
            name (str): 曲线名。
            locators (list): 定位器名，按 CV 顺序。
            degree (int): 曲线阶数。
            parent (str): 建好后挂到哪个组。

        Returns:
            str: 曲线 transform 名。
        """

        if not locators:
            raise RuntimeError(u"生成曲线需要至少 2 个定位器")

        points = [
            cmds.xform(node, query=True, worldSpace=True, translation=True)
            for node in locators
        ]

        curve = cmds.curve(point=points, degree=degree, name=name)

        if parent and cmds.objExists(parent):
            cmds.parent(curve, parent, absolute=True)

        return curve

    # ------------------------------------------------------------------
    # 清理
    # ------------------------------------------------------------------

    def delete_connection_nodes(self):
        u"""删除本模块建的所有连接节点（先删约束再删 locator）。"""

        for node in reversed(self.connection_nodes):
            if cmds.objExists(node):
                cmds.delete(node)

        self.connection_nodes = []
