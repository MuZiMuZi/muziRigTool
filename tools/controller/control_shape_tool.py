# coding=utf-8
u"""控制器形状工具。

给已有的控制器换形状、调朝向、存进形状库。

界面结构：

    ┌─ 目标 ────────────────────────┐
    │ 当前：ctrl_001  (2 个控制器)   │
    ├─ 形状库 ──────────────────────┤
    │ [图标网格]                     │
    ├─ 调整 ────────────────────────┤
    │ [旋转 90°] [镜像 X] [镜像 Y]  │
    │ [镜像 Z]                       │
    ├─ 库管理 ──────────────────────┤
    │ 名称 [      ] [保存当前形状]   │
    │ [删除选中形状]                 │
    └───────────────────────────────┘

形状数据操作在 core.rigging.ctrl_utils.Ctrl 里。
"""

import os

from PySide2 import QtCore, QtGui, QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.rigging.ctrl_utils import Ctrl
from ...ui import theme


class ControlShapeTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""控制器形状窗口。"""

    def __init__(self, parent=None):
        super(ControlShapeTool, self).__init__(parent)

        self.setWindowTitle(u"控制器形状")
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

        layout.addWidget(theme.make_title(u"控制器形状"))
        layout.addWidget(theme.make_subtitle(
            u"单击形状应用到选中的控制器。"
        ))

        layout.addWidget(self.build_target_section())
        layout.addWidget(self.build_library_section())
        layout.addWidget(self.build_adjust_section())
        layout.addWidget(self.build_manage_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_target_section(self):
        u"""目标区块。"""

        group = QtWidgets.QGroupBox(u"目标")
        layout = QtWidgets.QHBoxLayout(group)

        self.target_label = QtWidgets.QLabel(u"未选择控制器")
        layout.addWidget(self.target_label, 1)

        self.refresh_button = QtWidgets.QPushButton(u"刷新")
        self.refresh_button.setStyleSheet(theme.button_style)
        self.refresh_button.clicked.connect(self.refresh)
        layout.addWidget(self.refresh_button)

        return group

    def build_library_section(self):
        u"""形状库区块。"""

        group = QtWidgets.QGroupBox(u"形状库")
        layout = QtWidgets.QVBoxLayout(group)

        self.shape_list = QtWidgets.QListWidget()
        self.shape_list.setViewMode(QtWidgets.QListView.IconMode)
        self.shape_list.setIconSize(QtCore.QSize(52, 52))
        self.shape_list.setGridSize(QtCore.QSize(74, 80))
        self.shape_list.setMovement(QtWidgets.QListView.Static)
        self.shape_list.setResizeMode(QtWidgets.QListView.Adjust)
        self.shape_list.setFixedHeight(220)
        self.shape_list.itemClicked.connect(self.apply_shape)
        layout.addWidget(self.shape_list)

        return group

    def build_adjust_section(self):
        u"""调整区块。"""

        group = QtWidgets.QGroupBox(u"调整")
        layout = QtWidgets.QGridLayout(group)

        self.rotate_button = QtWidgets.QPushButton(u"旋转 90°")
        self.rotate_button.setStyleSheet(theme.button_style)
        self.rotate_button.clicked.connect(self.rotate_shape)
        layout.addWidget(self.rotate_button, 0, 0)

        for column, axis in enumerate(("x", "y", "z")):
            button = QtWidgets.QPushButton(u"镜像 {}".format(axis.upper()))
            button.setStyleSheet(theme.button_style)
            button.clicked.connect(
                lambda checked=False, value=axis: self.mirror_shape(value)
            )
            layout.addWidget(button, 0, column + 1)

        return group

    def build_manage_section(self):
        u"""库管理区块。"""

        group = QtWidgets.QGroupBox(u"库管理")
        layout = QtWidgets.QVBoxLayout(group)

        row = QtWidgets.QHBoxLayout()

        self.name_edit = QtWidgets.QLineEdit()
        self.name_edit.setStyleSheet(theme.input_style)
        self.name_edit.setPlaceholderText(u"新形状名")
        row.addWidget(self.name_edit)

        self.save_button = QtWidgets.QPushButton(u"保存当前形状")
        self.save_button.setStyleSheet(theme.button_style)
        self.save_button.clicked.connect(self.save_shape)
        row.addWidget(self.save_button)

        layout.addLayout(row)

        self.delete_button = QtWidgets.QPushButton(u"删除选中形状")
        self.delete_button.setStyleSheet(theme.button_style)
        self.delete_button.clicked.connect(self.delete_shape)
        layout.addWidget(self.delete_button)

        return group

    # ------------------------------------------------------------------
    # 数据
    # ------------------------------------------------------------------

    def get_controllers(self):
        u"""返回选中的控制器节点名列表。"""

        selection = cmds.ls(selection=True) or []

        return [
            node for node in selection
            if cmds.objExists(node) and node.startswith("ctrl_")
        ]

    def refresh(self):
        u"""刷新目标信息和形状列表。"""

        controllers = self.get_controllers()

        if controllers:
            self.target_label.setText(
                u"{}  ({} 个控制器)".format(controllers[0], len(controllers))
            )
        else:
            self.target_label.setText(u"未选择控制器")

        self.load_shapes()

    def load_shapes(self):
        u"""重新读取形状库。"""

        self.shape_list.clear()

        for name in Ctrl.get_shape_names():
            item = QtWidgets.QListWidgetItem()
            item.setIcon(
                QtGui.QIcon(os.path.join(Ctrl.shape_dir, name + ".png"))
            )
            item.setText(name)
            item.setToolTip(name)
            item.setData(QtCore.Qt.UserRole, name)
            item.setTextAlignment(QtCore.Qt.AlignHCenter | QtCore.Qt.AlignBottom)
            self.shape_list.addItem(item)

    # ------------------------------------------------------------------
    # 操作
    # ------------------------------------------------------------------

    def apply_shape(self, item):
        u"""把形状应用到所有选中控制器。"""

        controllers = self.get_controllers()

        if not controllers:
            self.status_label.setText(u"请先选择控制器")
            return

        shape_name = item.data(QtCore.Qt.UserRole)
        applied = 0

        cmds.undoInfo(openChunk=True)

        try:
            for name in controllers:
                try:
                    Ctrl(name).set_shape(shape_name)
                    applied += 1
                except Exception as error:
                    cmds.warning(str(error))
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(
            u"{}：应用到 {} 个控制器".format(shape_name, applied)
        )

    def rotate_shape(self):
        u"""旋转 90 度。"""

        self.apply_to_controllers(
            lambda ctrl: ctrl.rotate_shape(90.0),
            u"旋转 90°"
        )

    def mirror_shape(self, axis):
        u"""镜像形状。"""

        self.apply_to_controllers(
            lambda ctrl: ctrl.mirror_shape(axis),
            u"镜像 {}".format(axis.upper())
        )

    def apply_to_controllers(self, action, label):
        u"""对每个选中控制器执行一个操作。"""

        controllers = self.get_controllers()

        if not controllers:
            self.status_label.setText(u"请先选择控制器")
            return

        applied = 0

        cmds.undoInfo(openChunk=True)

        try:
            for name in controllers:
                try:
                    action(Ctrl(name))
                    applied += 1
                except Exception as error:
                    cmds.warning(str(error))
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(
            u"{}：处理 {} 个控制器".format(label, applied)
        )

    def save_shape(self):
        u"""把当前形状存进库。"""

        controllers = self.get_controllers()

        if not controllers:
            self.status_label.setText(u"请先选择控制器")
            return

        shape_name = self.name_edit.text().strip()

        if not shape_name:
            self.status_label.setText(u"请输入形状名")
            return

        try:
            path = Ctrl(controllers[0]).save_shape(shape_name)
        except Exception as error:
            self.status_label.setText(u"保存失败：{}".format(error))
            return

        self.name_edit.clear()
        self.load_shapes()
        self.status_label.setText(u"已保存：{}".format(shape_name))

    def delete_shape(self):
        u"""删除库里的形状。"""

        item = self.shape_list.currentItem()

        if item is None:
            self.status_label.setText(u"请先在列表里选中一个形状")
            return

        shape_name = item.data(QtCore.Qt.UserRole)

        if not Ctrl.delete_shape(shape_name):
            self.status_label.setText(u"删除失败：{}".format(shape_name))
            return

        self.load_shapes()
        self.status_label.setText(u"已删除：{}".format(shape_name))


_window = None


def main():
    global _window

    _window = ControlShapeTool()
    _window.show()

    return _window
