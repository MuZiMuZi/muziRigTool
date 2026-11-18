# coding=utf-8
u"""姿态驱动修型
ADV 版：一键生成 / 删除 / 连接 BS。

自动扫描场景里的 ADV 标准关节，按部位生成修型属性；
不需要手动选轴、选方向或调阈值。

核心逻辑在 core.pose_driver_utils。
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core import pose_driver_utils


class PoseDriverTool(MayaQWidgetBaseMixin, QtWidgets.QDialog):
    u"""ADV 版修型驱动窗口。"""

    def __init__(self, parent=None):
        super(PoseDriverTool, self).__init__(parent)

        self.setWindowTitle(u"姿态驱动修型（ADV）")
        self.setMinimumWidth(380)

        hint = QtWidgets.QLabel(
            u"自动扫描 ADV 标准关节，按部位生成修型属性。"
        )
        hint.setWordWrap(True)

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setWordWrap(True)

        build_button = QtWidgets.QPushButton(u"生成全部")
        build_button.clicked.connect(self.build_all)

        delete_button = QtWidgets.QPushButton(u"删除全部")
        delete_button.clicked.connect(self.delete_all)

        connect_button = QtWidgets.QPushButton(u"连接 BS")
        connect_button.clicked.connect(self.connect_blendshapes)

        buttons = QtWidgets.QHBoxLayout()
        buttons.addWidget(build_button)
        buttons.addWidget(delete_button)
        buttons.addWidget(connect_button)

        layout = QtWidgets.QVBoxLayout(self)
        layout.addWidget(hint)
        layout.addLayout(buttons)
        layout.addWidget(self.status_label)

    def build_all(self):
        u"""一键生成全部部位。"""

        try:
            results, errors = pose_driver_utils.build_all_supported()
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"生成失败：{}".format(error))
            return

        recorded = 0

        try:
            recorded = pose_driver_utils.discover_blendshapes()
        except Exception as error:
            cmds.warning(str(error))

        message = u"已生成 {} 个部位".format(len(results))

        if recorded:
            message += u"，{} 个部位记录了 BS".format(recorded)

        if errors:
            message += u"，失败 {} 个".format(len(errors))
            cmds.warning(str(errors))

        self.status_label.setText(message)

    def delete_all(self):
        u"""一键删除全部部位（组一起删）。"""

        try:
            removed = pose_driver_utils.delete_all_parts()
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"删除失败：{}".format(error))
            return

        self.status_label.setText(
            u"已删除 {} 个部位（组一起删除）".format(removed)
        )

    def connect_blendshapes(self):
        u"""按名字把修型属性连到 blendShape target 权重。"""

        try:
            connected, missing = (
                pose_driver_utils.connect_attributes_to_blendshapes()
            )
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"连接失败：{}".format(error))
            return

        message = u"已连接 {} 个属性到 BS".format(connected)

        if missing:
            message += u"，{} 个没匹配到 target".format(len(missing))

        self.status_label.setText(message)


_window = None


def main():
    u"""工具箱入口。"""

    global _window

    _window = PoseDriverTool(parent=None)
    _window.show()

    return _window
