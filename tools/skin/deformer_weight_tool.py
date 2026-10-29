# coding=utf-8
u"""变形器权重转蒙皮。

界面结构：

    ┌─ 源 ──────────────────────────┐
    │ 模型        [             ]   │
    │ 变形器      [             ]   │
    │ 目标骨骼    [             ]   │
    │        [从选择自动识别]        │
    ├─ 参数 ────────────────────────┤
    │ 混合模式 [覆盖 ▼]  强度 [1.0]  │
    │ BlendShape Target [0]         │
    │ ☑ 写入后归一化  ☐ 删除变形器   │
    ├─ 转换 ────────────────────────┤
    │ [      转换权重 → 蒙皮      ]  │
    └───────────────────────────────┘

核心逻辑在 core.deformation.deformer_weight_utils。
"""

from PySide2 import QtCore, QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core.deformation import deformer_weight_utils
from ...core.deformation import weight_math
from ...ui import theme


def parse_names(text):
    u"""把逗号分隔的节点名切成列表，中英文逗号都认。"""

    text = text.replace(u"，", u",")

    return [item.strip() for item in text.split(u",") if item.strip()]


class DeformerWeightTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""变形器权重转蒙皮窗口。"""

    def __init__(self, parent=None):
        super(DeformerWeightTool, self).__init__(parent)

        self.setWindowTitle(u"变形器权重转蒙皮")
        self.resize(460, 560)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"变形器权重转蒙皮"))
        layout.addWidget(theme.make_subtitle(
            u"把变形器上画好的权重，写成 SkinCluster 的目标骨骼权重。"
        ))

        layout.addWidget(self.build_source_section())
        layout.addWidget(self.build_option_section())
        layout.addWidget(self.build_action_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setWordWrap(True)
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_source_section(self):
        u"""来源区块：模型、变形器、目标骨骼。"""

        group = QtWidgets.QGroupBox(u"源")
        form = QtWidgets.QFormLayout(group)
        form.setLabelAlignment(QtCore.Qt.AlignRight)

        self.mesh_edit = self._make_edit(u"带 SkinCluster 的模型")
        self.deformer_edit = self._make_edit(
            u"变形器节点，批量时用逗号分隔"
        )
        self.joint_edit = self._make_edit(
            u"接收权重的骨骼，与变形器一一对应"
        )

        form.addRow(u"模型", self.mesh_edit)
        form.addRow(u"变形器", self.deformer_edit)
        form.addRow(u"目标骨骼", self.joint_edit)

        self.detect_button = QtWidgets.QPushButton(u"从选择自动识别")
        self.detect_button.setStyleSheet(theme.button_style)
        self.detect_button.clicked.connect(self.detect_from_selection)

        form.addRow(u"", self.detect_button)

        return group

    def build_option_section(self):
        u"""参数区块。"""

        group = QtWidgets.QGroupBox(u"参数")
        form = QtWidgets.QFormLayout(group)
        form.setLabelAlignment(QtCore.Qt.AlignRight)

        self.mode_combo = QtWidgets.QComboBox()

        for mode in weight_math.mode_list:
            self.mode_combo.addItem(weight_math.mode_labels[mode], mode)

        self.scale_spin = QtWidgets.QDoubleSpinBox()
        self.scale_spin.setRange(0.0, 10.0)
        self.scale_spin.setDecimals(3)
        self.scale_spin.setSingleStep(0.05)
        self.scale_spin.setValue(1.0)

        self.target_spin = QtWidgets.QSpinBox()
        self.target_spin.setRange(0, 999)
        self.target_spin.setValue(0)
        self.target_spin.setToolTip(
            u"只有 blendShape 用到：第几个 target 的权重。"
        )

        self.normalize_check = QtWidgets.QCheckBox(u"写入后归一化")
        self.normalize_check.setChecked(True)

        self.remove_check = QtWidgets.QCheckBox(u"完成后删除变形器")
        self.remove_check.setChecked(False)

        form.addRow(u"混合模式", self.mode_combo)
        form.addRow(u"强度", self.scale_spin)
        form.addRow(u"BlendShape Target", self.target_spin)
        form.addRow(u"", self.normalize_check)
        form.addRow(u"", self.remove_check)

        return group

    def build_action_section(self):
        u"""执行区块。"""

        group = QtWidgets.QGroupBox(u"转换")
        layout = QtWidgets.QVBoxLayout(group)

        hint = QtWidgets.QLabel(
            u"整表写入，一次 Ctrl+Z 回退。删除变形器请在确认效果后勾选。"
        )
        hint.setWordWrap(True)
        hint.setStyleSheet(theme.subtitle_style)
        layout.addWidget(hint)

        self.convert_button = QtWidgets.QPushButton(u"转换权重 → 蒙皮")
        self.convert_button.setStyleSheet(theme.button_style)
        self.convert_button.clicked.connect(self.convert)
        layout.addWidget(self.convert_button)

        return group

    def _make_edit(self, placeholder):
        u"""创建统一样式的单行输入框。"""

        edit = QtWidgets.QLineEdit()
        edit.setPlaceholderText(placeholder)
        edit.setStyleSheet(theme.input_style)

        return edit

    # ------------------------------------------------------------------
    # 逻辑
    # ------------------------------------------------------------------

    def detect_from_selection(self):
        u"""按节点类型把当前选择拆成模型 / 变形器 / 骨骼。"""

        selection = cmds.ls(orderedSelection=True) or []

        if not selection:
            self.status_label.setText(u"请先选择模型、变形器或骨骼")
            return

        meshes = []
        deformers = []
        joints = []

        for node in selection:
            if cmds.nodeType(node) == "joint":
                joints.append(node)
                continue

            if self._is_mesh(node):
                meshes.append(node)
                continue

            if deformer_weight_utils.is_deformer(node):
                deformers.append(node)

        if meshes:
            self.mesh_edit.setText(meshes[0])

        if deformers:
            self.deformer_edit.setText(u", ".join(deformers))

        if joints:
            self.joint_edit.setText(u", ".join(joints))

        self.status_label.setText(
            u"识别到 {} 个模型 / {} 个变形器 / {} 根骨骼".format(
                len(meshes), len(deformers), len(joints)
            )
        )

    def _is_mesh(self, node):
        u"""判断节点是不是网格（transform 或 shape）。"""

        if cmds.nodeType(node) == "mesh":
            return True

        shapes = cmds.listRelatives(
            node,
            shapes=True,
            type="mesh",
            noIntermediate=True,
        ) or []

        return bool(shapes)

    def convert(self):
        u"""读取界面参数并执行转换。"""

        mesh = self.mesh_edit.text().strip()
        deformers = parse_names(self.deformer_edit.text())
        joints = parse_names(self.joint_edit.text())

        if not mesh:
            self.status_label.setText(u"请填写模型")
            return

        if not deformers or not joints:
            self.status_label.setText(u"请填写变形器和目标骨骼")
            return

        try:
            results = deformer_weight_utils.apply_deformer_weights_batch(
                mesh,
                deformers,
                joints,
                mode=self.mode_combo.currentData(),
                scale=self.scale_spin.value(),
                normalize=self.normalize_check.isChecked(),
                target_index=self.target_spin.value(),
                remove_deformer=self.remove_check.isChecked(),
            )
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"转换失败：{}".format(error))
            return

        zero_total = sum(len(item["zero_rows"]) for item in results)

        message = u"已转换 {} 个变形器，共 {} 个顶点".format(
            len(results), results[0]["vertex_count"]
        )

        if zero_total:
            message += u"；{} 个顶点全零，未能归一化".format(zero_total)

        self.status_label.setText(message)


_window = None


def main():
    global _window

    _window = DeformerWeightTool()
    _window.show()

    return _window
