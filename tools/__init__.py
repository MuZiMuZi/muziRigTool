# coding=utf-8
u"""工具注册表。

扫描 tools/ 下的子目录，把每个 .py 注册成一个工具。

    tools/basic/rename_tool.py    ->  ("basic", "rename_tool")

真正的模块在用户点击时才 import，所以某个工具有语法错误
不会影响工具箱启动。

工具可以声明 TOOL_MODE：

    TOOL_MODE = "ui"     打开窗口（默认）
    TOOL_MODE = "action" 直接执行，不建窗口
"""

import ast
import importlib
import os


# 目录名 -> 中文分类名
category_titles = {
    "basic": u"基础工具",
    "controller": u"控制器工具",
    "jnt": u"骨骼工具",
    "rig": u"绑定工具",
    "skin": u"蒙皮工具",
    "face": u"面部工具",
    "clean": u"检查与清理",
}

# 显示顺序
category_order = [
    "basic",
    "jnt",
    "controller",
    "rig",
    "face",
    "skin",
    "clean",
]

TOOL_MODE_UI = "ui"
TOOL_MODE_ACTION = "action"

_tools_dir = os.path.dirname(os.path.abspath(__file__))

# {分类: [{"name": ..., "title": ..., "mode": ...}, ...]}
_registry = {}


def _iter_categories():
    u"""返回分类目录名，按 category_order 排序，未列出的排在最后。"""

    found = []

    for file_name in os.listdir(_tools_dir):
        path = os.path.join(_tools_dir, file_name)

        if not os.path.isdir(path):
            continue

        if file_name.startswith("__"):
            continue

        found.append(file_name)

    ordered = [name for name in category_order if name in found]
    ordered.extend(sorted(name for name in found if name not in ordered))

    return ordered


def _read_metadata(module_path):
    u"""静态读取工具的标题和运行模式，不 import 模块。

    Returns:
        tuple: (title, mode)
    """

    title = os.path.splitext(os.path.basename(module_path))[0]
    mode = TOOL_MODE_UI

    try:
        with open(module_path, "r", encoding="utf-8") as handle:
            source = handle.read()

        tree = ast.parse(source)
        docstring = ast.get_docstring(tree)

        if docstring:
            first_line = docstring.strip().splitlines()[0].strip()

            if first_line:
                title = first_line.rstrip(u"。")

        # 只读模块顶层的 TOOL_MODE 赋值
        for node in tree.body:
            if not isinstance(node, ast.Assign):
                continue

            for target in node.targets:
                if getattr(target, "id", None) != "TOOL_MODE":
                    continue

                value = node.value

                if isinstance(value, ast.Constant) and isinstance(value.value, str):
                    mode = value.value

    except Exception:
        pass

    if mode not in (TOOL_MODE_UI, TOOL_MODE_ACTION):
        mode = TOOL_MODE_UI

    return title, mode


def discover_tools():
    u"""重新扫描 tools 目录，重建注册表。

    Returns:
        dict: {分类: [工具信息, ...]}
    """

    global _registry

    registry = {}

    for category in _iter_categories():
        category_dir = os.path.join(_tools_dir, category)
        tools = []

        for file_name in sorted(os.listdir(category_dir)):
            if not file_name.endswith(".py"):
                continue

            if file_name == "__init__.py" or file_name.startswith("_"):
                continue

            module_path = os.path.join(category_dir, file_name)
            title, mode = _read_metadata(module_path)

            tools.append({
                "name": os.path.splitext(file_name)[0],
                "title": title,
                "mode": mode,
            })

        if tools:
            registry[category] = tools

    _registry = registry

    return registry


def get_tools_by_category():
    u"""返回当前注册表，第一次调用时自动扫描。"""

    if not _registry:
        discover_tools()

    return _registry


def refresh_tools():
    u"""强制重新扫描工具目录。"""

    return discover_tools()


def run_tool(category, name):
    u"""加载并运行工具。

    Args:
        category (str): 分类目录名。
        name (str): 工具模块名。

    Returns:
        object: 工具的 main() 返回值。
    """

    module = importlib.import_module(
        "muziRigTool.tools.{}.{}".format(category, name)
    )

    main = getattr(module, "main", None)

    if main is None:
        raise RuntimeError(u"工具没有 main()：{}".format(name))

    return main()


__all__ = [
    "category_order",
    "category_titles",
    "discover_tools",
    "get_tools_by_category",
    "refresh_tools",
    "run_tool",
]
