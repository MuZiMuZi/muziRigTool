# coding=utf-8
u"""
Bone 契约测试。

验证生命周期顺序、base / extra 的先后关系、以及身份字段的校验。
不依赖 Maya。
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


from muziRigTool.systems.rig.module.bone import Bone


class Recorder(Bone):
    u"""记录每个钩子的调用顺序。"""

    name = "arm"
    rig_type = "ikfk"

    def __init__(self, **kwargs):
        self.calls = []
        super(Recorder, self).__init__(**kwargs)

    def _record(self, label):
        self.calls.append(label)

    def _create_base_namespace(self):
        self._record("base_ns")

    def _create_extra_namespace(self):
        self._record("extra_ns")

    def _create_base_bpjnt(self):
        self._record("base_bpjnt")

    def _create_extra_bpjnt(self):
        self._record("extra_bpjnt")

    def _delete_existing_joint(self):
        self._record("del_existing_joint")

    def _create_base_joint(self):
        self._record("base_joint")

    def _create_extra_joint(self):
        self._record("extra_joint")

    def _delete_existing_ctrl(self):
        self._record("del_existing_ctrl")

    def _create_base_ctrl(self):
        self._record("base_ctrl")

    def _create_extra_ctrl(self):
        self._record("extra_ctrl")

    def _create_base_constraint(self):
        self._record("base_constraint")

    def _create_extra_constraint(self):
        self._record("extra_constraint")

    def _delete_constraint(self):
        self._record("del_constraint")

    def _delete_ctrl(self):
        self._record("del_ctrl")

    def _delete_joint(self):
        self._record("del_joint")


class BoneContractTests(unittest.TestCase):

    def test_build_setup_order(self):
        u"""build_setup 先建立名称，再创建定位关节。"""
        module = Recorder()
        module.build_setup()

        self.assertEqual(
            module.calls,
            ["base_ns", "extra_ns", "base_bpjnt", "extra_bpjnt"]
        )

    def test_build_rig_order(self):
        u"""build_rig 依次执行 namespace / joint / ctrl / constraint。"""
        module = Recorder()
        module.build_rig()

        self.assertEqual(
            module.calls,
            [
                "base_ns", "extra_ns",
                "del_existing_joint", "base_joint", "extra_joint",
                "del_existing_ctrl", "base_ctrl", "extra_ctrl",
                "base_constraint", "extra_constraint",
            ]
        )

    def test_delete_rig_is_reverse_of_creation(self):
        u"""delete_rig 按创建的反序删除：约束 -> 控制器 -> 关节。"""
        module = Recorder()
        module.delete_rig()

        self.assertEqual(
            module.calls,
            ["del_constraint", "del_ctrl", "del_joint"]
        )

    def test_base_hook_runs_before_extra(self):
        u"""同一阶段内 base 必须先于 extra 执行。"""
        module = Recorder()
        module.build_rig()

        for base_name, extra_name in (
                ("base_joint", "extra_joint"),
                ("base_ctrl", "extra_ctrl"),
                ("base_constraint", "extra_constraint"),
        ):
            self.assertLess(
                module.calls.index(base_name),
                module.calls.index(extra_name),
                u"{} 应先于 {} 执行".format(base_name, extra_name)
            )

    def test_identity_defaults(self):
        u"""未传参数时使用类属性声明的身份。"""
        module = Recorder()

        self.assertEqual(module.side, "md")
        self.assertEqual(module.name, "arm")
        self.assertEqual(module.rig_type, "ikfk")
        self.assertEqual(module.index, 1)

    def test_identity_override(self):
        u"""构造参数可以覆盖类属性。"""
        module = Recorder(side="rt", index=3)

        self.assertEqual(module.side, "rt")
        self.assertEqual(module.index, 3)

    def test_side_alias_is_normalized(self):
        u"""side 的常见写法归一化为 lf / rt / md。"""
        self.assertEqual(Recorder(side="left").side, "lf")
        self.assertEqual(Recorder(side="right").side, "rt")
        self.assertEqual(Recorder(side="middle").side, "md")

    def test_invalid_side_is_rejected(self):
        u"""非法方向在构造时立即失败。"""
        with self.assertRaises(ValueError):
            Recorder(side="xx")

    def test_invalid_index_is_rejected(self):
        u"""越界序号在构造时立即失败。"""
        with self.assertRaises(ValueError):
            Recorder(index=0)

        with self.assertRaises(ValueError):
            Recorder(index=1000)

    def test_invalid_name_is_rejected(self):
        u"""部位名不接受空值。"""
        with self.assertRaises(ValueError):
            Recorder(name="")

    def test_empty_bone_does_nothing(self):
        u"""Bone 本身是空契约，直接调用不会报错。"""
        module = Bone()
        module.build_setup()
        module.build_rig()
        module.delete_rig()

        self.assertEqual(module.side, "md")


if __name__ == "__main__":
    unittest.main()
