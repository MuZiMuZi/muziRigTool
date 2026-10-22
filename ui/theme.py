# coding=utf-8
u"""界面主题。

统一颜色、字号和样式表，工具窗口都从这里取，避免每个工具各写一套配色。

用法：

    from muziRigTool.ui import theme

    label.setStyleSheet(theme.TITLE_STYLE)
    widget.setStyleSheet(theme.CARD_STYLE)
"""


# ----------------------------------------------------------------------
# 颜色
# ----------------------------------------------------------------------

color_background = "#2b2b2b"
color_panel = "#333333"
color_border = "#3f3f3f"
color_border_hover = "#5a8ad0"

color_text = "#d8d8d8"
color_text_dim = "#8a8a8a"
color_text_title = "#e8e8e8"

color_accent = "#3d6da8"
color_accent_light = "#5a8ad0"


# ----------------------------------------------------------------------
# 字体
# ----------------------------------------------------------------------

title_style = u"font-size: 17px; font-weight: bold; color: {};".format(
    color_text_title
)

subtitle_style = u"font-size: 11px; color: {};".format(color_text_dim)

section_style = u"font-size: 13px; font-weight: bold; color: {};".format(
    color_text
)


# ----------------------------------------------------------------------
# 输入框
# ----------------------------------------------------------------------

input_style = u"""
QLineEdit {{
    background-color: {background};
    border: 1px solid {border};
    border-radius: 6px;
    padding: 6px 10px;
    color: {text};
}}
QLineEdit:focus {{
    border-color: {accent};
}}
""".format(
    background=color_background,
    border=color_border,
    text=color_text,
    accent=color_accent_light,
)


# ----------------------------------------------------------------------
# 卡片
# ----------------------------------------------------------------------

card_style = u"""
QFrame#toolCard {{
    background-color: {panel};
    border: 1px solid {border};
    border-radius: 8px;
}}
QFrame#toolCard:hover {{
    background-color: #3a3a3a;
    border-color: {accent};
}}
""".format(
    panel=color_panel,
    border=color_border,
    accent=color_border_hover,
)


# ----------------------------------------------------------------------
# 左侧导航
# ----------------------------------------------------------------------

navigation_style = u"""
QListWidget {{
    background-color: {background};
    border: 1px solid {border};
    border-radius: 6px;
    outline: none;
    padding: 4px;
}}
QListWidget::item {{
    height: 34px;
    padding-left: 10px;
    color: {text};
    border-radius: 4px;
}}
QListWidget::item:hover {{
    background-color: #3a3a3a;
}}
QListWidget::item:selected {{
    background-color: {accent};
    color: #ffffff;
}}
""".format(
    background=color_background,
    border=color_border,
    text=color_text,
    accent=color_accent,
)


# ----------------------------------------------------------------------
# 按钮
# ----------------------------------------------------------------------

button_style = u"""
QPushButton {{
    background-color: {panel};
    border: 1px solid {border};
    border-radius: 6px;
    padding: 6px 14px;
    color: {text};
}}
QPushButton:hover {{
    background-color: #3a3a3a;
    border-color: {accent};
}}
QPushButton:pressed {{
    background-color: {accent};
    color: #ffffff;
}}
""".format(
    panel=color_panel,
    border=color_border,
    text=color_text,
    accent=color_accent_light,
)


# ----------------------------------------------------------------------
# 工具函数
# ----------------------------------------------------------------------

def make_title(text):
    u"""创建标题标签。"""

    from PySide2 import QtWidgets

    label = QtWidgets.QLabel(text)
    label.setStyleSheet(title_style)

    return label


def make_subtitle(text):
    u"""创建副标题标签。"""

    from PySide2 import QtWidgets

    label = QtWidgets.QLabel(text)
    label.setStyleSheet(subtitle_style)

    return label


def make_section(text):
    u"""创建分区标题标签。"""

    from PySide2 import QtWidgets

    label = QtWidgets.QLabel(text)
    label.setStyleSheet(section_style)

    return label
