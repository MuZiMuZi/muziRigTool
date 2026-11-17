# coding=utf-8
u"""inverse shape target
给 blendShape 添加 inverse shape target（添加前会清空已有权重再算）。"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core import pose_driver_utils


class InverseShapeTool(MayaQWidgetBaseMixin, QtWidgets.QDialog):
    u"""inverse shape target 工具窗口。"""

    def __init__(self, parent=None):
        super(InverseShapeTool, self).__init__(parent)

        self.setWindowTitle(u"inverse shape target")
        self.setMinimumWidth(440)

        hint = QtWidgets.QLabel(
            u"选中两个 mesh（传递 / 目标），填 blendShape 节点名。"
            u"添加前会临时清空已有 target 权重再计算。"
        )
        hint.setWordWrap(True)

        self.blendshape_field = QtWidgets.QLineEdit()
        self.blendshape_field.setPlaceholderText(u"blendShape 节点名")

        self.target_field = QtWidgets.QLineEdit()
        self.target_field.setPlaceholderText(u"target 名称（可选）")

        add_button = QtWidgets.QPushButton(u"添加 inverse target")
        add_button.clicked.connect(self.add_target)

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setWordWrap(True)

        layout = QtWidgets.QVBoxLayout(self)
        layout.addWidget(hint)
        layout.addWidget(self.blendshape_field)
        layout.addWidget(self.target_field)
        layout.addWidget(add_button)
        layout.addWidget(self.status_label)

    def add_target(self):
        u"""给 BS 添加 inverse shape target。"""

        selection = cmds.ls(selection=True) or []

        if len(selection) != 2:
            self.status_label.setText(u"先选中两个 mesh（传递 / 目标）")
            return

        bsname = self.blendshape_field.text().strip()

        if not bsname:
            self.status_label.setText(u"先填 blendShape 节点名")
            return

        try:
            plug = pose_driver_utils.add_inverse_shape_target(
                bsname,
                selection[0],
                selection[1],
                self.target_field.text().strip() or None,
            )
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"添加失败：{}".format(error))
            return

        self.status_label.setText(u"已添加 target：{}".format(plug))


_window = None


def main():
    u"""工具箱入口。"""

    global _window

    _window = InverseShapeTool(parent=None)
    _window.show()

    return _window
