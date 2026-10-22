# coding=utf-8
u"""属性工具。

管理当前选中对象的自定义属性：

    查看属性列表
    读写值
    锁定、隐藏
    添加 / 删除属性

界面结构：

    ┌─ 目标 ────────────────────────┐
    │ 当前对象：pCube1      [刷新]   │
    ├─ 自定义属性 ──────────────────┤
    │ myWeight                      │
    │ twist                         │
    ├─ 值 ──────────────────────────┤
    │ [1.0        ] [设置] [重置]   │
    │ ☐ 锁定   ☐ 隐藏                │
    ├─ 添加属性 ────────────────────┤
    │ 名称 [    ] 类型 [double ▼]   │
    │ 默认 [0.0]   [添加]            │
    ├─ 操作 ────────────────────────┤
    │ [删除选中属性]                 │
    └───────────────────────────────┘
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.common.attr_utils import Attr
from ...ui import theme


class AttrTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""属性工具窗口。"""

    def __init__(self, parent=None):
        super(AttrTool, self).__init__(parent)

        self.setWindowTitle(u"属性工具")
        self.resize(460, 560)

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

        layout.addWidget(theme.make_title(u"属性工具"))
        layout.addWidget(theme.make_subtitle(
            u"管理当前选中对象的自定义属性。"
        ))

        layout.addWidget(self.build_target_section())
        layout.addWidget(self.build_attr_list_section())
        layout.addWidget(self.build_value_section())
        layout.addWidget(self.build_add_section())
        layout.addWidget(self.build_action_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_target_section(self):
        u"""目标对象区块。"""

        group = QtWidgets.QGroupBox(u"目标")
        layout = QtWidgets.QHBoxLayout(group)

        self.target_label = QtWidgets.QLabel(u"未选择对象")
        layout.addWidget(self.target_label, 1)

        self.refresh_button = QtWidgets.QPushButton(u"刷新")
        self.refresh_button.setStyleSheet(theme.button_style)
        self.refresh_button.clicked.connect(self.refresh)
        layout.addWidget(self.refresh_button)

        return group

    def build_attr_list_section(self):
        u"""属性列表区块。"""

        group = QtWidgets.QGroupBox(u"自定义属性")
        layout = QtWidgets.QVBoxLayout(group)

        self.attr_list = QtWidgets.QListWidget()
        self.attr_list.setStyleSheet(theme.navigation_style)
        self.attr_list.setFixedHeight(120)
        self.attr_list.currentItemChanged.connect(self.on_attr_selected)
        layout.addWidget(self.attr_list)

        return group

    def build_value_section(self):
        u"""值区块。"""

        group = QtWidgets.QGroupBox(u"值")
        layout = QtWidgets.QVBoxLayout(group)

        row = QtWidgets.QHBoxLayout()

        self.value_edit = QtWidgets.QLineEdit()
        self.value_edit.setStyleSheet(theme.input_style)
        row.addWidget(self.value_edit)

        self.set_value_button = QtWidgets.QPushButton(u"设置")
        self.set_value_button.setStyleSheet(theme.button_style)
        self.set_value_button.clicked.connect(self.set_value)
        row.addWidget(self.set_value_button)

        self.reset_button = QtWidgets.QPushButton(u"重置")
        self.reset_button.setStyleSheet(theme.button_style)
        self.reset_button.clicked.connect(self.reset_value)
        row.addWidget(self.reset_button)

        layout.addLayout(row)

        state_row = QtWidgets.QHBoxLayout()

        self.lock_check = QtWidgets.QCheckBox(u"锁定")
        self.lock_check.clicked.connect(self.toggle_lock)
        state_row.addWidget(self.lock_check)

        self.hide_check = QtWidgets.QCheckBox(u"隐藏")
        self.hide_check.clicked.connect(self.toggle_hide)
        state_row.addWidget(self.hide_check)

        state_row.addStretch()
        layout.addLayout(state_row)

        return group

    def build_add_section(self):
        u"""添加属性区块。"""

        group = QtWidgets.QGroupBox(u"添加属性")
        layout = QtWidgets.QVBoxLayout(group)

        form = QtWidgets.QFormLayout()

        self.name_edit = QtWidgets.QLineEdit()
        self.name_edit.setStyleSheet(theme.input_style)
        form.addRow(u"名称", self.name_edit)

        self.type_combo = QtWidgets.QComboBox()
        self.type_combo.addItems([
            "double", "float", "int", "bool", "string", "enum"
        ])
        form.addRow(u"类型", self.type_combo)

        self.default_edit = QtWidgets.QLineEdit()
        self.default_edit.setStyleSheet(theme.input_style)
        self.default_edit.setPlaceholderText(u"可选")
        form.addRow(u"默认值", self.default_edit)

        layout.addLayout(form)

        self.add_button = QtWidgets.QPushButton(u"添加")
        self.add_button.setStyleSheet(theme.button_style)
        self.add_button.clicked.connect(self.add_attr)
        layout.addWidget(self.add_button)

        return group

    def build_action_section(self):
        u"""操作区块。"""

        group = QtWidgets.QGroupBox(u"操作")
        layout = QtWidgets.QVBoxLayout(group)

        self.delete_button = QtWidgets.QPushButton(u"删除选中属性")
        self.delete_button.setStyleSheet(theme.button_style)
        self.delete_button.clicked.connect(self.delete_attr)
        layout.addWidget(self.delete_button)

        return group

    # ------------------------------------------------------------------
    # 逻辑
    # ------------------------------------------------------------------

    def get_node(self):
        u"""返回当前选中的第一个对象。"""

        selection = cmds.ls(selection=True)

        if not selection:
            return None

        return selection[0]

    def refresh(self):
        u"""刷新对象和属性列表。"""

        node = self.get_node()

        self.attr_list.clear()
        self.target_label.setText(node or u"未选择对象")

        if not node:
            self.status_label.setText(u"请先选择一个对象")
            return

        attrs = Attr(node).list_custom_attrs()

        for name in attrs:
            self.attr_list.addItem(name)

        self.status_label.setText(
            u"{}：{} 个自定义属性".format(node, len(attrs))
        )

    def get_selected_attr(self):
        u"""返回列表里选中的属性名。"""

        item = self.attr_list.currentItem()

        return item.text() if item else None

    def on_attr_selected(self, current, previous):
        u"""选中属性时显示当前值。"""

        if current is None:
            return

        node = self.get_node()
        attr = current.text()

        if not node:
            return

        try:
            value = Attr(node).get_value(attr)
        except Exception:
            return

        self.value_edit.setText(str(value))

        # 同步锁定和隐藏状态
        plug = "{}.{}".format(node, attr)
        self.lock_check.setChecked(cmds.getAttr(plug, lock=True))
        self.hide_check.setChecked(not cmds.getAttr(plug, keyable=True))

    def set_value(self):
        u"""设置属性值。"""

        node = self.get_node()
        attr = self.get_selected_attr()

        if not node or not attr:
            self.status_label.setText(u"请先选择对象和属性")
            return

        text = self.value_edit.text().strip()

        try:
            value = self.parse_value(text)
        except ValueError:
            self.status_label.setText(u"值格式不对：{}".format(text))
            return

        try:
            Attr(node).set_value(attr, value)
        except Exception as error:
            self.status_label.setText(u"设置失败：{}".format(error))
            return

        self.status_label.setText(u"已设置 {}.{} = {}".format(node, attr, value))

    @staticmethod
    def parse_value(text):
        u"""把界面文本转成合适的 Python 值。

        支持 1 / 1.5 / true / false / 字符串。
        """

        lower = text.lower()

        if lower in ("true", "false"):
            return lower == "true"

        try:
            return int(text)
        except ValueError:
            pass

        try:
            return float(text)
        except ValueError:
            pass

        return text

    def reset_value(self):
        u"""把属性恢复成默认值。"""

        node = self.get_node()
        attr = self.get_selected_attr()

        if not node or not attr:
            return

        plug = "{}.{}".format(node, attr)

        try:
            cmds.setAttr(plug, reset=True)
        except Exception:
            self.status_label.setText(u"该属性没有默认值")
            return

        self.on_attr_selected(self.attr_list.currentItem(), None)
        self.status_label.setText(u"已重置 {}.{}".format(node, attr))

    def toggle_lock(self):
        u"""切换锁定状态。"""

        node = self.get_node()
        attr = self.get_selected_attr()

        if not node or not attr:
            return

        Attr(node).set_state(attr, lock=self.lock_check.isChecked())

        self.status_label.setText(
            u"{}：{}".format(attr, u"已锁定" if self.lock_check.isChecked() else u"已解锁")
        )

    def toggle_hide(self):
        u"""切换隐藏状态。"""

        node = self.get_node()
        attr = self.get_selected_attr()

        if not node or not attr:
            return

        Attr(node).set_state(attr, hidden=self.hide_check.isChecked())

        self.status_label.setText(
            u"{}：{}".format(attr, u"已隐藏" if self.hide_check.isChecked() else u"已显示")
        )

    def add_attr(self):
        u"""添加自定义属性。"""

        node = self.get_node()

        if not node:
            self.status_label.setText(u"请先选择一个对象")
            return

        name = self.name_edit.text().strip()

        if not name:
            self.status_label.setText(u"请输入属性名")
            return

        text = self.default_edit.text().strip()
        default = self.parse_value(text) if text else None

        try:
            Attr(node).add_attr(
                name,
                attr_type=self.type_combo.currentText(),
                default=default
            )
        except Exception as error:
            self.status_label.setText(u"添加失败：{}".format(error))
            return

        self.name_edit.clear()
        self.default_edit.clear()
        self.refresh()
        self.status_label.setText(u"已添加 {}".format(name))

    def delete_attr(self):
        u"""删除选中属性。"""

        node = self.get_node()
        attr = self.get_selected_attr()

        if not node or not attr:
            self.status_label.setText(u"请先选择对象和属性")
            return

        try:
            Attr(node).delete_attr(attr)
        except Exception as error:
            self.status_label.setText(u"删除失败：{}".format(error))
            return

        self.refresh()
        self.status_label.setText(u"已删除 {}".format(attr))


_window = None


def main():
    global _window

    _window = AttrTool()
    _window.show()

    return _window
