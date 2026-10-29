# coding=utf-8
u"""姿态驱动修型。

一键扫描场景里所有支持八方向的关节（Shoulder / Hip），
按 ADV 命名自动归类，在对应汇总组上创建分隔属性与 8 个方向属性。

界面结构：

    ┌─ 源 ──────────────────────────────┐
    │ 目标关节  Shoulder_L, Hip_L … [刷新] │
    ├─ 姿态 ────────────────────────────┤
    │ A 轴 [rotateY ▼]  B 轴 [rotateZ ▼] │
    │ 阈值角度 [45.0]                    │
    ├─ 方向 ────────────────────────────┤
    │ ☑ 上抬  ☑ 下压  ☑ 前摆  ☑ 后摆     │
    │ ☑ 前上  ☑ 前下  ☑ 后上  ☑ 后下     │
    ├─ 动作 ────────────────────────────┤
    │ [生成全部] [删除全部]               │
    └────────────────────────────────────┘

汇总组：

    grp_md_arm_pose_001      Shoulder_L / Shoulder_R
    grp_md_spine_pose_001    （v2）
    grp_md_leg_pose_001      Hip_L / Hip_R
    grp_md_finger_pose_001   手指（v2）

其他部位（Elbow / Wrist / Knee / Ankle / Spine / Chest）本轮跳过，
等 v2 按单轴多角度、扭转等模式实现。

核心逻辑在 core.deformation.pose_driver_utils。
"""

from PySide2 import QtCore, QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.deformation import pose_driver_utils
from ...core.deformation import pose_gate_math
from ...ui import theme


class PoseDriverTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""姿态驱动修型窗口。"""

    def __init__(self, parent=None):
        super(PoseDriverTool, self).__init__(parent)

        self.setWindowTitle(u"姿态驱动修型")
        self.resize(540, 580)

        self.direction_checks = {}

        self.build_ui()
        self.refresh_joint_list()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"姿态驱动修型"))
        layout.addWidget(theme.make_subtitle(
            u"按 ADV 固定关节名，一键生成 Shoulder / Hip 的方向属性。"
        ))

        layout.addWidget(self.build_source_section())
        layout.addWidget(self.build_pose_section())
        layout.addWidget(self.build_direction_section())
        layout.addWidget(self.build_action_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setWordWrap(True)
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_source_section(self):
        u"""源区块：只读显示扫描到的关节。"""

        group = QtWidgets.QGroupBox(u"源")
        layout = QtWidgets.QVBoxLayout(group)

        self.joint_list_label = QtWidgets.QLabel(u"扫描中…")
        self.joint_list_label.setWordWrap(True)
        self.joint_list_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.joint_list_label)

        self.refresh_button = QtWidgets.QPushButton(u"刷新关节列表")
        self.refresh_button.setStyleSheet(theme.button_style)
        self.refresh_button.clicked.connect(self.refresh_joint_list)
        layout.addWidget(self.refresh_button)

        return group

    def build_pose_section(self):
        u"""姿态区块：两根轴与阈值。"""

        group = QtWidgets.QGroupBox(u"姿态")
        form = QtWidgets.QFormLayout(group)
        form.setLabelAlignment(QtCore.Qt.AlignRight)

        self.axis_a_combo = self._make_axis_combo(1)
        self.axis_b_combo = self._make_axis_combo(2)

        axis_row = QtWidgets.QHBoxLayout()
        axis_row.addWidget(self.axis_a_combo)
        axis_row.addWidget(self.axis_b_combo)

        self.angle_spin = QtWidgets.QDoubleSpinBox()
        self.angle_spin.setRange(1.0, 180.0)
        self.angle_spin.setDecimals(1)
        self.angle_spin.setSingleStep(5.0)
        self.angle_spin.setValue(pose_driver_utils.default_angle)
        self.angle_spin.setToolTip(
            u"转到这个角度时方向门达到 1；超过后保持 1。"
        )

        self.back_angle_spin = QtWidgets.QDoubleSpinBox()
        self.back_angle_spin.setRange(1.0, 180.0)
        self.back_angle_spin.setDecimals(1)
        self.back_angle_spin.setSingleStep(5.0)
        self.back_angle_spin.setValue(pose_driver_utils.default_back_angle)
        self.back_angle_spin.setToolTip(
            u"后摆方向单独用这个阈值，默认 70°。"
        )

        form.addRow(u"A / B 轴", axis_row)
        form.addRow(u"阈值角度", self.angle_spin)
        form.addRow(u"后摆角度", self.back_angle_spin)

        return group

    def build_direction_section(self):
        u"""方向区块：8 个勾选框。"""

        group = QtWidgets.QGroupBox(u"方向")
        grid = QtWidgets.QGridLayout(group)

        for index, name in enumerate(pose_gate_math.direction_list):
            check = QtWidgets.QCheckBox(
                u"{} ({})".format(
                    pose_gate_math.direction_labels[name], name
                )
            )
            check.setChecked(True)

            self.direction_checks[name] = check
            grid.addWidget(check, index // 4, index % 4)

        return group

    def build_action_section(self):
        u"""动作区块。"""

        group = QtWidgets.QGroupBox(u"动作")
        layout = QtWidgets.QVBoxLayout(group)

        button_row = QtWidgets.QHBoxLayout()

        self.build_button = QtWidgets.QPushButton(u"生成全部")
        self.build_button.setStyleSheet(theme.button_style)
        self.build_button.clicked.connect(self.build_all)

        self.delete_button = QtWidgets.QPushButton(u"删除全部")
        self.delete_button.setStyleSheet(theme.button_style)
        self.delete_button.clicked.connect(self.delete_all)

        button_row.addWidget(self.build_button)
        button_row.addWidget(self.delete_button)

        layout.addLayout(button_row)

        hint = QtWidgets.QLabel(
            u"生成后属性挂在汇总组上；删除只清属性与节点，组保留。"
        )
        hint.setWordWrap(True)
        hint.setStyleSheet(theme.subtitle_style)
        layout.addWidget(hint)

        return group

    def _make_axis_combo(self, default_index):
        u"""创建旋转轴下拉框。"""

        combo = QtWidgets.QComboBox()

        for axis in pose_driver_utils.axis_list:
            combo.addItem(axis, axis)

        combo.setCurrentIndex(default_index)

        return combo

    # ------------------------------------------------------------------
    # 刷新
    # ------------------------------------------------------------------

    def refresh_joint_list(self):
        u"""重新扫描场景里的目标关节。"""

        try:
            items = pose_driver_utils.find_supported_joints()
        except Exception as error:
            self.joint_list_label.setText(u"扫描失败：{}".format(error))
            return

        names = [item["short"] for item in items]

        if names:
            self.joint_list_label.setText(
                u"找到 {} 个：{}".format(len(names), u", ".join(names))
            )
        else:
            self.joint_list_label.setText(
                u"场景里没有 Shoulder / Hip 关节"
            )

    # ------------------------------------------------------------------
    # 动作
    # ------------------------------------------------------------------

    def collect_settings(self):
        u"""收集界面参数。

        Returns:
            dict: axes / angle / directions。

        Raises:
            RuntimeError: 轴对重复，或没有勾选方向。
        """

        axes = (
            self.axis_a_combo.currentData(),
            self.axis_b_combo.currentData(),
        )

        if axes[0] == axes[1]:
            raise RuntimeError(u"A 轴和 B 轴不能相同。")

        directions = [
            name for name in pose_gate_math.direction_list
            if self.direction_checks[name].isChecked()
        ]

        if not directions:
            raise RuntimeError(u"至少要勾选一个方向。")

        return {
            "axes": axes,
            "angle": self.angle_spin.value(),
            "angle_map": {"back": self.back_angle_spin.value()},
            "directions": directions,
        }

    def build_all(self):
        u"""给场景里所有支持八方向的关节生成属性。"""

        try:
            settings = self.collect_settings()
            results, errors = pose_driver_utils.build_all_supported(
                axes=settings["axes"],
                angle=settings["angle"],
                angle_map=settings["angle_map"],
                directions=settings["directions"],
            )
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"生成失败：{}".format(error))
            return

        self.refresh_joint_list()

        message = u"已生成 {} 个部位".format(len(results))

        if errors:
            message += u"；失败 {} 个：{}".format(
                len(errors), errors[0][1]
            )
            cmds.warning(u"\n".join(
                u"{}：{}".format(name, error) for name, error in errors
            ))

        self.status_label.setText(message)

    def delete_all(self):
        u"""删除四个汇总组上的全部部位。"""

        try:
            removed = pose_driver_utils.delete_all_parts()
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"删除失败：{}".format(error))
            return

        self.refresh_joint_list()
        self.status_label.setText(u"已删除 {} 个部位，组保留".format(removed))


_window = None


def main():
    global _window

    _window = PoseDriverTool()
    _window.show()

    return _window
