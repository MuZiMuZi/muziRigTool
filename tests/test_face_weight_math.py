# coding=utf-8
u"""蒙皮权重初值的纯数学测试（不需要 Maya）。

跑法：

    python -X utf8 tests/test_face_weight_math.py
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


from muziRigTool.core import face_weight_math


JOINTS = [
    (0.0, 0.0, 0.0),
    (10.0, 0.0, 0.0),
    (20.0, 0.0, 0.0),
    (30.0, 0.0, 0.0),
    (40.0, 0.0, 0.0),
]


class InverseDistanceTests(unittest.TestCase):

    def test_weights_normalized(self):
        u"""权重加起来必须是 1。"""

        pairs = face_weight_math.inverse_distance_weights(
            (3.0, 0.0, 0.0), JOINTS
        )

        self.assertAlmostEqual(sum(w for _, w in pairs), 1.0, places=6)

    def test_influence_limit(self):
        u"""影响数不超过 max_influences。"""

        pairs = face_weight_math.inverse_distance_weights(
            (3.0, 0.0, 0.0), JOINTS, max_influences=2
        )

        self.assertLessEqual(len(pairs), 2)

    def test_nearest_joint_dominant(self):
        u"""离得最近的关节权重最大。"""

        pairs = face_weight_math.inverse_distance_weights(
            (1.0, 0.0, 0.0), JOINTS, power=2.0
        )

        best = max(pairs, key=lambda item: item[1])

        self.assertEqual(best[0], 0)

    def test_sorted_by_index(self):
        u"""返回结果按下标升序，方便直接喂给 skinPercent。"""

        pairs = face_weight_math.inverse_distance_weights(
            (25.0, 0.0, 0.0), JOINTS
        )

        indexes = [index for index, _ in pairs]

        self.assertEqual(indexes, sorted(indexes))

    def test_single_joint(self):
        u"""只有一个关节时权重必为 1。"""

        pairs = face_weight_math.inverse_distance_weights(
            (5.0, 0.0, 0.0), [(0.0, 0.0, 0.0)]
        )

        self.assertEqual(len(pairs), 1)
        self.assertAlmostEqual(pairs[0][1], 1.0, places=6)

    def test_coincident_point(self):
        u"""顶点与关节重合时不除零，权重仍然归一化。"""

        pairs = face_weight_math.inverse_distance_weights(
            (0.0, 0.0, 0.0), JOINTS, power=2.0
        )

        self.assertAlmostEqual(sum(w for _, w in pairs), 1.0, places=6)
        self.assertGreater(pairs[0][1], 0.99)

    def test_power_changes_softness(self):
        u"""power 越大，最近关节占比越高（过渡越硬）。"""

        soft = face_weight_math.inverse_distance_weights(
            (5.0, 0.0, 0.0), JOINTS, power=1.0
        )
        hard = face_weight_math.inverse_distance_weights(
            (5.0, 0.0, 0.0), JOINTS, power=4.0
        )

        best_soft = max(w for _, w in soft)
        best_hard = max(w for _, w in hard)

        self.assertGreater(best_hard, best_soft)

    def test_invalid_inputs(self):
        u"""非法参数必须报错。"""

        with self.assertRaises(ValueError):
            face_weight_math.inverse_distance_weights((0, 0, 0), [])

        with self.assertRaises(ValueError):
            face_weight_math.inverse_distance_weights(
                (0, 0, 0), JOINTS, power=0.0
            )

        with self.assertRaises(ValueError):
            face_weight_math.inverse_distance_weights(
                (0, 0, 0), JOINTS, max_influences=0
            )

        with self.assertRaises(ValueError):
            face_weight_math.inverse_distance_weights(
                (0, 0, 0), JOINTS, epsilon=0.0
            )


if __name__ == "__main__":
    unittest.main()
