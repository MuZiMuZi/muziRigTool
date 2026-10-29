# coding=utf-8
"""RBF 版姿态驱动修型工具窗口。"""

from maya import cmds
from PySide2 import QtWidgets

from ...core.deformation import rbf_pose_driver_utils


class RbfPoseDriverTool(QtWidgets.QDialog):
    u"""RBF 修型驱动窗口：一键生成 / 删除。"""

    def __init__(self, parent=None):
        super(RbfPoseDriverTool, self).__init__(parent)

        self.setWindowTitle(u"RBF 姿态驱动修型")
        self.setMinimumWidth(420)

        self.summary_label = QtWidgets.QLabel(u"")
        self.summary_label.setWordWrap(True)

        build_button = QtWidgets.QPushButton(u"生成全部")
        build_button.clicked.connect(self.build_all)

        delete_button = QtWidgets.QPushButton(u"删除全部")
        delete_button.clicked.connect(self.delete_all)

        buttons = QtWidgets.QHBoxLayout()
        buttons.addWidget(build_button)
        buttons.addWidget(delete_button)

        hint = QtWidgets.QLabel(
            u"独立工具：输出到 grp_rbf_* 组，与方向门控版互不影响。"
        )
        hint.setWordWrap(True)

        layout = QtWidgets.QVBoxLayout(self)
        layout.addWidget(self.summary_label)
        layout.addWidget(hint)
        layout.addLayout(buttons)

        self.refresh()

    def refresh(self):
        u"""刷新支持部位摘要。"""

        try:
            found = rbf_pose_driver_utils.find_supported_rbf_joints()
        except Exception as error:
            self.summary_label.setText(u"读取失败：{}".format(error))
            return

        if not found:
            self.summary_label.setText(
                u"场景里没有找到可用的 ADV 关节。"
            )
            return

        names = [item["joint"] for item in found]
        self.summary_label.setText(
            u"检测到 {} 个部位：\n{}".format(len(names), u"、".join(names))
        )

    def build_all(self):
        u"""生成全部。"""

        results, errors = rbf_pose_driver_utils.build_all_supported()

        message = u"生成 {} 个部位".format(len(results))

        if errors:
            message += u"\n失败：\n" + u"\n".join(
                u"{}：{}".format(name, error) for name, error in errors
            )

        cmds.inViewMessage(
            amg=message, position="midCenter", fade=True
        )
        self.refresh()

    def delete_all(self):
        u"""删除全部。"""

        removed = rbf_pose_driver_utils.delete_all_rbf_parts()
        cmds.inViewMessage(
            amg=u"已删除 {} 个 RBF 部位".format(removed),
            position="midCenter",
            fade=True,
        )
        self.refresh()


def show():
    u"""打开窗口（保持引用，避免被回收）。"""

    dialog = RbfPoseDriverTool(parent=None)
    dialog.show()

    return dialog
