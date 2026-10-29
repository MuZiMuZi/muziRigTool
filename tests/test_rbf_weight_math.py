# coding=utf-8
"""rbf_weight_math 纯数学单测。"""

import unittest

from core.deformation import rbf_weight_math


class DistanceTest(unittest.TestCase):
    u"""距离计算。"""

    def test_same_vector_is_zero(self):
        self.assertEqual(
            rbf_weight_math.vector_distance_squared([0, 0, 0], [0, 0, 0]),
            0.0,
        )

    def test_axis_distance(self):
        self.assertEqual(
            rbf_weight_math.vector_distance_squared([0, 0, 0], [3, 0, 4]),
            25.0,
        )

    def test_dimension_mismatch_raises(self):
        with self.assertRaises(ValueError):
            rbf_weight_math.vector_distance_squared([0, 0], [0, 0, 0])


class KernelTest(unittest.TestCase):
    u"""高斯核。"""

    def test_distance_zero_gives_one(self):
        self.assertAlmostEqual(
            rbf_weight_math.gaussian_kernel(0.0, 45.0), 1.0
        )

    def test_sigma_must_be_positive(self):
        with self.assertRaises(ValueError):
            rbf_weight_math.gaussian_kernel(1.0, 0.0)

    def test_kernel_decays(self):
        near = rbf_weight_math.gaussian_kernel(10.0, 45.0)
        far = rbf_weight_math.gaussian_kernel(1000.0, 45.0)

        self.assertGreater(near, far)


class WeightsTest(unittest.TestCase):
    u"""归一化权重。"""

    def test_sum_is_one(self):
        weights = rbf_weight_math.rbf_weights(
            [0.0, 0.0, 0.0],
            [[0.0, 0.0, 0.0], [0.0, 0.0, 90.0], [0.0, 90.0, 0.0]],
            45.0,
        )

        self.assertAlmostEqual(sum(weights), 1.0)

    def test_exact_center_dominates(self):
        weights = rbf_weight_math.rbf_weights(
            [0.0, 0.0, 90.0],
            [[0.0, 0.0, 0.0], [0.0, 0.0, 90.0], [0.0, 90.0, 0.0]],
            45.0,
        )

        self.assertGreater(weights[1], weights[0])
        self.assertGreater(weights[1], weights[2])

    def test_no_samples_raises(self):
        with self.assertRaises(ValueError):
            rbf_weight_math.rbf_weights([0.0], [], 45.0)


if __name__ == "__main__":
    unittest.main()
