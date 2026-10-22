# coding=utf-8
u"""层级清理工具。

界面结构：

    ┌─ 清理选项 ────────────────────┐
    │ ☑ 删除空组                    │
    │ ☐ 删除 Construction History   │
    │ ☐ 冻结 Transform              │
    │ ☐ 解锁并显示标准属性           │
    │ ☐ 几何体 Pivot 居中            │
    │ ☑ 删除 Unknown 节点            │
    ├─ 执行范围 ────────────────────┤
    │ ☑ 仅处理当前选择               │
    ├───────────────────────────────┤
    │ [          执行清理          ] │
    ├─ 执行结果 ────────────────────┤
    │ 尚未执行                       │
    └───────────────────────────────┘

安全规则：默认相机、Reference、动画、约束、Deformer 都会跳过。
实际清理逻辑在 core.common.scene_utils。
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.common import scene_utils
from ...ui import theme


class HierarchyCleaner(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""层级清理窗口。"""

    def __init__(self, parent=None):
        super(HierarchyCleaner, self).__init__(parent)

        self.setWindowTitle(u"层级清理")
        self.resize(480, 560)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"层级清理"))
        layout.addWidget(theme.make_subtitle(
            u"默认只处理当前选择；高风险操作会跳过动画、约束和 Deformer。"
        ))

        layout.addWidget(self.build_option_section())
        layout.addWidget(self.build_scope_section())

        self.execute_button = QtWidgets.QPushButton(u"执行清理")
        self.execute_button.setStyleSheet(theme.button_style)
        self.execute_button.clicked.connect(self.execute_cleanup)
        layout.addWidget(self.execute_button)

        layout.addWidget(theme.make_section(u"执行结果"))

        self.result_label = QtWidgets.QLabel(u"尚未执行")
        self.result_label.setWordWrap(True)
        self.result_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.result_label)

        layout.addStretch()

    def build_option_section(self):
        u"""清理选项区块。"""

        group = QtWidgets.QGroupBox(u"清理选项")
        layout = QtWidgets.QVBoxLayout(group)

        self.delete_empty_check = QtWidgets.QCheckBox(u"删除空组")
        self.delete_empty_check.setChecked(True)
        layout.addWidget(self.delete_empty_check)

        self.delete_history_check = QtWidgets.QCheckBox(
            u"删除安全范围内的 Construction History"
        )
        layout.addWidget(self.delete_history_check)

        self.freeze_check = QtWidgets.QCheckBox(u"冻结安全范围内的 Transform")
        layout.addWidget(self.freeze_check)

        self.unlock_check = QtWidgets.QCheckBox(
            u"解锁并显示标准 Transform 属性"
        )
        layout.addWidget(self.unlock_check)

        self.center_pivot_check = QtWidgets.QCheckBox(u"几何体 Pivot 居中")
        layout.addWidget(self.center_pivot_check)

        self.delete_unknown_check = QtWidgets.QCheckBox(u"删除 Unknown 节点")
        self.delete_unknown_check.setChecked(True)
        layout.addWidget(self.delete_unknown_check)

        return group

    def build_scope_section(self):
        u"""执行范围区块。"""

        group = QtWidgets.QGroupBox(u"执行范围")
        layout = QtWidgets.QVBoxLayout(group)

        self.selected_only_check = QtWidgets.QCheckBox(u"仅处理当前选择")
        self.selected_only_check.setChecked(True)
        layout.addWidget(self.selected_only_check)

        hint = QtWidgets.QLabel(
            u"全场景模式会扫描所有 Transform，执行前会再次确认。"
            u"仍建议先保存场景。"
        )
        hint.setWordWrap(True)
        hint.setStyleSheet(theme.subtitle_style)
        layout.addWidget(hint)

        return group

    # ------------------------------------------------------------------
    # 执行
    # ------------------------------------------------------------------

    def get_scope_nodes(self):
        u"""返回当前清理范围。"""

        if self.selected_only_check.isChecked():
            return cmds.ls(selection=True, long=True) or []

        return scene_utils.all_transform_nodes()

    def confirm_whole_scene(self):
        u"""全场景模式二次确认。"""

        if self.selected_only_check.isChecked():
            return True

        result = QtWidgets.QMessageBox.warning(
            self,
            u"确认全场景清理",
            u"当前将扫描整个场景。\n\n"
            u"安全规则会跳过 Rig / 动画节点，但仍建议先保存场景。是否继续？",
            QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No,
            QtWidgets.QMessageBox.No
        )

        return result == QtWidgets.QMessageBox.Yes

    def format_result(self, result):
        u"""把统计字典格式化成文本。"""

        lines = []

        if "empty_groups" in result:
            lines.append(u"空组：删除 {}".format(result["empty_groups"]))

        if "history" in result:
            lines.append(u"历史：处理 {} / 跳过 {}".format(
                result["history"]["processed"],
                result["history"]["skipped"]
            ))

        if "freeze" in result:
            lines.append(u"冻结：处理 {} / 跳过 {}".format(
                result["freeze"]["processed"],
                result["freeze"]["skipped"]
            ))

        if "attributes" in result:
            lines.append(u"属性：修改 {} 项".format(result["attributes"]))

        if "pivot" in result:
            lines.append(u"Pivot：处理 {}".format(result["pivot"]))

        if "unknown" in result:
            lines.append(u"Unknown：删除 {}".format(result["unknown"]))

        if not lines:
            lines.append(u"没有启用任何清理选项。")

        return u"\n".join(lines)

    def execute_cleanup(self):
        u"""执行清理。"""

        if not self.confirm_whole_scene():
            return

        nodes = self.get_scope_nodes()
        selected_only = self.selected_only_check.isChecked()

        if selected_only and not nodes:
            self.result_label.setText(u"请先选择需要清理的对象。")
            return

        try:
            result = scene_utils.run_cleanup(
                nodes=nodes,
                selected_only=selected_only,
                delete_empty=self.delete_empty_check.isChecked(),
                delete_history_enabled=self.delete_history_check.isChecked(),
                freeze_enabled=self.freeze_check.isChecked(),
                unlock_enabled=self.unlock_check.isChecked(),
                center_pivot_enabled=self.center_pivot_check.isChecked(),
                delete_unknown_enabled=self.delete_unknown_check.isChecked()
            )
        except Exception as error:
            cmds.warning(str(error))
            self.result_label.setText(u"执行失败：{}".format(error))
            return

        self.result_label.setText(self.format_result(result))


_window = None


def main():
    global _window

    _window = HierarchyCleaner()
    _window.show()

    return _window
