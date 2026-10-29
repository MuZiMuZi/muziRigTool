# coding=utf-8
u"""UV Pin 工具。

按「模型 + 定位器」批量把 ``uvPin`` 固定在模型表面。

流程：

    载入选中模型 -> 添加定位器 -> 创建 UV Pin

每个定位器会在模型表面最近点创建一个 ``uvPin``；默认按定位器世界位置
生成一个世界级组，用 ``outputMatrix -> offsetParentMatrix`` 驱动组，
定位器本身保持不变。

界面结构：

    ┌─ 目标模型 ─────────────────────┐
    │ pSphereShape1        [载入选择] │
    ├─ 定位器 ───────────────────────┤
    │ locator1                       │
    │ locator2                       │
    │ [添加选择] [移除选中] [清空]    │
    ├─ 创建选项 ─────────────────────┤
    │ UV 集 [map1 ▼]                 │
    │ 输出方式 [Offset Parent Matrix] │
    │ 驱动对象 [组 ▼]                │
    │ [x] 合并 UV Pin                 │
    │ [ ] 保持偏移（仅约束模式）      │
    │ 法线轴 [X ▼]  切线轴 [Y ▼]      │
    ├────────────────────────────────┤
    │ [        创建 UV Pin         ]  │
    └────────────────────────────────┘
"""

from PySide2 import QtCore
from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.rigging import uv_pin_utils
from ...ui import theme


class UVPinTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""UV Pin 工具窗口。"""

    def __init__(self, parent=None):
        super(UVPinTool, self).__init__(parent)

        self.model_shape = ""

        self.setWindowTitle(u"UV Pin 工具")
        self.resize(520, 620)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"UV Pin 工具"))
        layout.addWidget(theme.make_subtitle(
            u"选择一个模型和多个定位器，在定位器对应的表面位置创建 uvPin。"
        ))

        layout.addWidget(self.build_model_section())
        layout.addWidget(self.build_locator_section(), 1)
        layout.addWidget(self.build_option_section())
        layout.addWidget(self.build_action_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        self.status_label.setWordWrap(True)
        layout.addWidget(self.status_label)

    def build_model_section(self):
        u"""目标模型区块。"""

        group = QtWidgets.QGroupBox(u"目标模型")
        layout = QtWidgets.QHBoxLayout(group)

        self.model_label = QtWidgets.QLabel(u"未指定模型")
        layout.addWidget(self.model_label, 1)

        self.model_button = QtWidgets.QPushButton(u"载入选择")
        self.model_button.setStyleSheet(theme.button_style)
        self.model_button.clicked.connect(self.load_from_selection)
        layout.addWidget(self.model_button)

        return group

    def build_locator_section(self):
        u"""定位器列表区块。"""

        group = QtWidgets.QGroupBox(u"定位器")
        layout = QtWidgets.QVBoxLayout(group)

        self.locator_list = QtWidgets.QListWidget()
        self.locator_list.setSelectionMode(
            QtWidgets.QAbstractItemView.ExtendedSelection
        )
        self.locator_list.setMinimumHeight(140)
        self.locator_list.setToolTip(
            u"每个定位器会在模型表面最近点创建一个 uvPin。"
        )
        layout.addWidget(self.locator_list, 1)

        button_row = QtWidgets.QHBoxLayout()

        self.add_button = QtWidgets.QPushButton(u"添加选择")
        self.add_button.setStyleSheet(theme.button_style)
        self.add_button.clicked.connect(self.add_selected_drivers)
        button_row.addWidget(self.add_button)

        self.remove_button = QtWidgets.QPushButton(u"移除选中")
        self.remove_button.setStyleSheet(theme.button_style)
        self.remove_button.clicked.connect(self.remove_selected_drivers)
        button_row.addWidget(self.remove_button)

        self.clear_button = QtWidgets.QPushButton(u"清空")
        self.clear_button.setStyleSheet(theme.button_style)
        self.clear_button.clicked.connect(self.clear_drivers)
        button_row.addWidget(self.clear_button)

        layout.addLayout(button_row)

        return group

    def build_option_section(self):
        u"""创建选项区块。"""

        group = QtWidgets.QGroupBox(u"创建选项")
        layout = QtWidgets.QFormLayout(group)

        self.uv_set_combo = QtWidgets.QComboBox()
        self.uv_set_combo.addItem(u"(当前 UV 集)", "")
        layout.addRow(u"UV 集", self.uv_set_combo)

        self.output_mode_combo = QtWidgets.QComboBox()
        self.output_mode_combo.addItem(
            u"Offset Parent Matrix（推荐）",
            uv_pin_utils.OUTPUT_OFFSET_PARENT_MATRIX
        )
        self.output_mode_combo.addItem(
            u"Parent Constraint",
            uv_pin_utils.OUTPUT_PARENT_CONSTRAINT
        )
        self.output_mode_combo.addItem(
            u"Point Constraint",
            uv_pin_utils.OUTPUT_POINT_CONSTRAINT
        )
        self.output_mode_combo.currentIndexChanged.connect(
            self.on_output_mode_changed
        )
        layout.addRow(u"输出方式", self.output_mode_combo)

        self.maintain_offset_checkbox = QtWidgets.QCheckBox(u"保持偏移")
        self.maintain_offset_checkbox.setToolTip(
            u"仅约束模式有效：保留目标原来的相对偏移。"
        )
        self.maintain_offset_checkbox.setEnabled(False)
        layout.addRow(self.maintain_offset_checkbox)

        self.drive_target_combo = QtWidgets.QComboBox()
        self.drive_target_combo.addItem(u"组（推荐）", True)
        self.drive_target_combo.addItem(u"定位器本身", False)
        self.drive_target_combo.setToolTip(
            u"组：按定位器位置创建世界级组并驱动组；定位器本身：直接驱动定位器。"
        )
        layout.addRow(u"驱动对象", self.drive_target_combo)

        self.merge_checkbox = QtWidgets.QCheckBox(u"合并同模型 UV Pin")
        self.merge_checkbox.setChecked(True)
        self.merge_checkbox.setToolTip(
            u"同一模型、同 UV 集与轴向的多个 pin 合并到一个 uvPin 节点。"
        )
        layout.addRow(self.merge_checkbox)

        self.normal_axis_combo = QtWidgets.QComboBox()
        self.tangent_axis_combo = QtWidgets.QComboBox()

        for index, axis_name in enumerate(uv_pin_utils.AXIS_NAMES):
            self.normal_axis_combo.addItem(axis_name, index)
            self.tangent_axis_combo.addItem(axis_name, index)

        self.normal_axis_combo.setCurrentIndex(0)
        self.tangent_axis_combo.setCurrentIndex(1)

        layout.addRow(u"法线轴", self.normal_axis_combo)
        layout.addRow(u"切线轴", self.tangent_axis_combo)

        return group

    def build_action_section(self):
        u"""操作区块。"""

        group = QtWidgets.QGroupBox(u"操作")
        layout = QtWidgets.QVBoxLayout(group)

        self.create_button = QtWidgets.QPushButton(u"创建 UV Pin")
        self.create_button.setStyleSheet(theme.button_style)
        self.create_button.clicked.connect(self.create_pins)
        layout.addWidget(self.create_button)

        return group

    # ------------------------------------------------------------------
    # 选择
    # ------------------------------------------------------------------

    @staticmethod
    def get_selected_nodes():
        u"""返回当前选择中的非组件节点。"""

        selected_nodes = cmds.ls(selection=True, long=True) or []

        return [node for node in selected_nodes if "." not in node]

    @staticmethod
    def is_mesh_node(node):
        u"""判断节点是否代表一个 Polygon Mesh。"""

        try:
            node_type = cmds.nodeType(node)
        except Exception:
            return False

        if node_type == "mesh":
            return True

        shapes = cmds.listRelatives(
            node,
            shapes=True,
            noIntermediate=True,
            fullPath=True,
            type="mesh"
        ) or []

        return bool(shapes)

    def load_from_selection(self):
        u"""从当前选择载入模型和定位器。

        选择中最多一个 Mesh 作为模型，其余 Transform / Jnt 作为定位器。
        没有定位器时只更新模型，保留已有列表。
        """

        selected_nodes = self.get_selected_nodes()

        if not selected_nodes:
            cmds.warning(u"请先选择模型，或同时选择模型与定位器。")
            return

        mesh_nodes = []
        driver_nodes = []

        for node in selected_nodes:
            if self.is_mesh_node(node):
                mesh_nodes.append(node)
                continue

            try:
                driver_nodes.append(
                    uv_pin_utils.get_driver_transform(node)
                )
            except Exception:
                continue

        if not mesh_nodes:
            cmds.warning(u"当前选择中没有 Polygon Mesh 模型。")
            self.status_label.setText(u"当前选择中没有可用模型")
            return

        if len(mesh_nodes) > 1:
            cmds.warning(
                u"一次只能处理一个模型，使用第一个：{}".format(
                    mesh_nodes[0]
                )
            )

        self.set_model(mesh_nodes[0])

        if driver_nodes:
            self.replace_drivers(driver_nodes)

            self.status_label.setText(
                u"已载入模型和 {} 个定位器".format(
                    len(self.get_drivers())
                )
            )
        else:
            self.status_label.setText(
                u"已载入模型，请继续添加定位器"
            )

    def add_selected_drivers(self):
        u"""把当前选择中的非 Mesh Transform 追加到定位器列表。"""

        existing_drivers = set(self.get_drivers())
        added_count = 0

        for node in self.get_selected_nodes():
            if self.is_mesh_node(node):
                continue

            try:
                driver = uv_pin_utils.get_driver_transform(node)
            except Exception:
                continue

            if driver in existing_drivers:
                continue

            self.add_driver_item(driver)
            existing_drivers.add(driver)
            added_count += 1

        if added_count == 0:
            cmds.warning(u"当前选择中没有可添加的定位器。")
            return

        self.status_label.setText(
            u"已添加 {} 个定位器，共 {} 个".format(
                added_count,
                len(self.get_drivers())
            )
        )

    def remove_selected_drivers(self):
        u"""移除定位器列表中选中的条目。"""

        selected_items = self.locator_list.selectedItems()

        if not selected_items:
            cmds.warning(u"请先在列表中选择要移除的定位器。")
            return

        for item in selected_items:
            row = self.locator_list.row(item)
            self.locator_list.takeItem(row)

        self.status_label.setText(
            u"剩余 {} 个定位器".format(len(self.get_drivers()))
        )

    def clear_drivers(self):
        u"""清空定位器列表。"""

        self.locator_list.clear()
        self.status_label.setText(u"定位器列表已清空")

    def add_driver_item(self, driver):
        u"""向定位器列表添加一个条目。"""

        short_name = driver.rsplit("|", 1)[-1]
        item = QtWidgets.QListWidgetItem(short_name)
        item.setData(QtCore.Qt.UserRole, driver)
        item.setToolTip(driver)
        self.locator_list.addItem(item)

    def replace_drivers(self, drivers):
        u"""用给定定位器替换当前列表。"""

        self.locator_list.clear()

        for driver in drivers:
            self.add_driver_item(driver)

    def get_drivers(self):
        u"""返回定位器列表中保存的 Transform Long Path。"""

        drivers = []

        for row in range(self.locator_list.count()):
            driver = self.locator_list.item(row).data(QtCore.Qt.UserRole)

            if driver:
                drivers.append(driver)

        return drivers

    # ------------------------------------------------------------------
    # 模型
    # ------------------------------------------------------------------

    def set_model(self, node):
        u"""设置目标模型并刷新 UV 集下拉框。"""

        try:
            shape = uv_pin_utils.get_shape(node)
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"模型无效：{}".format(error))
            return

        self.model_shape = shape
        self.model_label.setText(shape.rsplit("|", 1)[-1])
        self.model_label.setToolTip(shape)

        self.refresh_uv_sets()

    def refresh_uv_sets(self):
        u"""按当前模型刷新 UV 集下拉框。"""

        self.uv_set_combo.blockSignals(True)
        self.uv_set_combo.clear()
        self.uv_set_combo.addItem(u"(当前 UV 集)", "")

        if self.model_shape:
            for uv_set in uv_pin_utils.get_uv_sets(self.model_shape):
                self.uv_set_combo.addItem(uv_set, uv_set)

            current_uv_set = uv_pin_utils.get_current_uv_set(
                self.model_shape
            )
            current_index = self.uv_set_combo.findData(current_uv_set)

            if current_index >= 0:
                self.uv_set_combo.setCurrentIndex(current_index)

        self.uv_set_combo.blockSignals(False)

    # ------------------------------------------------------------------
    # 创建
    # ------------------------------------------------------------------

    def get_selected_axes(self):
        u"""返回 UI 中选择的法线轴和切线轴。"""

        normal_axis = self.normal_axis_combo.currentData()
        tangent_axis = self.tangent_axis_combo.currentData()

        return int(normal_axis), int(tangent_axis)

    def on_output_mode_changed(self, index):
        u"""约束模式才允许勾选“保持偏移”。"""

        output_mode = self.output_mode_combo.currentData()
        constraint_mode = output_mode in (
            uv_pin_utils.OUTPUT_PARENT_CONSTRAINT,
            uv_pin_utils.OUTPUT_POINT_CONSTRAINT,
        )

        self.maintain_offset_checkbox.setEnabled(constraint_mode)

        if not constraint_mode:
            self.maintain_offset_checkbox.setChecked(False)

    def create_pins(self):
        u"""按当前 UI 参数批量创建 UV Pin。"""

        if not self.model_shape:
            self.load_from_selection()

        if not self.model_shape:
            cmds.warning(u"请先选择一个 Polygon Mesh 模型。")
            self.status_label.setText(u"尚未指定模型")
            return

        drivers = self.get_drivers()

        if not drivers:
            cmds.warning(u"请至少添加一个定位器。")
            self.status_label.setText(u"定位器列表为空")
            return

        normal_axis, tangent_axis = self.get_selected_axes()

        if normal_axis % 3 == tangent_axis % 3:
            cmds.warning(u"法线轴和切线轴不能是同一个轴向。")
            self.status_label.setText(u"法线轴和切线轴不能同轴")
            return

        uv_set = self.uv_set_combo.currentData() or None
        output_mode = self.output_mode_combo.currentData()
        drive_group = bool(self.drive_target_combo.currentData())
        merge = self.merge_checkbox.isChecked()
        maintain_offset = (
            output_mode != uv_pin_utils.OUTPUT_OFFSET_PARENT_MATRIX
            and self.maintain_offset_checkbox.isChecked()
        )

        cmds.undoInfo(openChunk=True, chunkName="MuziCreateUVPins")

        try:
            result = uv_pin_utils.create_uv_pins(
                shape=self.model_shape,
                drivers=drivers,
                uv_set=uv_set,
                normal_axis=normal_axis,
                tangent_axis=tangent_axis,
                output_mode=output_mode,
                maintain_offset=maintain_offset,
                drive_group=drive_group,
                merge=merge
            )
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"创建失败：{}".format(error))
            return
        finally:
            cmds.undoInfo(closeChunk=True)

        created = result["created"]
        failed = result["failed"]
        nodes = result.get("nodes", [])

        for failure in failed:
            cmds.warning(
                u"创建 UV Pin 失败 {}：{}".format(
                    failure["driver"],
                    failure["error"]
                )
            )

        if created:
            if drive_group:
                status_text = u"已创建 {} 个组 / {} 个 uvPin 节点；失败 {} 个".format(
                    len(created),
                    len(nodes),
                    len(failed)
                )
            else:
                status_text = u"已创建 {} 个 UV Pin；失败 {} 个".format(
                    len(created),
                    len(failed)
                )

            self.status_label.setText(status_text)
        else:
            self.status_label.setText(u"没有创建任何 UV Pin")


_window = None


def main():
    u"""打开 UV Pin 工具。

    Returns:
        UVPinTool: 当前工具窗口。
    """

    global _window

    _window = UVPinTool()
    _window.show()

    return _window
