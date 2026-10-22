# coding=utf-8
u"""Muzi 工具箱。

结构：

    ToolCard        单个工具卡片
    CategoryPage    一个分类页：卡片网格 + 过滤
    ToolboxWindow   主窗口：左侧分类导航 + 右侧页面

工具清单来自 tools 注册表，新增工具不需要改这个文件。
"""

import traceback

from PySide2 import QtCore, QtWidgets

from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from .. import tools as tool_registry
from ..ui import theme


class ToolCard(QtWidgets.QFrame):
    u"""一个工具卡片：显示标题，双击打开。"""

    activated = QtCore.Signal(str, str)

    def __init__(self, category, name, title, parent=None):
        super(ToolCard, self).__init__(parent)

        self.category = category
        self.name = name
        self.tool_title = title

        self.setObjectName("toolCard")
        self.setStyleSheet(theme.card_style)
        # 不设置 WA_Hover，QSS 里的 :hover 不会触发
        self.setAttribute(QtCore.Qt.WA_Hover, True)
        self.setCursor(QtCore.Qt.PointingHandCursor)
        self.setFixedSize(148, 56)
        self.setToolTip(u"双击打开：{}".format(title))

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(8, 6, 8, 6)

        self.title_label = QtWidgets.QLabel(title)
        self.title_label.setAlignment(QtCore.Qt.AlignCenter)
        self.title_label.setWordWrap(True)
        self.title_label.setStyleSheet(
            u"color: {}; font-size: 12px; background: transparent;".format(
                theme.color_text
            )
        )
        layout.addWidget(self.title_label)

    def mouseDoubleClickEvent(self, event):
        u"""双击打开工具。"""

        self.activated.emit(self.category, self.name)

        super(ToolCard, self).mouseDoubleClickEvent(event)


class CategoryPage(QtWidgets.QWidget):
    u"""一个分类页：标题 + 卡片网格。"""

    tool_activated = QtCore.Signal(str, str)

    # 每行放几个卡片
    columns = 4

    def __init__(self, category, tools, parent=None):
        super(CategoryPage, self).__init__(parent)

        self.category = category
        self.cards = []

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        self.count_label = QtWidgets.QLabel(u"")
        self.count_label.setStyleSheet(theme.section_style)
        layout.addWidget(self.count_label)

        scroll = QtWidgets.QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setFrameShape(QtWidgets.QFrame.NoFrame)

        container = QtWidgets.QWidget()
        grid = QtWidgets.QGridLayout(container)
        grid.setContentsMargins(0, 4, 0, 4)
        grid.setSpacing(8)
        grid.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignLeft)

        for index, tool in enumerate(tools):
            card = ToolCard(category, tool["name"], tool["title"])
            card.activated.connect(self.tool_activated)

            grid.addWidget(card, index // self.columns, index % self.columns)
            self.cards.append(card)

        scroll.setWidget(container)
        layout.addWidget(scroll)

        self.update_count()

    def update_count(self, visible=None):
        u"""更新标题上的数量。"""

        if visible is None:
            visible = len(self.cards)

        title = tool_registry.category_titles.get(self.category, self.category)
        self.count_label.setText(u"{}  ·  {} 个工具".format(title, visible))

    def filter_cards(self, keyword):
        u"""按关键字隐藏不匹配的卡片。

        Returns:
            int: 可见卡片数量。
        """

        keyword = keyword.strip().lower()
        visible = 0

        for card in self.cards:
            match = not keyword or keyword in card.tool_title.lower()
            card.setVisible(match)

            if match:
                visible += 1

        self.update_count(visible)

        return visible


class ToolboxWindow(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""工具箱主窗口。"""

    def __init__(self, parent=None):
        super(ToolboxWindow, self).__init__(parent)

        self.setWindowTitle(u"Muzi 工具箱")
        self.resize(680, 560)

        self.build_ui()

    def build_ui(self):
        u"""搭界面。"""

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(14, 14, 14, 14)
        layout.setSpacing(10)

        layout.addWidget(theme.make_title(u"Muzi 工具箱"))
        layout.addWidget(theme.make_subtitle(u"双击卡片打开工具"))

        # 搜索 + 刷新
        top_row = QtWidgets.QHBoxLayout()

        self.search_edit = QtWidgets.QLineEdit()
        self.search_edit.setPlaceholderText(u"搜索工具…")
        self.search_edit.setStyleSheet(theme.input_style)
        self.search_edit.textChanged.connect(self.filter_current_page)
        top_row.addWidget(self.search_edit)

        self.refresh_button = QtWidgets.QPushButton(u"刷新")
        self.refresh_button.setStyleSheet(theme.button_style)
        self.refresh_button.clicked.connect(self.refresh_registry)
        top_row.addWidget(self.refresh_button)

        layout.addLayout(top_row)

        # 左侧导航 + 右侧页面
        body = QtWidgets.QHBoxLayout()
        body.setSpacing(10)

        self.nav_list = QtWidgets.QListWidget()
        self.nav_list.setStyleSheet(theme.navigation_style)
        self.nav_list.setFixedWidth(150)
        self.nav_list.currentRowChanged.connect(self.select_category)
        body.addWidget(self.nav_list)

        self.stack = QtWidgets.QStackedWidget()
        body.addWidget(self.stack, 1)

        layout.addLayout(body, 1)

        self.status_label = QtWidgets.QLabel(u"就绪")
        self.status_label.setStyleSheet(theme.subtitle_style)
        layout.addWidget(self.status_label)

        self.rebuild_pages()

    # ------------------------------------------------------------------
    # 数据
    # ------------------------------------------------------------------

    def rebuild_pages(self):
        u"""按注册表重建导航和所有分类页。"""

        while self.stack.count():
            widget = self.stack.widget(0)
            self.stack.removeWidget(widget)
            widget.deleteLater()

        self.nav_list.clear()

        registry = tool_registry.get_tools_by_category()

        for category in sorted(registry):
            tools = registry[category]
            page = CategoryPage(category, tools)
            page.tool_activated.connect(self.run_tool)

            self.stack.addWidget(page)

            title = tool_registry.category_titles.get(category, category)
            self.nav_list.addItem(u"{} ({})".format(title, len(tools)))

        if self.nav_list.count():
            self.nav_list.setCurrentRow(0)

        self.status_label.setText(u"共 {} 个分类".format(self.stack.count()))

    def refresh_registry(self):
        u"""重新扫描工具目录。"""

        tool_registry.refresh_tools()
        self.rebuild_pages()
        self.status_label.setText(u"已刷新工具列表")

    # ------------------------------------------------------------------
    # 交互
    # ------------------------------------------------------------------

    def select_category(self, index):
        u"""切换分类页。"""

        if index < 0:
            return

        self.stack.setCurrentIndex(index)

        # 切换分类时清空搜索，避免误以为工具丢了
        self.search_edit.clear()

    def filter_current_page(self, text):
        u"""过滤当前分类页的卡片。"""

        page = self.stack.currentWidget()

        if page is None:
            return

        visible = page.filter_cards(text)

        if text.strip():
            self.status_label.setText(u"匹配 {} 个工具".format(visible))

    def run_tool(self, category, name):
        u"""运行工具，并统一处理异常。"""

        try:
            tool_registry.run_tool(category, name)

        except Exception:
            # 单个工具出错不影响工具箱
            print(traceback.format_exc())
            self.status_label.setText(u"打开失败：{}".format(name))
            return

        self.status_label.setText(u"已打开：{}".format(name))


_window = None


def main():
    global _window

    _window = ToolboxWindow()
    _window.show()

    return _window
