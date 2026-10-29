# coding=utf-8
u"""Jntbas 基准关节工具。

为次级控制器链里的每根 ``jnt_*`` 在 ``zero_*`` 下创建同位置的
``jntbas_*``，并把 ``jntbas.worldInverseMatrix`` 接到对应
``skinCluster.bindPreMatrix[i]``，用来消掉父级移动造成的双倍位移。

层级约定：

    uvpin_*
    └ zero_*
      ├ jntbas_*        ← 同位置、同朝向的兄弟
      └ driven_* / ... / ctrl_*
            └ output_*
              └ jnt_*

使用：

    处理全部 jnt_*       扫描全场 jnt_*，只处理 zero_* 下且被 skin 使用的
    处理选中 jnt_*       只处理当前选中的 jnt_*

注意：建议在绑定姿态 / rest pose 下执行，确保 zero_* 与 uvpin_* 也在
绑定姿态；jntbas 的绑定世界矩阵会优先从 bindPreMatrix 反推。
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.rigging import jntbas_utils
from ...ui import theme


class JntbasTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""Jntbas 基准关节工具窗口。"""

    def __init__(self, parent=None):
        super(JntbasTool, self).__init__(parent)

        self.setWindowTitle(u"Jntbas 基准关节工具")
        self.resize(460, 360)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"Jntbas 基准关节工具"))
        layout.addWidget(theme.make_subtitle(
            u"在 zero_* 下创建同位置的 jntbas_*，接 skinCluster 的 "
            u"bindPreMatrix，消掉父级移动造成的双倍位移。"
        ))

        layout.addWidget(self.build_info_section())
        layout.addWidget(self.build_action_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        self.status_label.setWordWrap(True)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_info_section(self):
        u"""说明区块。"""

        group = QtWidgets.QGroupBox(u"处理约定")
        layout = QtWidgets.QVBoxLayout(group)

        info = QtWidgets.QLabel(
            u"只处理 zero_* 下、且被 skinCluster 使用的 jnt_*。\n"
            u"jntbas_* 与 jnt_* 同位置、同朝向，作为兄弟挂在 zero_* 下。"
        )
        info.setWordWrap(True)
        info.setStyleSheet(theme.subtitle_style)
        layout.addWidget(info)

        return group

    def build_action_section(self):
        u"""操作区块。"""

        group = QtWidgets.QGroupBox(u"操作")
        layout = QtWidgets.QVBoxLayout(group)

        self.all_button = QtWidgets.QPushButton(u"处理全部 jnt_*")
        self.all_button.setStyleSheet(theme.button_style)
        self.all_button.clicked.connect(self.run_all)
        layout.addWidget(self.all_button)

        self.selected_button = QtWidgets.QPushButton(u"处理选中 jnt_*")
        self.selected_button.setStyleSheet(theme.button_style)
        self.selected_button.clicked.connect(self.run_selected)
        layout.addWidget(self.selected_button)

        return group

    # ------------------------------------------------------------------
    # 逻辑
    # ------------------------------------------------------------------

    @staticmethod
    def get_selected_joints():
        u"""返回当前选择中的 jnt_* 骨骼 Long Path。"""

        selected = cmds.ls(selection=True, long=True) or []
        joints = []

        for node in selected:
            if cmds.nodeType(node) != "joint":
                continue

            if not jntbas_utils.get_short_name(node).startswith("jnt_"):
                continue

            joints.append(cmds.ls(node, long=True)[0])

        return joints

    def run_all(self):
        u"""处理全场 jnt_*。"""

        self.run(None)

    def run_selected(self):
        u"""只处理选中的 jnt_*。"""

        joints = self.get_selected_joints()

        if not joints:
            cmds.warning(u"请先选择至少一根 jnt_* 骨骼。")
            self.status_label.setText(u"未选择 jnt_* 骨骼")
            return

        self.run(joints)

    def run(self, joints):
        u"""执行 jntbas 创建与 bindPreMatrix 连接。

        Args:
            joints (list | None): 要处理的骨骼；None 表示全场。
        """

        self.status_label.setText(u"处理中...")
        cmds.undoInfo(openChunk=True, chunkName="MuziBuildJntBas")

        try:
            result = jntbas_utils.build_jntbas(joints=joints)
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"处理失败：{}".format(error))
            return
        finally:
            cmds.undoInfo(closeChunk=True)

        self.report(result)

    def report(self, result):
        u"""把处理结果写到状态栏。"""

        created = result["created"]
        reused = result["reused"]
        linked = result["linked"]
        conflicts = result["conflicts"]
        skipped = result["skipped"]
        failed = result["failed"]

        for item in conflicts:
            cmds.warning(
                u"bindPreMatrix 已有其他连接，跳过 {} / {}：{}".format(
                    item["joint"],
                    item["index"],
                    item["existing"]
                )
            )

        for item in failed:
            cmds.warning(
                u"处理失败 {}：{}".format(
                    item["joint"],
                    item["error"]
                )
            )

        self.status_label.setText(
            u"新建 {}，复用 {}，连接 {}，冲突 {}，跳过 {}，失败 {}".format(
                len(created),
                len(reused),
                len(linked),
                len(conflicts),
                len(skipped),
                len(failed)
            )
        )


_window = None


def main():
    u"""打开 Jntbas 基准关节工具。

    Returns:
        JntbasTool: 当前工具窗口。
    """

    global _window

    _window = JntbasTool()
    _window.show()

    return _window
