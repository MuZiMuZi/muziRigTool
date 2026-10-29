# coding=utf-8
u"""UV Pin 工具的注册与静态契约测试。

不导入 Maya，只读源码与工具注册表，因此可以在普通 Python 环境运行。
"""

import ast
import os
import sys
import unittest


# tests/test_uv_pin_tool_registry.py -> tests -> muziRigTool -> scripts
PACKAGE_PARENT = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.abspath(__file__)
        )
    )
)

if PACKAGE_PARENT not in sys.path:
    sys.path.insert(0, PACKAGE_PARENT)

from muziRigTool import tools


TOOL_PATH = os.path.join(
    PACKAGE_PARENT,
    "muziRigTool",
    "tools",
    "rig",
    "uv_pin_tool.py",
)

CORE_PATH = os.path.join(
    PACKAGE_PARENT,
    "muziRigTool",
    "core",
    "rigging",
    "uv_pin_utils.py",
)


def read_tree(path):
    u"""读取 Python 源码并返回 AST。"""

    with open(path, "r", encoding="utf-8") as handle:
        return ast.parse(handle.read(), filename=path)


def get_top_level_functions(tree):
    u"""返回模块顶层函数名集合。"""

    return {
        node.name for node in tree.body
        if isinstance(node, ast.FunctionDef)
    }


class UVPinToolRegistryTests(unittest.TestCase):

    def test_tool_registered_in_rig_category(self):
        u"""uv_pin_tool 必须出现在绑定工具分类中。"""

        registry = tools.refresh_tools()
        tool_names = [
            tool["name"] for tool in registry.get("rig", [])
        ]

        self.assertIn("uv_pin_tool", tool_names)

    def test_tool_metadata(self):
        u"""工具箱标题来自 docstring 第一行，运行模式为 UI。"""

        registry = tools.refresh_tools()
        tools_by_name = {
            tool["name"]: tool for tool in registry["rig"]
        }

        self.assertEqual(
            tools_by_name["uv_pin_tool"]["title"],
            u"UV Pin 工具"
        )
        self.assertEqual(
            tools_by_name["uv_pin_tool"]["mode"],
            "ui"
        )

    def test_tool_has_main_entry(self):
        u"""工具模块必须提供 main()。"""

        self.assertIn(
            "main",
            get_top_level_functions(read_tree(TOOL_PATH))
        )

    def test_core_has_public_entry_points(self):
        u"""Core 必须保留批量创建与 UV 查询入口。"""

        function_names = get_top_level_functions(read_tree(CORE_PATH))

        for name in (
                "create_uv_pin",
                "create_uv_pins",
                "create_zero_group",
                "get_closest_uv",
                "get_driver_transform",
                "get_shape",
                "get_uv_sets",
        ):
            self.assertIn(name, function_names)


if __name__ == "__main__":
    unittest.main()
