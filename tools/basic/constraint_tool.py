# coding=utf-8
u"""约束工具。

选择模式：

    多对一      前 N 个是 Driver，最后一个是 Driven
    一对多      第一个是 Driver，其余都是 Driven

界面结构：

    ┌─ 选择模式 ────────────────────┐
    │ ◉ 多对一   ○ 一对多            │
    │ ☑ 保持偏移                    │
    ├─ 创建约束 ────────────────────┤
    │ [Parent] [Point] [Orient]     │
    │ [Scale]  [Aim]   [PoleVector] │
    ├─ 管理 ────────────────────────┤
    │ [选择约束] [删除约束]          │
    └───────────────────────────────┘
    状态：就绪
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.rigging import constraint_utils
from ...ui import theme


class ConstraintTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""约束工具窗口。"""

    def __init__(self, parent=None):
        super(ConstraintTool, self).__init__(parent)

        self.setWindowTitle(u"约束工具")
        self.resize(460, 420)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"约束工具"))
        layout.addWidget(theme.make_subtitle(
            u"多对一：最后一个选择是目标。一对多：第一个选择是驱动。"
        ))

        layout.addWidget(self.build_mode_section())
        layout.addWidget(self.build_create_section())
        layout.addWidget(self.build_manage_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_mode_section(self):
        u"""选择模式区块。"""

        group = QtWidgets.QGroupBox(u"选择模式")
        layout = QtWidgets.QVBoxLayout(group)

        row = QtWidgets.QHBoxLayout()

        self.multi_to_one_radio = QtWidgets.QRadioButton(u"多对一")
        self.multi_to_one_radio.setChecked(True)
        row.addWidget(self.multi_to_one_radio)

        self.one_to_multi_radio = QtWidgets.QRadioButton(u"一对多")
        row.addWidget(self.one_to_multi_radio)

        row.addStretch()
        layout.addLayout(row)

        self.maintain_offset_check = QtWidgets.QCheckBox(u"保持当前偏移")
        self.maintain_offset_check.setChecked(True)
        layout.addWidget(self.maintain_offset_check)

        return group

    def build_create_section(self):
        u"""创建约束区块。"""

        group = QtWidgets.QGroupBox(u"创建约束")
        layout = QtWidgets.QGridLayout(group)

        standard = [
            (u"Parent", "parentConstraint"),
            (u"Point", "pointConstraint"),
            (u"Orient", "orientConstraint"),
            (u"Scale", "scaleConstraint"),
            (u"Aim", "aimConstraint"),
        ]

        for index, (label, constraint_type) in enumerate(standard):
            button = QtWidgets.QPushButton(label)
            button.setStyleSheet(theme.button_style)
            button.clicked.connect(
                lambda checked=False, value=constraint_type: self.create_standard(value)
            )
            layout.addWidget(button, index // 3, index % 3)

        self.pole_button = QtWidgets.QPushButton(u"PoleVector")
        self.pole_button.setStyleSheet(theme.button_style)
        self.pole_button.clicked.connect(self.create_pole_vector)
        layout.addWidget(self.pole_button, 1, 2)

        return group

    def build_manage_section(self):
        u"""约束管理区块。"""

        group = QtWidgets.QGroupBox(u"管理")
        layout = QtWidgets.QHBoxLayout(group)

        self.select_button = QtWidgets.QPushButton(u"选择约束")
        self.select_button.setStyleSheet(theme.button_style)
        self.select_button.clicked.connect(self.select_constraints)
        layout.addWidget(self.select_button)

        self.delete_button = QtWidgets.QPushButton(u"删除约束")
        self.delete_button.setStyleSheet(theme.button_style)
        self.delete_button.clicked.connect(self.delete_constraints)
        layout.addWidget(self.delete_button)

        return group

    # ------------------------------------------------------------------
    # 逻辑
    # ------------------------------------------------------------------

    def get_driver_and_driven(self):
        u"""按当前模式拆分 Driver / Driven。

        Returns:
            tuple: (drivers, driven_objects)
        """

        selection = cmds.ls(selection=True, long=True) or []

        if len(selection) < 2:
            cmds.warning(u"请至少选择两个物体。")
            return [], []

        if self.multi_to_one_radio.isChecked():
            # 前面的都是 Driver，最后一个是 Driven
            return selection[:-1], [selection[-1]]

        # 第一个是 Driver，其余都是 Driven
        return [selection[0]], selection[1:]

    def create_standard(self, constraint_type):
        u"""创建标准约束。"""

        drivers, drivens = self.get_driver_and_driven()

        if not drivers or not drivens:
            return

        maintain_offset = self.maintain_offset_check.isChecked()
        created = 0

        cmds.undoInfo(openChunk=True)

        try:
            for driven in drivens:
                try:
                    constraint_utils.create_constraint(
                        driver_objects=drivers,
                        driven_object=driven,
                        constraint_type=constraint_type,
                        maintain_offset=maintain_offset
                    )
                    created += 1
                except (RuntimeError, ValueError) as error:
                    cmds.warning(str(error))
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(
            u"{}：为 {} 个目标创建约束".format(constraint_type, created)
        )

    def create_pole_vector(self):
        u"""创建极向量约束。"""

        selection = cmds.ls(selection=True, long=True) or []

        if len(selection) != 2:
            cmds.warning(u"极向量需要恰好两个选择：控制器 -> IK Handle。")
            return

        cmds.undoInfo(openChunk=True)

        try:
            constraint_utils.create_pole_vector_constraint(
                driver_object=selection[0],
                ik_handle=selection[1]
            )
        except RuntimeError as error:
            cmds.warning(str(error))
            return
        finally:
            cmds.undoInfo(closeChunk=True)

        self.status_label.setText(u"极向量约束已创建")

    def select_constraints(self):
        u"""选中当前对象身上的约束。"""

        selection = cmds.ls(selection=True, long=True) or []

        if not selection:
            self.status_label.setText(u"请先选择对象")
            return

        constraints = constraint_utils.get_constraints(selection)

        if not constraints:
            self.status_label.setText(u"这些对象身上没有约束")
            return

        cmds.select(constraints, replace=True)
        self.status_label.setText(u"已选中 {} 个约束".format(len(constraints)))

    def delete_constraints(self):
        u"""删除当前对象身上的约束。"""

        selection = cmds.ls(selection=True, long=True) or []

        if not selection:
            self.status_label.setText(u"请先选择对象")
            return

        deleted = constraint_utils.delete_constraints(selection)
        self.status_label.setText(u"已删除 {} 个约束".format(deleted))


_window = None


def main():
    global _window

    _window = ConstraintTool()
    _window.show()

    return _window
