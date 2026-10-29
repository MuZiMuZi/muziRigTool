# coding=utf-8
u"""weight_math 单测。

weight_math 不 import Maya，所以这些用例可以在没有 Maya 的环境里跑，
用于 CI 和提交前的快速回归。
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


from muziRigTool.core.deformation import weight_math


class MatrixConversionTests(unittest.TestCase):

    def test_flat_to_rows(self):
        u"""扁平数组按顶点优先切行。"""
        rows = weight_math.to_rows([1.0, 0.0, 0.0, 0.5, 0.5, 0.0], 2, 3)

        self.assertEqual(rows, [[1.0, 0.0, 0.0], [0.5, 0.5, 0.0]])

    def test_rows_to_flat_round_trip(self):
        u"""切行再压平应还原原数组。"""
        flat = [0.2, 0.3, 0.5, 0.1, 0.1, 0.8]

        rows = weight_math.to_rows(flat, 2, 3)

        self.assertEqual(weight_math.to_flat(rows), flat)

    def test_length_mismatch_raises(self):
        u"""长度对不上时不能静默切错行。"""
        with self.assertRaises(ValueError):
            weight_math.to_rows([1.0, 0.0], 2, 3)


class ApplyColumnTests(unittest.TestCase):

    def setUp(self):
        self.rows = [
            [1.0, 0.0],
            [0.6, 0.4],
        ]

    def test_replace(self):
        u"""覆盖模式直接写入变形器权重。"""
        weight_math.apply_column(
            self.rows, 1, [0.4, 0.2], weight_math.mode_replace
        )

        self.assertEqual(self.rows, [[1.0, 0.4], [0.6, 0.2]])

    def test_add(self):
        u"""叠加模式在原权重上加。"""
        weight_math.apply_column(
            self.rows, 1, [0.4, 0.2], weight_math.mode_add
        )

        self.assertAlmostEqual(self.rows[0][1], 0.4)
        self.assertAlmostEqual(self.rows[1][1], 0.6)

    def test_multiply(self):
        u"""相乘模式按比例缩放。"""
        weight_math.apply_column(
            self.rows, 1, [0.5, 0.5], weight_math.mode_multiply
        )

        self.assertEqual(self.rows, [[1.0, 0.0], [0.6, 0.2]])

    def test_scale(self):
        u"""强度系数在写入前生效。"""
        weight_math.apply_column(
            self.rows, 1, [1.0, 1.0], weight_math.mode_replace, scale=0.25
        )

        self.assertEqual(self.rows, [[1.0, 0.25], [0.6, 0.25]])

    def test_result_is_clamped_to_unit(self):
        u"""相加越界要压回 1。"""
        weight_math.apply_column(
            self.rows, 0, [0.8, 0.8], weight_math.mode_add
        )

        self.assertEqual(self.rows[0][0], 1.0)

    def test_unknown_mode_raises(self):
        u"""拼错模式名要报错，而不是当覆盖处理。"""
        with self.assertRaises(ValueError):
            weight_math.apply_column(self.rows, 0, [1.0, 1.0], "merge")

    def test_value_count_mismatch_raises(self):
        u"""权重数量与顶点数不一致要报错。"""
        with self.assertRaises(ValueError):
            weight_math.apply_column(
                self.rows, 0, [1.0], weight_math.mode_replace
            )

    def test_empty_matrix_raises(self):
        u"""空矩阵不能写。"""
        with self.assertRaises(ValueError):
            weight_math.apply_column([], 0, [], weight_math.mode_replace)


class NormalizeRowsTests(unittest.TestCase):

    def test_normalize(self):
        u"""行和归一到 1。"""
        rows = [[2.0, 2.0], [0.5, 0.5]]

        zero_rows = weight_math.normalize_rows(rows)

        self.assertEqual(rows, [[0.5, 0.5], [0.5, 0.5]])
        self.assertEqual(zero_rows, [])

    def test_zero_row_is_reported_and_kept(self):
        u"""全零行保持原样并回报索引。"""
        rows = [[0.0, 0.0], [1.0, 1.0]]

        zero_rows = weight_math.normalize_rows(rows)

        self.assertEqual(rows[0], [0.0, 0.0])
        self.assertEqual(zero_rows, [0])

    def test_already_normalized_is_untouched(self):
        u"""已归一化的行不重复除，避免浮点噪声。"""
        rows = [[1.0, 0.0]]

        weight_math.normalize_rows(rows)

        self.assertEqual(rows, [[1.0, 0.0]])


class PairNamesTests(unittest.TestCase):

    def test_pair(self):
        u"""按顺序一一配对。"""
        pairs = weight_math.pair_names(["a", "b"], ["x", "y"])

        self.assertEqual(pairs, [("a", "x"), ("b", "y")])

    def test_count_mismatch_raises(self):
        u"""数量不一致宁可报错，也不默默写错骨骼。"""
        with self.assertRaises(RuntimeError):
            weight_math.pair_names(["a", "b"], ["x"])

    def test_empty_raises(self):
        u"""空输入报错。"""
        with self.assertRaises(RuntimeError):
            weight_math.pair_names([], [])


if __name__ == "__main__":
    unittest.main()
