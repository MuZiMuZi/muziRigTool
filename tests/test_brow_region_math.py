# coding=utf-8
u"""曲线区域权重的纯数学测试（不需要 Maya）。

验证 core.brow_region_math 的两种分配方式：

    region_weights            平滑过渡（按距离衰减）
    discrete_region_weights   整段归属（与课程 demo 的曲线蒙皮一致）

跑法：

    python -X utf8 tests/test_brow_region_math.py
"""

import os
import sys
import unittest


PACKAGE_PARENT = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.abspath(__file__)
        )
    )
)

if PACKAGE_PARENT not in sys.path:
    sys.path.insert(0, PACKAGE_PARENT)


from muziRigTool.core import brow_region_math


class RegionCentersTests(unittest.TestCase):

    def test_three_regions(self):
        u"""三段式：0 / 0.5 / 1。"""

        self.assertEqual(
            brow_region_math.region_centers(3),
            [0.0, 0.5, 1.0]
        )

    def test_single_region(self):
        u"""只有一个区域时放在中间。"""

        self.assertEqual(brow_region_math.region_centers(1), [0.5])

    def test_invalid_count(self):
        u"""区域数不能小于 1。"""

        with self.assertRaises(ValueError):
            brow_region_math.region_centers(0)


class DiscreteWeightsTests(unittest.TestCase):

    def test_five_cvs_three_regions(self):
        u"""5 个 CV 分三段：2 / 1 / 2，和 demo 的曲线蒙皮一致。"""

        rows = brow_region_math.discrete_region_weights(5, 3)

        expected = [
            [1.0, 0.0, 0.0],
            [1.0, 0.0, 0.0],
            [0.0, 1.0, 0.0],
            [0.0, 0.0, 1.0],
            [0.0, 0.0, 1.0],
        ]

        self.assertEqual(rows, expected)

    def test_six_cvs_three_regions(self):
        u"""6 个 CV 均分：2 / 2 / 2。"""

        rows = brow_region_math.discrete_region_weights(6, 3)

        self.assertEqual(
            [row.index(1.0) for row in rows],
            [0, 0, 1, 1, 2, 2]
        )

    def test_each_row_single_owner(self):
        u"""整段归属：每行只有一个 1，其余为 0。"""

        for row in brow_region_math.discrete_region_weights(11, 3):
            self.assertEqual(sum(row), 1.0)
            self.assertEqual(row.count(1.0), 1)

    def test_invalid_counts(self):
        u"""CV / 区域数非法时报错。"""

        with self.assertRaises(ValueError):
            brow_region_math.discrete_region_weights(0, 3)

        with self.assertRaises(ValueError):
            brow_region_math.discrete_region_weights(5, 0)


class SmoothWeightsTests(unittest.TestCase):

    def test_rows_normalized(self):
        u"""平滑权重：每行总和为 1。"""

        for row in brow_region_math.region_weights(9, 3, 0.45):
            self.assertAlmostEqual(sum(row), 1.0, places=5)

    def test_edges_belong_to_their_region(self):
        u"""首尾 CV 必须分别归内、外区域。"""

        rows = brow_region_math.region_weights(5, 3, 0.45)

        self.assertGreater(rows[0][0], 0.99)
        self.assertGreater(rows[-1][-1], 0.99)

    def test_invalid_spread(self):
        u"""spread 超出 (0, 1] 时报错。"""

        with self.assertRaises(ValueError):
            brow_region_math.region_weights(5, 3, 0.0)

        with self.assertRaises(ValueError):
            brow_region_math.region_weights(5, 3, 1.5)


if __name__ == "__main__":
    unittest.main()
