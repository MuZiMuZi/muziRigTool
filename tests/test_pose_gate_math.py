# coding=utf-8
u"""pose_gate_math 单测。

pose_gate_math 不 import Maya，所以这些用例可以在没有 Maya 的环境里跑，
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


from muziRigTool.core.deformation import pose_gate_math


ANGLE = 45.0


class ClampTests(unittest.TestCase):

    def test_clamp_low(self):
        u"""低于 0 压回 0。"""
        self.assertEqual(pose_gate_math.clamp01(-0.5), 0.0)

    def test_clamp_high(self):
        u"""高于 1 压回 1。"""
        self.assertEqual(pose_gate_math.clamp01(2.5), 1.0)

    def test_clamp_inside(self):
        u"""区间内保持原值。"""
        self.assertEqual(pose_gate_math.clamp01(0.25), 0.25)


class SmoothStepTests(unittest.TestCase):

    def test_ends(self):
        u"""两端取 0 和 1。"""
        self.assertEqual(pose_gate_math.smooth_step(0.0), 0.0)
        self.assertEqual(pose_gate_math.smooth_step(1.0), 1.0)

    def test_mid(self):
        u"""中点取 0.5。"""
        self.assertAlmostEqual(pose_gate_math.smooth_step(0.5), 0.5)

    def test_end_slope_is_flat(self):
        u"""端点附近导数为零，进入和离开时没有拐折。"""
        step = 1e-4

        start_slope = pose_gate_math.smooth_step(step) / step
        end_slope = (1.0 - pose_gate_math.smooth_step(1.0 - step)) / step

        self.assertLess(start_slope, 1e-2)
        self.assertLess(end_slope, 1e-2)


class DirectionGateTests(unittest.TestCase):

    def test_zero_delta(self):
        u"""差值为零时门为零。"""
        self.assertEqual(pose_gate_math.direction_gate(0.0, -1, ANGLE), 0.0)

    def test_reach_threshold(self):
        u"""转到阈值角度时门满。"""
        self.assertAlmostEqual(
            pose_gate_math.direction_gate(-ANGLE, -1, ANGLE), 1.0
        )

    def test_over_threshold_keeps_one(self):
        u"""超过阈值角度仍保持 1。"""
        self.assertAlmostEqual(
            pose_gate_math.direction_gate(-180.0, -1, ANGLE), 1.0
        )

    def test_wrong_direction_is_zero(self):
        u"""方向相反的差值不产生门。"""
        self.assertEqual(
            pose_gate_math.direction_gate(ANGLE, -1, ANGLE), 0.0
        )

    def test_bad_sign_raises(self):
        u"""符号只能是 ±1。"""
        with self.assertRaises(ValueError):
            pose_gate_math.direction_gate(0.0, 0, ANGLE)

    def test_bad_angle_raises(self):
        u"""阈值角度必须大于 0。"""
        with self.assertRaises(ValueError):
            pose_gate_math.direction_gate(0.0, 1, 0.0)


class GateWeightsTests(unittest.TestCase):

    def test_neutral_all_zero(self):
        u"""中立姿态下 8 个方向全部为零。"""
        weights = pose_gate_math.gate_weights(0.0, 0.0, ANGLE, ANGLE)

        for name, value in weights.items():
            self.assertEqual(value, 0.0, name)

    def test_single_axis_up(self):
        u"""A 轴转到 up 方向时只有 up 权重为 1。"""
        weights = pose_gate_math.gate_weights(-ANGLE, 0.0, ANGLE, ANGLE)

        self.assertAlmostEqual(weights["up"], 1.0)

        for name in pose_gate_math.direction_list:
            if name != "up":
                self.assertEqual(weights[name], 0.0, name)

    def test_single_axis_down(self):
        u"""A 轴反向转时只有 down 权重为 1。"""
        weights = pose_gate_math.gate_weights(ANGLE, 0.0, ANGLE, ANGLE)

        self.assertAlmostEqual(weights["down"], 1.0)
        self.assertEqual(weights["up"], 0.0)

    def test_single_axis_does_not_activate_diagonal(self):
        u"""纯单轴不能激活任何对角权重。"""
        weights = pose_gate_math.gate_weights(-ANGLE, 0.0, ANGLE, ANGLE)

        for name in pose_gate_math.diagonal_directions:
            self.assertEqual(weights[name], 0.0, name)

    def test_diagonal_weights(self):
        u"""双轴同时到位时对角权重为 1，单轴权重被清空。"""
        weights = pose_gate_math.gate_weights(-ANGLE, ANGLE, ANGLE, ANGLE)

        self.assertAlmostEqual(weights["front_up"], 1.0)

        for name in ("up", "down", "front", "back"):
            self.assertEqual(weights[name], 0.0, name)

    def test_mid_state(self):
        u"""转到一半时单轴权重是 smoothstep 的一半。"""
        weights = pose_gate_math.gate_weights(-22.5, 0.0, ANGLE, ANGLE)

        self.assertAlmostEqual(weights["up"], 0.5)

    def test_over_limit(self):
        u"""角度远超阈值时权重不衰减。"""
        weights = pose_gate_math.gate_weights(-180.0, 0.0, ANGLE, ANGLE)

        self.assertAlmostEqual(weights["up"], 1.0)

    def test_weights_are_never_negative(self):
        u"""任意组合下权重都不能为负。"""
        for delta_a in (-180.0, -90.0, -45.0, -15.0, 0.0, 15.0, 90.0):
            for delta_b in (-180.0, -45.0, 0.0, 30.0, 120.0):
                weights = pose_gate_math.gate_weights(
                    delta_a, delta_b, ANGLE, ANGLE
                )

                for name, value in weights.items():
                    self.assertGreaterEqual(value, 0.0, name)

    def test_enabled_filter(self):
        u"""未启用的方向返回 0，即使姿态落在那一边。"""
        weights = pose_gate_math.gate_weights(
            -ANGLE, 0.0, ANGLE, ANGLE, enabled=["up"]
        )

        self.assertAlmostEqual(weights["up"], 1.0)
        self.assertEqual(weights["down"], 0.0)
        self.assertEqual(weights["front_up"], 0.0)

    def test_bad_direction_raises(self):
        u"""未知方向名要报错。"""
        with self.assertRaises(ValueError):
            pose_gate_math.gate_weights(
                0.0, 0.0, ANGLE, ANGLE, enabled=["sideways"]
            )


class TotalWeightTests(unittest.TestCase):

    def test_single_axis_full(self):
        u"""单轴满时总权重为 1。"""
        self.assertAlmostEqual(
            pose_gate_math.total_weight(-ANGLE, 0.0, ANGLE, ANGLE), 1.0
        )

    def test_diagonal_full(self):
        u"""双轴满时总权重为 1。"""
        self.assertAlmostEqual(
            pose_gate_math.total_weight(-ANGLE, ANGLE, ANGLE, ANGLE), 1.0
        )

    def test_mid_single_axis_is_half(self):
        u"""单轴一半时总权重为 0.5。"""
        self.assertAlmostEqual(
            pose_gate_math.total_weight(-22.5, 0.0, ANGLE, ANGLE), 0.5
        )

    def test_mid_diagonal_is_three_quarters(self):
        u"""双轴各一半时总权重为 0.75，即 U + F - U·F。"""
        self.assertAlmostEqual(
            pose_gate_math.total_weight(-22.5, 22.5, ANGLE, ANGLE), 0.75
        )


if __name__ == "__main__":
    unittest.main()
