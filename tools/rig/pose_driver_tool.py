# coding=utf-8
u"""ADV 姿态驱动修型工具：一键生成 / 删除。

自动扫描场景里的 ADV 标准关节，按部位生成修型属性；
不需要手动选轴、选方向或调阈值。

界面只有两个动作：

    ┌─ 姿态驱动修型（ADV）────────────────┐
    │ 自动扫描 ADV 标准关节。              │
    │ [生成全部] [删除全部]                │
    │ 状态：…                              │
    └──────────────────────────────────────┘

核心逻辑在 core.pose_driver_utils。
"""

from PySide2 import QtWidgets

from maya import cmds

from ...core import pose_driver_utils


class PoseDriverTool(QtWidgets.QDialog):
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

        buttons = QtWidgets.QHBoxLayout()
        buttons.addWidget(build_button)
        buttons.addWidget(delete_button)

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

        message = u"已生成 {} 个部位".format(len(results))

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


_window = None


def main():
    u"""工具箱入口。"""

    global _window

    _window = PoseDriverTool(parent=None)
    _window.show()

    return _window
