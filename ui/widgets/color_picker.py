# coding=utf-8
u"""Maya 颜色索引选择控件。

界面结构：

    [────────●────────]  [色块]  [17]

    滑块 0~31 选索引，色块预览，右边显示数字。

注意：色块是按 Maya 的标准 index color 表画的近似色，
视口有光照和色彩管理，实际显示会略有差异，精确值看数字。
"""

from PySide2 import QtCore, QtGui, QtWidgets


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

    def __init__(self, parent=None, value=17):
        super(ColorPicker, self).__init__(parent)

        layout = QtWidgets.QHBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        # 滑块：0 ~ 31
        self.slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.slider.setRange(0, 31)
        self.slider.setValue(value)
        layout.addWidget(self.slider)

        # 色块：背景色动态更新
        self.preview = QtWidgets.QLabel()
        self.preview.setFixedSize(36, 22)
        layout.addWidget(self.preview)

        # 数字：显示当前索引
        self.index_label = QtWidgets.QLabel()
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
