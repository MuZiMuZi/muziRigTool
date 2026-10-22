# coding=utf-8
u"""创建控制器工具。"""

import os

from PySide2 import QtCore, QtGui, QtWidgets

from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.rigging.ctrl_utils import Ctrl


# Maya 的 32 个 override color（RGB 0~1）
# 数据来自旧库 ui/widgets/color_index_slider.py，经过生产验证。
maya_colors = {
    0: (0.467, 0.467, 0.467),   # 深灰
    1: (0.000, 0.000, 0.000),   # 黑
    2: (0.200, 0.200, 0.200),   # 深灰
    3: (0.600, 0.600, 0.600),   # 中灰
    4: (0.800, 0.000, 0.000),   # 暗红
    5: (0.000, 0.000, 0.400),   # 深蓝
    6: (0.000, 0.000, 1.000),   # 蓝
    7: (0.000, 0.400, 0.000),   # 深绿
    8: (0.200, 0.000, 0.400),   # 紫
    9: (0.800, 0.400, 0.000),   # 橙
    10: (0.600, 0.400, 0.200),  # 棕
    11: (0.400, 0.200, 0.000),  # 深棕
    12: (1.000, 1.000, 0.000),  # 黄
    13: (1.000, 0.000, 0.000),  # 红
    14: (0.000, 1.000, 0.000),  # 绿
    15: (0.000, 1.000, 1.000),  # 青
    16: (1.000, 1.000, 1.000),  # 白
    17: (1.000, 1.000, 0.000),  # 黄
    18: (0.000, 0.800, 1.000),  # 亮蓝
    19: (1.000, 0.600, 0.800),  # 粉
    20: (1.000, 0.400, 0.400),  # 淡红
    21: (0.600, 1.000, 0.400),  # 黄绿
    22: (1.000, 0.800, 0.400),  # 橙黄
    23: (0.400, 0.600, 1.000),  # 蓝紫
    24: (1.000, 1.000, 1.000),  # 白
    25: (1.000, 1.000, 0.800),  # 米白
    26: (0.800, 1.000, 0.800),  # 淡绿
    27: (0.800, 1.000, 1.000),  # 淡青
    28: (1.000, 0.800, 1.000),  # 淡紫
    29: (1.000, 0.600, 0.600),  # 淡粉
    30: (0.800, 1.000, 0.600),  # 浅黄绿
    31: (0.600, 0.800, 1.000),  # 浅蓝
}


class ColorPicker(QtWidgets.QWidget):
    u"""颜色选择器：滑块 + 色块预览 + 索引数字。"""

    def __init__(self, parent=None):
        super(ColorPicker, self).__init__(parent)

        layout = QtWidgets.QHBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        # 滑块：0 ~ 31
        self.slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.slider.setRange(0, 31)
        self.slider.setValue(17)
        layout.addWidget(self.slider)

        # 色块：背景色动态更新
        self.preview = QtWidgets.QLabel()
        self.preview.setFixedSize(36, 22)
        layout.addWidget(self.preview)

        # 数字：显示当前索引
        self.index_label = QtWidgets.QLabel("17")
        self.index_label.setFixedWidth(24)
        layout.addWidget(self.index_label)

        self.slider.valueChanged.connect(self.update_preview)
        self.update_preview(self.slider.value())

    @property
    def ctrl_color(self):
        u"""当前颜色索引。"""

        return self.slider.value()

    def update_preview(self, index):
        u"""按索引刷新色块和数字。"""

        red, green, blue = maya_colors[index]
        color = QtGui.QColor.fromRgbF(red, green, blue)

        self.preview.setStyleSheet(
            "background-color: {}; border: 1px solid #555555;".format(color.name())
        )
        self.index_label.setText(str(index))


class SizePicker(QtWidgets.QWidget):
    u"""大小选择器：滑块 + 数字输入，双向联动。"""

    def __init__(self, parent=None):
        super(SizePicker, self).__init__(parent)

        layout = QtWidgets.QHBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        # 滑块内部用 1 ~ 100 表示 0.1 ~ 10.0（QSlider 只接受整数）
        self.slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.slider.setRange(1, 100)
        self.slider.setValue(10)
        layout.addWidget(self.slider)

        # 数字框：精确输入
        self.spin = QtWidgets.QDoubleSpinBox()
        self.spin.setRange(0.1, 10.0)
        self.spin.setSingleStep(0.1)
        self.spin.setDecimals(1)
        self.spin.setValue(1.0)
        self.spin.setFixedWidth(64)
        layout.addWidget(self.spin)

        self.slider.valueChanged.connect(self.on_slider_changed)
        self.spin.valueChanged.connect(self.on_spin_changed)

    @property
    def ctrl_size(self):
        u"""当前大小。"""

        return self.spin.value()

    def on_slider_changed(self, value):
        u"""滑块动了，更新数字框。"""

        # 屏蔽信号，避免数字框回写滑块造成循环触发
        self.spin.blockSignals(True)
        self.spin.setValue(value / 10.0)
        self.spin.blockSignals(False)

    def on_spin_changed(self, value):
        u"""数字框改了，同步滑块。"""

        self.slider.blockSignals(True)
        self.slider.setValue(int(round(value * 10)))
        self.slider.blockSignals(False)


class CreateCtrlWindow(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""创建控制器的工具窗口。"""

    def __init__(self, parent=None):
        super(CreateCtrlWindow, self).__init__(parent)

        self.setWindowTitle(u"创建控制器")
        self.resize(360, 380)

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
        u"""形状区块。"""

        group = QtWidgets.QGroupBox(u"形状")
        layout = QtWidgets.QHBoxLayout(group)

        self.shape_combo = QtWidgets.QComboBox()
        self.shape_combo.addItems(self.get_shape_names())
        self.shape_combo.setCurrentText("circle")
        layout.addWidget(self.shape_combo)

        return group

    @staticmethod
    def get_shape_names():
        u"""读取形状库目录，返回所有形状名称。"""

        names = []

        for file_name in sorted(os.listdir(Ctrl.shape_dir)):
            if file_name.endswith(".json"):
                names.append(os.path.splitext(file_name)[0])

        return names

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
        u"""操作区块。"""

        group = QtWidgets.QGroupBox(u"操作")
        layout = QtWidgets.QVBoxLayout(group)

        self.create_button = QtWidgets.QPushButton(u"创建")
        self.create_button.clicked.connect(self.create_button_click)
        layout.addWidget(self.create_button)

        return group

    # ------------------------------------------------------------------
    # 槽函数
    # ------------------------------------------------------------------

    def create_button_click(self):
        u"""点击创建按钮时执行。"""

        name = self.name_edit.text().strip()

        try:
            ctrl = Ctrl.create_ctrl(
                name,
                shape=self.shape_combo.currentText(),
                color=self.color_picker.ctrl_color,
                size=self.size_picker.ctrl_size
            )
        except Exception as error:
            # 失败时把原因打印出来，不弹窗打断操作。
            print(u"创建失败：{}".format(error))
            return

        print(u"已创建：{}".format(ctrl.name))

        # 名称序号自动加一，方便连续创建。
        self.name_edit.setText(self.next_name(name))

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
