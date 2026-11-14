# coding=utf-8
u"""眉毛链权重的纯数学测试（不需要 Maya）。

跑法：

    python -X utf8 tests/test_brow_chain_math.py
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


from muziRigTool.core import brow_chain_math


class ControllerCentersTests(unittest.TestCase):

    def test_three_regions(self):
        self.assertEqual(
            brow_chain_math.controller_centers(3),
            [0.0, 0.5, 1.0]
        )

    def test_single_region(self):
        self.assertEqual(brow_chain_math.controller_centers(1), [0.5])

    def test_invalid(self):
        with self.assertRaises(ValueError):
            brow_chain_math.controller_centers(0)


class ChainWeightsTests(unittest.TestCase):

    def test_five_joints(self):
        u"""5 关节 3 控制器：1 / 0.5+0.5 / 1 / 0.5+0.5 / 1。"""

        expected = [
            [(0, 1.0)],
            [(0, 0.5), (1, 0.5)],
            [(1, 1.0)],
            [(1, 0.5), (2, 0.5)],
            [(2, 1.0)],
        ]

        for index, item in enumerate(expected):
            self.assertEqual(
                brow_chain_math.chain_weights(index, 5, 3),
                item
            )

    def test_weights_sum_to_one(self):
        for index in range(7):
            weights = brow_chain_math.chain_weights(index, 7, 3)
            self.assertAlmostEqual(
                sum(weight for _, weight in weights), 1.0, places=6
            )

    def test_edges_use_end_controllers(self):
        self.assertEqual(
            brow_chain_math.chain_weights(0, 5, 3), [(0, 1.0)]
        )
        self.assertEqual(
            brow_chain_math.chain_weights(4, 5, 3), [(2, 1.0)]
        )

    def test_invalid_inputs(self):
        with self.assertRaises(ValueError):
            brow_chain_math.chain_weights(0, 1, 3)

        with self.assertRaises(ValueError):
            brow_chain_math.chain_weights(5, 5, 3)


if __name__ == "__main__":
    unittest.main()
