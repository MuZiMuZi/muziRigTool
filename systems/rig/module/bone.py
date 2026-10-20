# coding=utf-8
u"""Bone：所有绑定模块的契约层。

Bone 固定绑定的执行顺序，子类只需要实现钩子。

    build_setup()
        create_namespace()
            _create_base_namespace()
            _create_extra_namespace()
        create_bpjnt()
            _create_base_bpjnt()
            _create_extra_bpjnt()

    build_rig()
        create_namespace()
        create_joint()
            _delete_existing_joint()
            _create_base_joint()
            _create_extra_joint()
        create_ctrl()
            _delete_existing_ctrl()
            _create_base_ctrl()
            _create_extra_ctrl()
        create_constraint()
            _create_base_constraint()
            _create_extra_constraint()

    delete_rig()
        _delete_constraint()
        _delete_ctrl()
        _delete_joint()

约定：

    base   部分由 Base 实现，保证所有模块行为一致；
    extra  部分由具体部位模块实现，处理部位差异。

Bone 本身不 import Maya，也不创建任何节点，因此可以在纯 Python 环境中测试。
"""

from ....core.common.name_utils import Name


class Bone(object):
    u"""绑定模块的抽象契约：定义生命周期与执行顺序。

    子类通过类属性描述自己的身份：

        class Arm(Bone):
            name = "arm"
            rig_type = "ikfk"

    实例也可以在构造时覆盖：

        Arm(side="lf", index=2)
    """

    # 模块身份，子类用类属性声明默认值。
    side = "md"
    name = ""
    rig_type = "fk"
    index = 1

    def __init__(self, side=None, name=None, rig_type=None, index=None):
        u"""按需覆盖类属性，并在构造时完成校验。

        Args:
            side (str): 方向，接受 lf / rt / md，也接受 left / right / middle / center。
            name (str): 部位名，例如 arm、hand、upper_lid。
            rig_type (str): 绑定类型，例如 fk、ik、ikfk。
            index (int): 序号，1 ~ 999。
        """

        if side is not None:
            self.side = Name.check_side(side)

        if name is not None:
            self.name = Name.check_part(name)

        if rig_type is not None:
            self.rig_type = Name.check_token(rig_type, "rig_type")

        if index is not None:
            self.index = Name.check_index(index)

    # ------------------------------------------------------------------
    # 对外生命周期
    # ------------------------------------------------------------------

    def build_setup(self):
        u"""创建定位（bpjnt）。完成后场景中应存在本模块的定位关节。"""

        self.create_namespace()
        self.create_bpjnt()

    def build_rig(self):
        u"""根据定位创建绑定。调用前定位关节必须已经存在。"""

        self.create_namespace()
        self.create_joint()
        self.create_ctrl()
        self.create_constraint()

    def delete_rig(self):
        u"""按创建的反序删除本次构建产生的节点。"""

        self._delete_constraint()
        self._delete_ctrl()
        self._delete_joint()

    # ------------------------------------------------------------------
    # 模板方法：固定 base 与 extra 的先后顺序
    # ------------------------------------------------------------------

    def create_namespace(self):
        u"""建立本模块的名称表。"""

        self._create_base_namespace()
        self._create_extra_namespace()

    def create_bpjnt(self):
        u"""创建定位关节。"""

        self._create_base_bpjnt()
        self._create_extra_bpjnt()

    def create_joint(self):
        u"""创建蒙皮关节；已存在旧输出时先删除。"""

        self._delete_existing_joint()
        self._create_base_joint()
        self._create_extra_joint()

    def create_ctrl(self):
        u"""创建控制器；已存在旧输出时先删除。"""

        self._delete_existing_ctrl()
        self._create_base_ctrl()
        self._create_extra_ctrl()

    def create_constraint(self):
        u"""建立控制器到关节的连接。"""

        self._create_base_constraint()
        self._create_extra_constraint()

    # ------------------------------------------------------------------
    # 钩子：默认不做任何事，由 Base 与部位模块覆盖
    # ------------------------------------------------------------------

    def _create_base_namespace(self):
        u"""所有模块共用的名称。"""

    def _create_extra_namespace(self):
        u"""本模块特有的名称。"""

    def _create_base_bpjnt(self):
        u"""所有模块共用的定位关节。"""

    def _create_extra_bpjnt(self):
        u"""本模块特有的定位关节。"""

    def _delete_existing_joint(self):
        u"""Rebuild 时先删除旧的蒙皮关节，必要时先记录位置。"""

    def _create_base_joint(self):
        u"""所有模块共用的蒙皮关节。"""

    def _create_extra_joint(self):
        u"""本模块特有的蒙皮关节。"""

    def _delete_existing_ctrl(self):
        u"""Rebuild 时先删除旧的控制器，必要时先记录形态。"""

    def _create_base_ctrl(self):
        u"""所有模块共用的控制器。"""

    def _create_extra_ctrl(self):
        u"""本模块特有的控制器。"""

    def _create_base_constraint(self):
        u"""所有模块共用的驱动连接。"""

    def _create_extra_constraint(self):
        u"""本模块特有的驱动连接。"""

    def _delete_constraint(self):
        u"""删除本模块创建的约束与连接。"""

    def _delete_ctrl(self):
        u"""删除本模块创建的控制器。"""

    def _delete_joint(self):
        u"""删除本模块创建的蒙皮关节。"""
