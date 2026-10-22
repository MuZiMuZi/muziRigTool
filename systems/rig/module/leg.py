# coding=utf-8
u"""腿部模块。

在通用三链平台上，负责腿部特有的部分：

    默认控制器外观
    脚部挂接点（预留）

结构、IK/FK 切换、Switch 逻辑全部来自 LimbIkFk。
"""

from .ikfk import LimbConfig, LimbIkFk


class Leg(LimbIkFk):
    u"""腿：三链结构 + 脚部。"""

    def __init__(self, side="lf", guides=None, config=None, **kwargs):
        super(Leg, self).__init__(
            module="leg",
            side=side,
            guides=guides,
            config=config or self.default_config(),
            **kwargs
        )

    @staticmethod
    def default_config():
        u"""腿的默认外观。

        和手臂用同一套形状定义，方便左右手脚一眼归类；
        颜色区分开，避免两套控制器混在一起时看错。
        """

        return LimbConfig(
            fk_shape="circle",
            ik_shape="cube",
            pole_shape="sphere",
            fk_color=14,    # 绿
            ik_color=13,    # 红
            pole_color=6    # 蓝
        )
