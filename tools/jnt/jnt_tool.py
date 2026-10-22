# coding=utf-8
u"""Jnt 工具（阶段一）。

只做不依赖曲线和蒙皮的部分：

    显示      轴向（选中 / 层级 / 全部）、朝向
    创建      吸附创建、创建子关节
    编辑      半径、缩放补偿、清除朝向
    约束      成对批量父约束

界面结构：

    ┌─ 目标 ────────────────────────┐
    │ 选中：jnt_001 (3 个)  [刷新]  │
    ├─ 显示 ────────────────────────┤
    │ 范围 [选中 ▼] [显示轴向] [隐藏]│
    │ [显示朝向] [隐藏朝向]          │
    ├─ 创建 ────────────────────────┤
    │ 半径 [1.0]                     │
    │ [吸附创建] [创建子关节]        │
    ├─ 编辑 ────────────────────────┤
    │ [☐ 缩放补偿] [清除朝向]        │
    ├─ 约束 ────────────────────────┤
    │ [批量父约束]                   │
    └───────────────────────────────┘
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.common import rename_utils
from ...core.deformation import skin_utils
from ...core.geometry import curve_utils
from ...core.rigging import constraint_utils
from ...core.rigging import jnt_utils
from ...core.rigging import snap_utils
from ...ui import theme


class JntTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""Jnt 工具窗口。"""

    def __init__(self, parent=None):
        super(JntTool, self).__init__(parent)

        self.setWindowTitle(u"Jnt 工具")
        self.resize(440, 620)

        self.build_ui()
        self.refresh()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"Jnt 工具"))
        layout.addWidget(theme.make_subtitle(
            u"关节显示、创建、半径与约束。"
        ))

        layout.addWidget(self.build_target_section())
        layout.addWidget(self.build_display_section())
        layout.addWidget(self.build_create_section())
        layout.addWidget(self.build_edit_section())
        layout.addWidget(self.build_skin_section())
        layout.addWidget(self.build_constraint_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_target_section(self):
        u"""目标区块。"""

        group = QtWidgets.QGroupBox(u"目标")
        layout = QtWidgets.QHBoxLayout(group)

        self.target_label = QtWidgets.QLabel(u"未选择关节")
        layout.addWidget(self.target_label, 1)

        self.refresh_button = QtWidgets.QPushButton(u"刷新")
        self.refresh_button.setStyleSheet(theme.button_style)
        self.refresh_button.clicked.connect(self.refresh)
        layout.addWidget(self.refresh_button)

        return group

    def build_display_section(self):
        u"""显示区块。"""

        group = QtWidgets.QGroupBox(u"显示")
        layout = QtWidgets.QVBoxLayout(group)

        row = QtWidgets.QHBoxLayout()

        row.addWidget(QtWidgets.QLabel(u"范围"))

        self.scope_combo = QtWidgets.QComboBox()
        self.scope_combo.addItem(u"选中", "selected")
        self.scope_combo.addItem(u"选中层级", "hierarchy")
        self.scope_combo.addItem(u"全部关节", "all")
        row.addWidget(self.scope_combo)

        self.show_axis_button = QtWidgets.QPushButton(u"显示轴向")
        self.show_axis_button.setStyleSheet(theme.button_style)
        self.show_axis_button.clicked.connect(lambda: self.set_axis(True))
        row.addWidget(self.show_axis_button)

        self.hide_axis_button = QtWidgets.QPushButton(u"隐藏轴向")
        self.hide_axis_button.setStyleSheet(theme.button_style)
        self.hide_axis_button.clicked.connect(lambda: self.set_axis(False))
        row.addWidget(self.hide_axis_button)

        layout.addLayout(row)

        return group

    def build_create_section(self):
        u"""创建区块。"""

        group = QtWidgets.QGroupBox(u"创建")
        layout = QtWidgets.QVBoxLayout(group)

        row = QtWidgets.QHBoxLayout()

        row.addWidget(QtWidgets.QLabel(u"New Jnt Radius"))

        self.radius_spin = QtWidgets.QDoubleSpinBox()
        self.radius_spin.setRange(0.01, 100.0)
        self.radius_spin.setValue(1.0)
        self.radius_spin.setSingleStep(0.1)
        row.addWidget(self.radius_spin)

        row.addStretch()
        layout.addLayout(row)

        button_row = QtWidgets.QHBoxLayout()

        self.snap_button = QtWidgets.QPushButton(u"吸附创建")
        self.snap_button.setStyleSheet(theme.button_style)
        self.snap_button.clicked.connect(self.create_snap_joints)
        button_row.addWidget(self.snap_button)

        self.child_button = QtWidgets.QPushButton(u"创建子关节")
        self.child_button.setStyleSheet(theme.button_style)
        self.child_button.clicked.connect(self.create_child_joints)
        button_row.addWidget(self.child_button)

        layout.addLayout(button_row)

        curve_row = QtWidgets.QHBoxLayout()

        self.curve_button = QtWidgets.QPushButton(u"曲线上建关节")
        self.curve_button.setStyleSheet(theme.button_style)
        self.curve_button.clicked.connect(self.create_joints_on_curve)
        curve_row.addWidget(self.curve_button)

        self.edge_button = QtWidgets.QPushButton(u"边上建关节")
        self.edge_button.setStyleSheet(theme.button_style)
        self.edge_button.clicked.connect(self.create_joints_on_edges)
        curve_row.addWidget(self.edge_button)

        layout.addLayout(curve_row)

        return group

    def build_edit_section(self):
        u"""编辑区块。"""

        group = QtWidgets.QGroupBox(u"编辑")
        layout = QtWidgets.QVBoxLayout(group)

        self.scale_compensate_check = QtWidgets.QCheckBox(u"缩放补偿")
        self.scale_compensate_check.clicked.connect(self.toggle_scale_compensate)
        layout.addWidget(self.scale_compensate_check)

        self.clear_orient_button = QtWidgets.QPushButton(u"清除朝向")
        self.clear_orient_button.setStyleSheet(theme.button_style)
        self.clear_orient_button.clicked.connect(self.clear_orient)
        layout.addWidget(self.clear_orient_button)

        return group

    def build_skin_section(self):
        u"""蒙皮区块。"""

        group = QtWidgets.QGroupBox(u"蒙皮")
        layout = QtWidgets.QVBoxLayout(group)

        hint = QtWidgets.QLabel(
            u"绑定：骨骼 + 模型（最后一个是模型）。"
            u"复制：多个模型，第一个是源。"
        )
        hint.setWordWrap(True)
        hint.setStyleSheet(theme.subtitle_style)
        layout.addWidget(hint)

        row = QtWidgets.QHBoxLayout()

        self.bind_skin_button = QtWidgets.QPushButton(u"绑定蒙皮")
        self.bind_skin_button.setStyleSheet(theme.button_style)
        self.bind_skin_button.clicked.connect(self.bind_skin)
        row.addWidget(self.bind_skin_button)

        self.copy_weight_button = QtWidgets.QPushButton(u"复制权重")
        self.copy_weight_button.setStyleSheet(theme.button_style)
        self.copy_weight_button.clicked.connect(self.copy_weights)
        row.addWidget(self.copy_weight_button)

        layout.addLayout(row)

        return group

    def build_constraint_section(self):
        u"""约束区块。"""

        group = QtWidgets.QGroupBox(u"约束")
        layout = QtWidgets.QVBoxLayout(group)

        self.constraint_button = QtWidgets.QPushButton(u"批量父约束（成对选择）")
        self.constraint_button.setStyleSheet(theme.button_style)
        self.constraint_button.clicked.connect(self.batch_parent_constraint)
        layout.addWidget(self.constraint_button)

        hint = QtWidgets.QLabel(
            u"按 driver1, driven1, driver2, driven2… 的顺序选择偶数个对象。"
        )
        hint.setWordWrap(True)
        hint.setStyleSheet(theme.subtitle_style)
        layout.addWidget(hint)

        return group

    # ------------------------------------------------------------------
    # 查询
    # ------------------------------------------------------------------

    @staticmethod
    def get_selected_joints():
        u"""返回选中的关节长名。"""

        selection = cmds.ls(selection=True, long=True) or []

        return [
            node for node in selection
            if cmds.nodeType(node) == "joint"
        ]

    @staticmethod
    def get_scope_joints(scope):
        u"""按范围返回关节。"""

        if scope == "all":
            return cmds.ls(type="joint", long=True) or []

        selected = JntTool.get_selected_joints()

        if scope == "selected":
            return selected

        # 选中层级：选中关节 + 所有子孙关节
        joints = []

        for node in selected:
            descendants = cmds.listRelatives(
                node,
                allDescendents=True,
                type="joint",
                fullPath=True
            ) or []

            for child in [node] + descendants:
                if child not in joints:
                    joints.append(child)

        return joints

    def refresh(self):
        u"""刷新目标信息。"""

        joints = self.get_selected_joints()

        if joints:
            self.target_label.setText(
                u"{}  ({} 个关节)".format(joints[0], len(joints))
            )
        else:
            self.target_label.setText(u"未选择关节")

    # ------------------------------------------------------------------
    # 显示
    # ------------------------------------------------------------------

    def set_axis(self, visible):
        u"""显示或隐藏轴向。"""

        scope = self.scope_combo.currentData()
        joints = self.get_scope_joints(scope)

        if not joints:
            self.status_label.setText(u"没有可处理的关节")
            return

        for node in joints:
            jnt = jnt_utils.Jnt(node)

            if visible:
                jnt.show_axis()
            else:
                jnt.hide_axis()

        self.status_label.setText(
            u"{} 轴向：{} 个关节".format(
                u"显示" if visible else u"隐藏", len(joints)
            )
        )

    # ------------------------------------------------------------------
    # 创建
    # ------------------------------------------------------------------

    @staticmethod
    def next_numbered_name(prefix):
        u"""返回第一个未被占用的编号名称。

        同一个物体上会反复吸附出很多关节点，固定从 001 开始必然撞名，
        所以每次都从场景现状往后找空位。

        Args:
            prefix (str): 名称前缀，例如 jnt_snap。

        Returns:
            str: 可用名称，例如 jnt_snap_004。
        """

        index = 1

        while True:
            name = "{}_{:03d}".format(prefix, index)

            if not cmds.objExists(name):
                return name

            index += 1

    @staticmethod
    def unique_name(name):
        u"""名称被占用时追加序号。

        Args:
            name (str): 期望的名称。

        Returns:
            str: 可用名称。
        """

        if not cmds.objExists(name):
            return name

        index = 1

        while True:
            candidate = "{}{:03d}".format(name, index)

            if not cmds.objExists(candidate):
                return candidate

            index += 1

    def create_snap_joints(self):
        u"""在选中物体或组件的世界位置创建关节。

        每个选中项建一个关节，名称从 jnt_snap_001 开始顺延，
        已经被占用的编号会自动跳过。
        """

        selection = cmds.ls(orderedSelection=True) or []

        if not selection:
            cmds.warning(u"请选择一个或以上的物体或组件。")
            return

        radius = self.radius_spin.value()
        created = []

        cmds.undoInfo(openChunk=True)

        try:
            for item in selection:
                position = snap_utils.get_item_world_position(item)

                if position is None:
                    continue

                name = self.next_numbered_name("jnt_snap")
                jnt = jnt_utils.Jnt.create_jnt(
                    name,
                    position=position,
                    radius=radius
                )
                created.append(jnt.name)
        except Exception as error:
            cmds.warning(str(error))
        finally:
            cmds.undoInfo(closeChunk=True)

        if created:
            cmds.select(created, replace=True)
            self.refresh()

        self.status_label.setText(u"吸附创建：{} 个关节".format(len(created)))

    def create_child_joints(self):
        u"""给选中对象创建同姿态的子关节。

        名称按「原名 + _child」生成，重名时自动加序号。
        """

        selection = cmds.ls(selection=True, long=True) or []

        if not selection:
            cmds.warning(u"请选择一个或以上的 Transform 或 Jnt。")
            return

        radius = self.radius_spin.value()
        created = []

        cmds.undoInfo(openChunk=True)

        try:
            for node in selection:
                short_name = rename_utils.get_short_name(node)
                child_name = "{}_child".format(short_name)

                if not child_name.startswith("jnt_"):
                    child_name = "jnt_{}".format(child_name)

                child_name = self.unique_name(child_name)

                jnt = jnt_utils.Jnt.create_jnt(
                    child_name,
                    target=node,
                    parent=node,
                    radius=radius
                )
                created.append(jnt.name)
        except Exception as error:
            cmds.warning(str(error))
        finally:
            cmds.undoInfo(closeChunk=True)

        if created:
            cmds.select(created, replace=True)
            self.refresh()

        self.status_label.setText(u"创建子关节：{} 个".format(len(created)))

    @staticmethod
    def numbered_names(prefix, count):
        u"""生成 count 个不冲突的编号名称。

        Args:
            prefix (str): 名称前缀。
            count (int): 需要几个。

        Returns:
            list: 名称列表，跳过已被占用的编号。
        """

        names = []
        index = 1

        while len(names) < count:
            name = "{}_{:03d}".format(prefix, index)

            if not cmds.objExists(name):
                names.append(name)

            index += 1

        return names

    def create_joints_on_curve(self):
        u"""按选中曲线的 CV 位置建关节链。

        每个 CV 一个关节，按曲线顺序串成链。
        """

        selection = cmds.ls(selection=True, long=True) or []

        if not selection:
            cmds.warning(u"请选择一条或多条 NURBS 曲线。")
            return

        radius = self.radius_spin.value()
        created = []

        cmds.undoInfo(openChunk=True)

        try:
            for curve in selection:
                try:
                    positions = curve_utils.get_curve_cv_positions(curve)
                except Exception as error:
                    cmds.warning(str(error))
                    continue

                if len(positions) < 2:
                    cmds.warning(u"曲线 CV 不足两个：{}".format(curve))
                    continue

                names = self.numbered_names("jnt_curve", len(positions))

                chain = jnt_utils.JntChain.create_chain(
                    positions,
                    names=names,
                    radius=radius
                )
                created.extend(chain.names)
        except Exception as error:
            cmds.warning(str(error))
        finally:
            cmds.undoInfo(closeChunk=True)

        if created:
            cmds.select(created, replace=True)
            self.refresh()

        self.status_label.setText(u"曲线上建关节：{} 个".format(len(created)))

    def create_joints_on_edges(self):
        u"""把选中的多边形边转成曲线，再按 CV 建关节链。

        临时曲线用完就删，只留关节。
        """

        radius = self.radius_spin.value()
        created = []
        curve = None

        cmds.undoInfo(openChunk=True)

        try:
            curve_name = self.next_numbered_name("crv_edge_jnt")
            curve = curve_utils.create_curve_from_selected_edges(curve_name)

            positions = curve_utils.get_curve_cv_positions(curve)

            if len(positions) < 2:
                cmds.warning(u"转换出的曲线 CV 不足两个。")
            else:
                names = self.numbered_names("jnt_edge", len(positions))

                chain = jnt_utils.JntChain.create_chain(
                    positions,
                    names=names,
                    radius=radius
                )
                created.extend(chain.names)
        except Exception as error:
            cmds.warning(str(error))
        finally:
            # 临时曲线用完删掉，不留在场景里
            if curve is not None and cmds.objExists(curve):
                cmds.delete(curve)

            cmds.undoInfo(closeChunk=True)

        if created:
            cmds.select(created, replace=True)
            self.refresh()

        self.status_label.setText(u"边上建关节：{} 个".format(len(created)))

    # ------------------------------------------------------------------
    # 编辑
    # ------------------------------------------------------------------

    def toggle_scale_compensate(self):
        u"""开关缩放补偿。"""

        joints = self.get_selected_joints()

        if not joints:
            self.status_label.setText(u"请先选择关节")
            return

        enabled = self.scale_compensate_check.isChecked()

        for node in joints:
            jnt_utils.Jnt(node).set_scale_compensate(enabled)

        self.status_label.setText(
            u"缩放补偿：{}".format(u"开启" if enabled else u"关闭")
        )

    def clear_orient(self):
        u"""把关节朝向重置为零。"""

        joints = self.get_selected_joints()

        if not joints:
            self.status_label.setText(u"请先选择关节")
            return

        cmds.undoInfo(openChunk=True)

        try:
            for node in joints:
                jnt_utils.Jnt(node).set_joint_orient((0.0, 0.0, 0.0))
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(u"已清除 {} 个关节的朝向".format(len(joints)))

    # ------------------------------------------------------------------
    # 约束
    # ------------------------------------------------------------------

    def batch_parent_constraint(self):
        u"""成对选择，批量创建父约束。"""

        selection = cmds.ls(orderedSelection=True) or []

        if len(selection) < 2 or len(selection) % 2 != 0:
            cmds.warning(
                u"请按 driver1, driven1, driver2, driven2… 的顺序选择偶数个对象。"
            )
            return

        created = 0

        cmds.undoInfo(openChunk=True)

        try:
            for index in range(0, len(selection), 2):
                try:
                    constraint_utils.create_constraint(
                        driver_objects=[selection[index]],
                        driven_object=selection[index + 1],
                        constraint_type="parentConstraint",
                        maintain_offset=True
                    )
                    created += 1
                except (RuntimeError, ValueError) as error:
                    cmds.warning(str(error))
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(u"批量父约束：{} 对".format(created))

    # ------------------------------------------------------------------
    # 蒙皮
    # ------------------------------------------------------------------

    def bind_skin(self):
        u"""绑定蒙皮：最后一个选择是模型，其余都当作骨骼。"""

        selection = cmds.ls(orderedSelection=True) or []

        if len(selection) < 2:
            self.status_label.setText(u"请选择骨骼和模型")
            return

        joints = selection[:-1]
        geometry = selection[-1]

        cmds.undoInfo(openChunk=True)

        try:
            skin_utils.bind_skin(joints, geometry)
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"绑定失败：{}".format(error))
            return
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(
            u"绑定蒙皮：{} 个骨骼 → {}".format(len(joints), geometry)
        )

    def copy_weights(self):
        u"""复制权重：第一个模型是源，其余是目标。"""

        selection = cmds.ls(orderedSelection=True) or []

        if len(selection) < 2:
            self.status_label.setText(u"请至少选择两个模型")
            return

        try:
            created = skin_utils.copy_skin_weights(selection[0], selection[1:])
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"复制失败：{}".format(error))
            return

        self.status_label.setText(u"复制权重：{} 个目标".format(len(created)))


_window = None


def main():
    global _window

    _window = JntTool()
    _window.show()

    return _window
