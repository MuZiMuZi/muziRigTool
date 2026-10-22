# coding=utf-8
u"""手臂模块。

在通用三链平台上，负责手臂特有的部分：

    默认控制器外观
    手部挂接点（预留）

结构、IK/FK 切换、Switch 逻辑全部来自 LimbIkFk。
"""

from .ikfk import LimbConfig, LimbIkFk


class Arm(LimbIkFk):
    u"""手臂：三链结构 + 手部。"""

    def __init__(self, side="lf", guides=None, config=None, **kwargs):
        super(Arm, self).__init__(
            module="arm",
            side=side,
            guides=guides,
            config=config or self.default_config(),
            **kwargs
        )

    @staticmethod
    def default_config():
        u"""手臂的默认外观。

        FK 用圆形、IK 用方块、极向量用小球——
        三种形状一眼能区分身份。
        """

        return LimbConfig(
            fk_shape="circle",
            ik_shape="cube",
            pole_shape="sphere",
            fk_color=17,    # 黄
            ik_color=13,    # 红
            pole_color=6    # 蓝
        )
