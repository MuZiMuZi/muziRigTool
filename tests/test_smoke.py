# coding=utf-8
u"""
最小冒烟测试。

只验证「包能被导入」和「版本号格式正确」，不依赖 Maya，
因此可以在任何 Python 3 环境（含 GitHub Actions 的 ubuntu runner）中运行。
"""

import os
import sys
import unittest


# 仓库根目录本身就是 muziRigTool 包。
# tests/test_smoke.py -> tests -> muziRigTool -> 包父目录
PACKAGE_PARENT = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.abspath(__file__)
        )
    )
)

if PACKAGE_PARENT not in sys.path:
    sys.path.insert(0, PACKAGE_PARENT)


class PackageSmokeTests(unittest.TestCase):

    def test_package_imports(self):
        u"""包可以被导入，且暴露版本号。"""
        import muziRigTool

        self.assertTrue(muziRigTool.__version__)

    def test_version_has_three_numeric_parts(self):
        u"""版本号使用 major.minor.patch 三段数字。"""
        import muziRigTool

        parts = muziRigTool.__version__.split(".")

        self.assertEqual(
            len(parts),
            3,
            u"版本号应为 major.minor.patch：{}".format(muziRigTool.__version__)
        )

        for part in parts:
            self.assertTrue(
                part.isdigit(),
                u"版本号每段都应是数字：{}".format(muziRigTool.__version__)
            )


if __name__ == "__main__":
    unittest.main()
