# coding=utf-8
u"""姿态驱动修型工具的注册与静态契约测试。

不导入 Maya，只读源码与工具注册表，因此可以在普通 Python 环境运行。
"""

import ast
import os
import sys
import unittest


# tests/test_pose_driver_tool_registry.py -> tests -> muziRigTool -> scripts
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
    "pose_driver_tool.py",
)

UTILS_PATH = os.path.join(
    PACKAGE_PARENT,
    "muziRigTool",
    "core",
    "deformation",
    "pose_driver_utils.py",
)

MATH_PATH = os.path.join(
    PACKAGE_PARENT,
    "muziRigTool",
    "core",
    "deformation",
    "pose_gate_math.py",
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


class PoseDriverToolRegistryTests(unittest.TestCase):

    def test_tool_registered_in_rig_category(self):
        u"""pose_driver_tool 必须出现在绑定工具分类中。"""

        registry = tools.refresh_tools()
        tool_names = [
            tool["name"] for tool in registry.get("rig", [])
        ]

        self.assertIn("pose_driver_tool", tool_names)

    def test_tool_metadata(self):
        u"""工具箱标题来自 docstring 第一行，运行模式为 UI。"""

        registry = tools.refresh_tools()
        tools_by_name = {
            tool["name"]: tool for tool in registry["rig"]
        }

        self.assertEqual(
            tools_by_name["pose_driver_tool"]["title"],
            u"姿态驱动修型"
        )
        self.assertEqual(
            tools_by_name["pose_driver_tool"]["mode"],
            "ui"
        )

    def test_tool_has_main_entry(self):
        u"""工具模块必须提供 main()。"""

        self.assertIn(
            "main",
            get_top_level_functions(read_tree(TOOL_PATH))
        )

    def test_utils_has_public_entry_points(self):
        u"""Core 必须保留解析、构建、删除与配置入口。"""

        function_names = get_top_level_functions(read_tree(UTILS_PATH))

        for name in (
                "parse_joint_identity",
                "parse_finger_joint",
                "find_supported_joints",
                "build_all_supported",
                "get_group_name",
                "get_or_create_group",
                "ensure_all_groups",
                "build_network",
                "build_from_config",
                "rebuild_network",
                "mirror_config",
                "delete_part",
                "delete_all_parts",
                "delete_network",
                "read_group_config",
                "read_weights",
        ):
            self.assertIn(name, function_names)

    def test_utils_no_blend_shape_binding(self):
        u"""本轮不再直接把输出连到 blendShape。"""

        function_names = get_top_level_functions(read_tree(UTILS_PATH))

        for name in ("connect_blend_shape", "alias_weights"):
            self.assertNotIn(name, function_names)

    def test_math_has_public_entry_points(self):
        u"""纯数学层必须保留门控与权重入口。"""

        function_names = get_top_level_functions(read_tree(MATH_PATH))

        for name in (
                "clamp01",
                "smooth_step",
                "direction_gate",
                "gate_weights",
                "total_weight",
        ):
            self.assertIn(name, function_names)

    def test_category_mapping_covers_adv_names(self):
        u"""源码里必须包含四个汇总组、ADV 固定名单与八方向范围。"""

        with open(UTILS_PATH, "r", encoding="utf-8") as handle:
            source = handle.read()

        for name in (
                "grp_md_arm_pose_001",
                "grp_md_spine_pose_001",
                "grp_md_leg_pose_001",
                "grp_md_finger_pose_001",
                "adv_joint_map",
                "Shoulder_L",
                "Hip_L",
                "Elbow_L",
                "Knee_L",
                "Wrist_L",
                "Ankle_L",
                "eight_direction_parts",
                "multi_angle_parts",
                "four_twist_parts",
                "supported_parts",
                "finger_defs",
                "finger_angle",
                "finger_attribute_suffixes",
                "twist_angle",
                "TwsP",
        ):
            self.assertIn(name, source)


if __name__ == "__main__":
    unittest.main()
