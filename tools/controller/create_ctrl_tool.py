# coding=utf-8
u"""创建控制器工具。

界面结构：

    ┌───────────────────────────┐
    │ 名称   [ctrl_md_new_fk_001]│
    ├───────────────────────────┤
    │ 形状   [分页图标网格]        │
    ├───────────────────────────┤
    │ 颜色   [滑块 + 色块 + 数字]  │
    ├───────────────────────────┤
    │ 大小   [滑块 + 数字]         │
    ├───────────────────────────┤
    │ 轴向   [X+        ▼]       │
    │ 处理   [Parent    ▼]       │
    │ ☑ 创建完整层级             │
    │ [         创建         ]   │
    └───────────────────────────┘

职责划分：

    本文件     只负责界面编排和参数收集
    ctrl_utils 负责控制器创建、形状、层级、与物体的关系
    ui/widgets 负责可复用控件（颜色、大小）
"""

import os

from PySide2 import QtCore, QtGui, QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.rigging.ctrl_utils import Ctrl
from ...ui.widgets.color_picker import ColorPicker
from ...ui.widgets.size_picker import SizePicker


class CreateCtrlWindow(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""创建控制器的工具窗口。"""

    def __init__(self, parent=None):
        super(CreateCtrlWindow, self).__init__(parent)

        self.setWindowTitle(u"创建控制器")
        self.resize(360, 520)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面：只负责把各区块从上到下排好
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。

        这里不碰具体控件，只决定「有哪些区块、谁在上面」。
        新增功能区时，只需要在这里加一行 addWidget。
        """

        layout = QtWidgets.QVBoxLayout(self)

        layout.addWidget(self.build_name_section())
        layout.addWidget(self.build_shape_section())
        layout.addWidget(self.build_color_section())
        layout.addWidget(self.build_size_section())
        layout.addWidget(self.build_action_section())

        # 底部留白：没有这一行，控件会被纵向拉伸铺满整个窗口。
        layout.addStretch()

    def build_name_section(self):
        u"""名称区块。"""

        group = QtWidgets.QGroupBox(u"控制器名称")
        layout = QtWidgets.QHBoxLayout(group)

        self.name_edit = QtWidgets.QLineEdit("ctrl_md_new_fk_001")
        layout.addWidget(self.name_edit)

        return group

    def build_shape_section(self):
        u"""形状区块：按类型分页，每页是图标网格。"""

        group = QtWidgets.QGroupBox(u"形状")
        layout = QtWidgets.QVBoxLayout(group)

        self.shape_tabs = QtWidgets.QTabWidget()

        for title, names in self.get_shape_groups():
            self.shape_tabs.addTab(self.build_shape_page(names), title)

        layout.addWidget(self.shape_tabs)

        return group

    def build_shape_page(self, names):
        u"""为一种类型建一页图标列表。

        Args:
            names (list): 该类型下的形状名称。

        Returns:
            QtWidgets.QListWidget: 图标网格。
        """

        widget = QtWidgets.QListWidget()
        widget.setViewMode(QtWidgets.QListView.IconMode)
        widget.setIconSize(QtCore.QSize(52, 52))
        widget.setGridSize(QtCore.QSize(74, 80))
        widget.setMovement(QtWidgets.QListView.Static)
        widget.setResizeMode(QtWidgets.QListView.Adjust)
        widget.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        widget.setFixedHeight(180)

        for name in names:
            item = QtWidgets.QListWidgetItem()
            item.setIcon(
                QtGui.QIcon(os.path.join(Ctrl.shape_dir, name + ".png"))
            )
            item.setText(name)
            item.setToolTip(name)
            item.setData(QtCore.Qt.UserRole, name)
            item.setTextAlignment(QtCore.Qt.AlignHCenter | QtCore.Qt.AlignBottom)
            widget.addItem(item)

        if widget.count():
            widget.setCurrentRow(0)

        return widget

    def get_shape_name(self):
        u"""返回当前页选中的形状名。"""

        widget = self.shape_tabs.currentWidget()
        item = widget.currentItem() if widget else None

        return item.data(QtCore.Qt.UserRole) if item else "circle"

    @staticmethod
    def get_shape_groups():
        u"""把形状按名称前缀分成几类。

        Returns:
            list: [(分类名, [形状名, ...]), ...]
        """

        groups = [
            (u"箭头", []),
            (u"圆形", []),
            (u"方形", []),
            (u"多边形", []),
            (u"其他", []),
        ]

        polygon_names = ("hex", "octagon_bevel", "triangle_round")

        for name in Ctrl.get_shape_names():
            if name.startswith("arrow"):
                groups[0][1].append(name)
            elif name.startswith("circle"):
                groups[1][1].append(name)
            elif name.startswith("square") or name.startswith("slider_square"):
                groups[2][1].append(name)
            elif name in polygon_names:
                groups[3][1].append(name)
            else:
                groups[4][1].append(name)

        return [item for item in groups if item[1]]

    def build_color_section(self):
        u"""颜色区块。"""

        group = QtWidgets.QGroupBox(u"颜色")
        layout = QtWidgets.QHBoxLayout(group)

        self.color_picker = ColorPicker()
        layout.addWidget(self.color_picker)

        return group

    def build_size_section(self):
        u"""大小区块。"""

        group = QtWidgets.QGroupBox(u"控制器大小")
        layout = QtWidgets.QVBoxLayout(group)

        self.size_picker = SizePicker()
        layout.addWidget(self.size_picker)

        return group

    def build_action_section(self):
        u"""操作区块：轴向、处理方式、层级开关、创建按钮。"""

        group = QtWidgets.QGroupBox(u"操作")
        layout = QtWidgets.QVBoxLayout(group)

        form = QtWidgets.QFormLayout()

        # 轴向：控制形状的朝向
        self.axis_combo = QtWidgets.QComboBox()
        self.axis_combo.addItems(["X+", "X-", "Y+", "Y-", "Z+", "Z-"])
        form.addRow(u"轴向", self.axis_combo)

        # 处理方式：创建后对当前选中物体做什么
        self.operation_combo = QtWidgets.QComboBox()
        self.operation_combo.addItem(u"Parent · 挂到控制器下", "parent")
        self.operation_combo.addItem(u"Constraint · 约束物体", "cons")
        self.operation_combo.addItem(u"None · 仅对齐", "none")
        form.addRow(u"处理", self.operation_combo)

        layout.addLayout(form)

        self.hierarchy_check = QtWidgets.QCheckBox(u"创建完整层级（含 subctrl 与 output）")
        self.hierarchy_check.setChecked(True)
        layout.addWidget(self.hierarchy_check)

        self.create_button = QtWidgets.QPushButton(u"创建")
        self.create_button.clicked.connect(self.create_button_click)
        layout.addWidget(self.create_button)

        return group

    # ------------------------------------------------------------------
    # 槽函数
    # ------------------------------------------------------------------

    def create_button_click(self):
        u"""点击创建按钮时执行。

        规则：

            没有选中物体     创建一个控制器，放在世界原点
            选中 N 个物体    创建 N 个控制器，按选择顺序逐个对齐
        """

        # orderedSelection=True 表示「按鼠标点击顺序」，
        # 它和 selection=True 互斥，不能同时给。
        selection = cmds.ls(orderedSelection=True) or []
        targets = selection if selection else [None]

        # 名称必须带三位序号，没有就补上 _001
        name = self.ensure_serial(self.name_edit.text().strip())

        created = []

        for target in targets:
            try:
                ctrl = Ctrl.create_ctrl(
                    name,
                    shape=self.get_shape_name(),
                    color=self.color_picker.ctrl_color,
                    size=self.size_picker.ctrl_size,
                    axis=self.axis_combo.currentText(),
                    target=target,
                    hierarchy=self.hierarchy_check.isChecked()
                )
            except Exception as error:
                # 单个失败不影响后面的物体，跳过并继续下一个序号。
                print(u"创建失败（{}）：{}".format(name, error))
                name = self.next_name(name)
                continue

            self.apply_operation(ctrl, [target] if target else [])
            created.append(ctrl.name)
            print(u"已创建：{}".format(ctrl.name))

            name = self.next_name(name)

        # 输入框停在下一个可用名称上，方便连续创建。
        self.name_edit.setText(name)

        if created:
            print(u"本次共创建 {} 个控制器。".format(len(created)))

    @staticmethod
    def ensure_serial(name):
        u"""确保名称以三位序号结尾，没有就补 _001。

        ctrl_md_new_fk      -> ctrl_md_new_fk_001
        ctrl_md_new_fk_007  -> 保持原样
        """

        if not name:
            return "ctrl_001"

        if "_" in name:
            prefix, _, suffix = name.rpartition("_")

            if len(suffix) == 3 and suffix.isdigit():
                return name

        return name + "_001"

    def apply_operation(self, ctrl, selection):
        u"""按选择的处理方式操作当前选中的物体。

        Args:
            ctrl (Ctrl): 刚创建好的控制器。
            selection (list): 创建前记录的选中物体。
        """

        mode = self.operation_combo.currentData()

        if mode == "none":
            return

        if not selection:
            print(u"未选中物体，跳过 {} 处理。".format(mode))
            return

        if mode == "parent":
            ctrl.parent_objects(selection)
            return

        if mode == "cons":
            ctrl.constrain_objects(selection)

    @staticmethod
    def next_name(name):
        u"""把名称末尾的序号加一。

        ctrl_md_new_fk_001 -> ctrl_md_new_fk_002
        名称不以三位数字结尾时，原样返回。
        """

        if "_" not in name:
            return name

        prefix, _, suffix = name.rpartition("_")

        if not (len(suffix) == 3 and suffix.isdigit()):
            return name

        return "{}_{:03d}".format(prefix, int(suffix) + 1)


_window = None


def main():
    global _window

    _window = CreateCtrlWindow()
    _window.show()

    return _window
