# coding=utf-8
u"""修型目标体命名的纯测试（不需要 Maya）。

跑法：

    python -X utf8 tests/test_face_bs_names.py
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


from muziRigTool.core import face_bs_names


class TargetListTests(unittest.TestCase):

    def test_counts(self):
        self.assertEqual(len(face_bs_names.BROW), 3)
        self.assertEqual(len(face_bs_names.EYE), 6)
        self.assertEqual(len(face_bs_names.NOSE), 2)
        self.assertEqual(len(face_bs_names.CHEEK), 4)
        self.assertEqual(len(face_bs_names.MOUTH), 9)
        self.assertEqual(len(face_bs_names.LIP), 4)

    def test_no_duplicates(self):
        self.assertEqual(
            len(face_bs_names.ALL),
            len(set(face_bs_names.ALL))
        )

    def test_typo_names_not_accepted(self):
        u"""常见错写不应出现在标准表里。"""

        for wrong in ("borwDown", "borrowDown", "lipPountleft"):
            self.assertNotIn(wrong, face_bs_names.ALL)

    def test_combo_examples_are_optional(self):
        u"""eyeExpand / eyeCrush 只是示例，不算必做目标体。"""

        for name in ("eyeExpand", "eyeCrush"):
            self.assertNotIn(name, face_bs_names.ALL)

        self.assertEqual(len(face_bs_names.all_targets()), 28)
        self.assertEqual(
            sorted(face_bs_names.combo_examples()),
            ["eyeCrush", "eyeExpand"]
        )

    def test_combos_valid(self):
        self.assertEqual(face_bs_names.validate(), [])

    def test_combo_members(self):
        self.assertEqual(
            face_bs_names.combo_members("eyeExpand"),
            ["browUp", "eyeUpWide", "eyeDownWide"]
        )
        self.assertEqual(
            face_bs_names.combo_members("eyeCrush"),
            ["browDown", "sneer", "squint", "eyeUpClose"]
        )

    def test_unknown_combo(self):
        with self.assertRaises(KeyError):
            face_bs_names.combo_members("nope")

    def test_target_name(self):
        self.assertEqual(
            face_bs_names.target_name("lf", "brow", "browUp"),
            "bs_lf_brow_browUp_001"
        )


if __name__ == "__main__":
    unittest.main()
