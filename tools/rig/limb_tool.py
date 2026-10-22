# coding=utf-8
u"""四肢绑定工具。

流程：

    导入定位器（骨架模板）-> 选中 4 个 -> 建链

4 个定位器的顺序：

    [0] 根关节
    [1] 中间关节
    [2] 末端关节
    [3] 极向量

界面结构：

    ┌─ 目标 ────────────────────────┐
    │ 选中：4 个定位器      [刷新]   │
    ├─ 模块 ────────────────────────┤
    │ 类型 [arm ▼]  方向 [lf ▼]     │
    │ part [arm      ]              │
    ├───────────────────────────────┤
    │ [         创建四肢         ]  │
    └───────────────────────────────┘

命名会按五段式生成，例如：

    jnt_lf_arm_bind_001
    ctrl_lf_arm_fk_001
    ctrl_lf_arm_ik_001
    ctrl_lf_arm_pole_001
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...systems.rig.guide import Guide, align_pole_to_plane
from ...systems.rig.module.ikfk import LimbIkFk
from ...ui import theme


class LimbTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""四肢绑定窗口。"""

    def __init__(self, parent=None):
        super(LimbTool, self).__init__(parent)

        self.setWindowTitle(u"四肢绑定")
        self.resize(420, 420)

        self.build_ui()
        self.refresh()

    # ------------------------------------------------------------------
    # 界面
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"四肢绑定"))
        layout.addWidget(theme.make_subtitle(
            u"选中 4 个定位器：根 / 中 / 末端 / 极向量。"
        ))

        layout.addWidget(self.build_target_section())
        layout.addWidget(self.build_module_section())
        layout.addWidget(self.build_action_section())

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        layout.addStretch()

    def build_target_section(self):
        u"""目标区块。"""

        group = QtWidgets.QGroupBox(u"目标")
        layout = QtWidgets.QHBoxLayout(group)

        self.target_label = QtWidgets.QLabel(u"未选择定位器")
        layout.addWidget(self.target_label, 1)

        self.refresh_button = QtWidgets.QPushButton(u"刷新")
        self.refresh_button.setStyleSheet(theme.button_style)
        self.refresh_button.clicked.connect(self.refresh)
        layout.addWidget(self.refresh_button)

        return group

    def build_module_section(self):
        u"""模块配置区块。"""

        group = QtWidgets.QGroupBox(u"模块")
        layout = QtWidgets.QFormLayout(group)

        self.type_combo = QtWidgets.QComboBox()
        self.type_combo.addItem(u"手臂 arm", "arm")
        self.type_combo.addItem(u"腿 leg", "leg")
        self.type_combo.currentIndexChanged.connect(self.on_type_changed)
        layout.addRow(u"类型", self.type_combo)

        self.side_combo = QtWidgets.QComboBox()
        self.side_combo.addItem(u"左 lf", "lf")
        self.side_combo.addItem(u"右 rt", "rt")
        self.side_combo.addItem(u"中 md", "md")
        layout.addRow(u"方向", self.side_combo)

        self.part_edit = QtWidgets.QLineEdit("arm")
        self.part_edit.setStyleSheet(theme.input_style)
        layout.addRow(u"part", self.part_edit)

        return group

    def build_action_section(self):
        u"""操作区块。"""

        group = QtWidgets.QGroupBox(u"操作")
        layout = QtWidgets.QVBoxLayout(group)

        self.template_button = QtWidgets.QPushButton(u"导入模板")
        self.template_button.setStyleSheet(theme.button_style)
        self.template_button.clicked.connect(self.import_template)
        layout.addWidget(self.template_button)

        self.from_template_button = QtWidgets.QPushButton(u"从模板创建")
        self.from_template_button.setStyleSheet(theme.button_style)
        self.from_template_button.clicked.connect(self.create_from_template)
        layout.addWidget(self.from_template_button)

        self.create_button = QtWidgets.QPushButton(u"用选中的定位器创建")
        self.create_button.setStyleSheet(theme.button_style)
        self.create_button.clicked.connect(self.create_from_selection)
        layout.addWidget(self.create_button)

        self.align_button = QtWidgets.QPushButton(u"对齐极向量到关节平面")
        self.align_button.setStyleSheet(theme.button_style)
        self.align_button.clicked.connect(self.align_pole)
        layout.addWidget(self.align_button)

        return group

    # ------------------------------------------------------------------
    # 逻辑
    # ------------------------------------------------------------------

    def on_type_changed(self, index):
        u"""切换类型时同步 part 名。"""

        part = self.type_combo.currentData()
        self.part_edit.setText(part)

    def get_guides(self):
        u"""返回选中的定位器，按选择顺序。"""

        return cmds.ls(orderedSelection=True) or []

    def refresh(self):
        u"""刷新目标信息。"""

        guides = self.get_guides()

        if guides:
            self.target_label.setText(
                u"{} 个：{}".format(len(guides), ", ".join(guides[:4]))
            )
        else:
            self.target_label.setText(u"未选择定位器")

    def get_module(self):
        u"""返回当前配置的模块名。"""

        return self.part_edit.text().strip() or self.type_combo.currentData()

    def get_side(self):
        u"""返回当前选择的方向。"""

        return self.side_combo.currentData()

    def import_template(self):
        u"""导入当前模块的 Guide 模板。"""

        try:
            guide = Guide(self.get_module())
            guide.import_template()
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"导入失败：{}".format(error))
            return

        self.status_label.setText(
            u"已导入 {} 模板".format(self.get_module())
        )

    def create_from_template(self):
        u"""导入模板，按方向自动取 4 个定位器建链。"""

        module = self.get_module()
        side = self.get_side()

        try:
            guide = Guide(module)
            guide.import_template()
            locators = guide.get_locators(side)
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"模板读取失败：{}".format(error))
            return

        if len(locators) != 4:
            self.status_label.setText(
                u"{} 的 {} 侧只找到 {} 个定位器".format(
                    module, side, len(locators)
                )
            )
            return

        self.build_chain(locators)

    def create_from_selection(self):
        u"""用当前选中的 4 个定位器建链。"""

        guides = self.get_guides()

        if len(guides) != 4:
            self.status_label.setText(
                u"需要正好 4 个定位器，当前 {} 个".format(len(guides))
            )
            return

        self.build_chain(guides)

    def align_pole(self):
        u"""把极向量对齐到关节链平面。

        两种取法：
            选中 4 个      按选择顺序：根 / 中 / 末端 / 极向量
            没选中         从 body 模板按方向自动取
        """

        selection = self.get_guides()

        if len(selection) == 4:
            guides = selection
        else:
            module = self.get_module()
            side = self.get_side()

            try:
                body_guide = Guide("body")
                body_guide.import_template()
                guides = body_guide.get_body_limb(side, module)
            except Exception as error:
                self.status_label.setText(u"读取 guide 失败：{}".format(error))
                return

        if len(guides) != 4:
            self.status_label.setText(
                u"需要 4 个定位器（根 / 中 / 末端 / 极向量），当前 {} 个".format(
                    len(guides)
                )
            )
            return

        try:
            new_position = align_pole_to_plane(*guides)
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"对齐失败：{}".format(error))
            return

        self.status_label.setText(
            u"极向量已对齐：({:.1f}, {:.1f}, {:.1f})".format(*new_position)
        )

    def build_chain(self, guides):
        u"""按定位器建链。"""

        module = self.get_module()
        side = self.get_side()

        try:
            chain = LimbIkFk(
                module=module,
                side=side,
                guides=guides
            )
            chain.build_rig()
            chain.connect_rig()
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"创建失败：{}".format(error))
            return

        cmds.select(chain.fk_ctrl_names, replace=True)

        self.status_label.setText(
            u"已创建 {}_{}：{} 个关节".format(
                side, module, len(chain.deform_joints)
            )
        )


_window = None


def main():
    global _window

    _window = LimbTool()
    _window.show()

    return _window
