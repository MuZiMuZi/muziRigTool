# coding=utf-8
u"""大小选择控件。

界面结构：

    [───●────────]  [ 1.0 ]

    滑块内部用 1~100 表示 0.1~10.0（QSlider 只接受整数），
    右边数字框负责精确输入，两边双向联动。
"""

from PySide2 import QtCore, QtWidgets


class SizePicker(QtWidgets.QWidget):
    u"""大小选择器：滑块 + 数字输入，双向联动。"""

    def __init__(self, parent=None, value=1.0):
        super(SizePicker, self).__init__(parent)

        layout = QtWidgets.QHBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        # 滑块：1 ~ 100 对应 0.1 ~ 10.0
        self.slider = QtWidgets.QSlider(QtCore.Qt.Horizontal)
        self.slider.setRange(1, 100)
        layout.addWidget(self.slider)

        # 数字框：精确输入
        self.spin = QtWidgets.QDoubleSpinBox()
        self.spin.setRange(0.1, 10.0)
        self.spin.setSingleStep(0.1)
        self.spin.setDecimals(1)
        self.spin.setFixedWidth(64)
        layout.addWidget(self.spin)

        # 先设数字，再让滑块跟随，保证初始值一致
        self.spin.setValue(value)
        self.slider.setValue(int(round(value * 10)))

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
