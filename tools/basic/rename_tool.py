# coding=utf-8
u"""批量重命名工具。

界面结构：

    ┌─ 前后缀 ─────────────────────┐
    │ [ctrl_        ] [添加前缀]   │
    │ [_bind        ] [添加后缀]   │
    ├─ 查找替换 ───────────────────┤
    │ 查找 [          ]            │
    │ 替换 [          ]            │
    │ 范围 [选中物体  ▼]           │
    │ [        执行查找替换      ] │
    ├─ 自动编号 ───────────────────┤
    │ 基础名 [          ]          │
    │ 起始 [1]    位数 [3]         │
    │ 类型 [数字    ▼]             │
    │ [          自动编号        ] │
    ├─ 模式命名 ───────────────────┤
    │ [ctrl_lf_arm_***        ]    │
    │ 连续 * 的数量表示位数        │
    │ [        模式重命名        ] │
    └──────────────────────────────┘
    状态：准备就绪

实际改名全部交给 core.common.rename_utils，这里只收集参数、显示结果。
"""

from PySide2 import QtWidgets

from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.common import rename_utils


class RenameWindow(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""批量重命名工具窗口。"""

    def __init__(self, parent=None):
        super(RenameWindow, self).__init__(parent)

        self.setWindowTitle(u"批量重命名")
        self.resize(420, 620)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面：各功能区块从上到下排列。"""

        layout = QtWidgets.QVBoxLayout(self)

        layout.addWidget(self.build_affix_section())
        layout.addWidget(self.build_replace_section())
        layout.addWidget(self.build_number_section())
        layout.addWidget(self.build_pattern_section())

        self.status_label = QtWidgets.QLabel(u"准备就绪")
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_affix_section(self):
        u"""前后缀区块。"""

        group = QtWidgets.QGroupBox(u"后缀 / 前缀")
        layout = QtWidgets.QVBoxLayout(group)

        # 前缀
        prefix_row = QtWidgets.QHBoxLayout()
        self.prefix_edit = QtWidgets.QLineEdit()
        self.prefix_edit.setPlaceholderText(u"例如 ctrl_")
        prefix_row.addWidget(self.prefix_edit)

        self.prefix_button = QtWidgets.QPushButton(u"添加前缀")
        self.prefix_button.clicked.connect(self.add_prefix)
        prefix_row.addWidget(self.prefix_button)
        layout.addLayout(prefix_row)

        # 后缀
        suffix_row = QtWidgets.QHBoxLayout()
        self.suffix_edit = QtWidgets.QLineEdit()
        self.suffix_edit.setPlaceholderText(u"例如 _bind")
        suffix_row.addWidget(self.suffix_edit)

        self.suffix_button = QtWidgets.QPushButton(u"添加后缀")
        self.suffix_button.clicked.connect(self.add_suffix)
        suffix_row.addWidget(self.suffix_button)
        layout.addLayout(suffix_row)

        return group

    def build_replace_section(self):
        u"""查找替换区块。"""

        group = QtWidgets.QGroupBox(u"查找替换")
        layout = QtWidgets.QVBoxLayout(group)

        form = QtWidgets.QFormLayout()

        self.search_edit = QtWidgets.QLineEdit()
        self.search_edit.setPlaceholderText(u"查找")
        form.addRow(u"查找", self.search_edit)

        self.replace_edit = QtWidgets.QLineEdit()
        self.replace_edit.setPlaceholderText(u"替换为")
        form.addRow(u"替换", self.replace_edit)

        self.scope_combo = QtWidgets.QComboBox()
        self.scope_combo.addItem(u"选中物体")
        self.scope_combo.addItem(u"选中层级")
        self.scope_combo.addItem(u"全场景")
        form.addRow(u"范围", self.scope_combo)

        layout.addLayout(form)

        self.replace_button = QtWidgets.QPushButton(u"执行查找替换")
        self.replace_button.clicked.connect(self.search_replace)
        layout.addWidget(self.replace_button)

        return group

    def build_number_section(self):
        u"""自动编号区块。"""

        group = QtWidgets.QGroupBox(u"自动编号")
        layout = QtWidgets.QVBoxLayout(group)

        form = QtWidgets.QFormLayout()

        self.base_name_edit = QtWidgets.QLineEdit()
        self.base_name_edit.setPlaceholderText(u"留空时使用对象原名")
        form.addRow(u"基础名", self.base_name_edit)

        self.start_spin = QtWidgets.QSpinBox()
        self.start_spin.setRange(0, 999999)
        self.start_spin.setValue(1)
        form.addRow(u"起始", self.start_spin)

        self.padding_spin = QtWidgets.QSpinBox()
        self.padding_spin.setRange(0, 8)
        self.padding_spin.setValue(3)
        form.addRow(u"位数", self.padding_spin)

        self.number_type_combo = QtWidgets.QComboBox()
        self.number_type_combo.addItem(u"数字")
        self.number_type_combo.addItem(u"大写字母")
        self.number_type_combo.addItem(u"小写字母")
        form.addRow(u"类型", self.number_type_combo)

        layout.addLayout(form)

        self.number_button = QtWidgets.QPushButton(u"自动编号")
        self.number_button.clicked.connect(self.auto_number)
        layout.addWidget(self.number_button)

        return group

    def build_pattern_section(self):
        u"""模式命名区块。"""

        group = QtWidgets.QGroupBox(u"模式命名")
        layout = QtWidgets.QVBoxLayout(group)

        self.pattern_edit = QtWidgets.QLineEdit()
        self.pattern_edit.setPlaceholderText(u"例如 ctrl_lf_arm_***")
        layout.addWidget(self.pattern_edit)

        hint = QtWidgets.QLabel(u"连续 * 的数量表示位数，例如 *** 生成 001。")
        layout.addWidget(hint)

        self.pattern_button = QtWidgets.QPushButton(u"模式重命名")
        self.pattern_button.clicked.connect(self.pattern_rename)
        layout.addWidget(self.pattern_button)

        return group

    # ------------------------------------------------------------------
    # 槽函数
    # ------------------------------------------------------------------

    def set_status(self, action, count):
        u"""统一更新状态标签。"""

        self.status_label.setText(u"{}：处理 {} 个对象".format(action, count))

        if count == 0:
            self.status_label.setText(
                u"{}：没有对象被改名（检查选择或输入）".format(action)
            )

    def add_prefix(self):
        u"""添加前缀。"""

        count = rename_utils.add_prefix(self.prefix_edit.text().strip())
        self.set_status(u"添加前缀", count)

    def add_suffix(self):
        u"""添加后缀。"""

        count = rename_utils.add_suffix(self.suffix_edit.text().strip())
        self.set_status(u"添加后缀", count)

    def search_replace(self):
        u"""查找替换。"""

        count = rename_utils.search_replace(
            search_text=self.search_edit.text(),
            replace_text=self.replace_edit.text(),
            scope_name=self.scope_combo.currentText()
        )
        self.set_status(u"查找替换", count)

    def auto_number(self):
        u"""自动编号。"""

        count = rename_utils.auto_number(
            base_name=self.base_name_edit.text().strip(),
            start_number=self.start_spin.value(),
            padding=self.padding_spin.value(),
            number_type=self.number_type_combo.currentText()
        )
        self.set_status(u"自动编号", count)

    def pattern_rename(self):
        u"""模式命名。"""

        count = rename_utils.pattern_rename(self.pattern_edit.text().strip())
        self.set_status(u"模式命名", count)


_window = None


def main():
    global _window

    _window = RenameWindow()
    _window.show()

    return _window
