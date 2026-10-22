# coding=utf-8
u"""蒙皮工具。

界面结构：

    ┌─ 复制权重 ────────────────────┐
    │ 选中多个模型，第一个是源        │
    │ [        复制权重          ]  │
    ├─ 编辑 ────────────────────────┤
    │ [选择影响骨骼] [归一化权重]    │
    ├─ 绑定 ────────────────────────┤
    │ 选中骨骼 + 模型（最后一个是模型）│
    │ [        绑定蒙皮          ]  │
    └───────────────────────────────┘

核心操作在 core.deformation.skin_utils。
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.deformation import skin_utils
from ...ui import theme


class SkinTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""蒙皮工具窗口。"""

    def __init__(self, parent=None):
        super(SkinTool, self).__init__(parent)

        self.setWindowTitle(u"蒙皮工具")
        self.resize(440, 460)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"蒙皮工具"))
        layout.addWidget(theme.make_subtitle(
            u"权重复制、影响骨骼、归一化与绑定。"
        ))

        layout.addWidget(self.build_copy_section())
        layout.addWidget(self.build_edit_section())
        layout.addWidget(self.build_bind_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_copy_section(self):
        u"""复制权重复区块。"""

        group = QtWidgets.QGroupBox(u"复制权重")
        layout = QtWidgets.QVBoxLayout(group)

        hint = QtWidgets.QLabel(
            u"选中多个模型，第一个作为源，其余作为目标。"
        )
        hint.setWordWrap(True)
        hint.setStyleSheet(theme.subtitle_style)
        layout.addWidget(hint)

        self.copy_button = QtWidgets.QPushButton(u"复制权重")
        self.copy_button.setStyleSheet(theme.button_style)
        self.copy_button.clicked.connect(self.copy_weights)
        layout.addWidget(self.copy_button)

        return group

    def build_edit_section(self):
        u"""编辑区块。"""

        group = QtWidgets.QGroupBox(u"编辑")
        layout = QtWidgets.QHBoxLayout(group)

        self.influence_button = QtWidgets.QPushButton(u"选择影响骨骼")
        self.influence_button.setStyleSheet(theme.button_style)
        self.influence_button.clicked.connect(self.select_influences)
        layout.addWidget(self.influence_button)

        self.normalize_button = QtWidgets.QPushButton(u"归一化权重")
        self.normalize_button.setStyleSheet(theme.button_style)
        self.normalize_button.clicked.connect(self.normalize_weights)
        layout.addWidget(self.normalize_button)

        return group

    def build_bind_section(self):
        u"""绑定区块。"""

        group = QtWidgets.QGroupBox(u"绑定")
        layout = QtWidgets.QVBoxLayout(group)

        hint = QtWidgets.QLabel(
            u"选中骨骼和模型，最后一个是模型。"
        )
        hint.setWordWrap(True)
        hint.setStyleSheet(theme.subtitle_style)
        layout.addWidget(hint)

        self.bind_button = QtWidgets.QPushButton(u"绑定蒙皮")
        self.bind_button.setStyleSheet(theme.button_style)
        self.bind_button.clicked.connect(self.bind_skin)
        layout.addWidget(self.bind_button)

        return group

    # ------------------------------------------------------------------
    # 逻辑
    # ------------------------------------------------------------------

    def get_selection(self):
        u"""返回当前选择。"""

        return cmds.ls(orderedSelection=True) or []

    def copy_weights(self):
        u"""第一个模型作源，其余作目标。"""

        selection = self.get_selection()

        if len(selection) < 2:
            self.status_label.setText(u"请至少选择两个模型")
            return

        source = selection[0]
        targets = selection[1:]

        try:
            created = skin_utils.copy_skin_weights(source, targets)
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"复制失败：{}".format(error))
            return

        self.status_label.setText(
            u"复制权重：{} 个目标".format(len(created))
        )

    def select_influences(self):
        u"""选中选中模型的影响骨骼。"""

        selection = self.get_selection()

        if not selection:
            self.status_label.setText(u"请先选择模型")
            return

        influences = skin_utils.select_influences(selection)

        if not influences:
            self.status_label.setText(u"这些模型没有蒙皮")
            return

        self.status_label.setText(
            u"已选中 {} 个影响骨骼".format(len(influences))
        )

    def normalize_weights(self):
        u"""归一化权重。"""

        selection = self.get_selection()

        if not selection:
            self.status_label.setText(u"请先选择模型")
            return

        count = 0

        cmds.undoInfo(openChunk=True)

        try:
            for geometry in selection:
                if skin_utils.normalize_skin_weights(geometry):
                    count += 1
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(u"已归一化 {} 个模型".format(count))

    def bind_skin(self):
        u"""绑定蒙皮。

        最后一个选择是模型，其余都当作骨骼。
        """

        selection = self.get_selection()

        if len(selection) < 2:
            self.status_label.setText(u"请选择骨骼和模型")
            return

        joints = selection[:-1]
        geometry = selection[-1]

        try:
            skin_utils.bind_skin(joints, geometry)
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"绑定失败：{}".format(error))
            return

        self.status_label.setText(
            u"绑定蒙皮：{} 个骨骼 → {}".format(len(joints), geometry)
        )


_window = None


def main():
    global _window

    _window = SkinTool()
    _window.show()

    return _window
