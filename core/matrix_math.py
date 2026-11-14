# coding=utf-8
u"""4x4 矩阵乘法（纯数学，不依赖 Maya）。

Maya 的 worldMatrix 展开是行主序 16 个数；矩阵混合需要先算
「控制器 → 关节」的偏移矩阵：

    offset = ctrl.worldInverse * joint.world
    result = ctrl.world * offset          （等于 joint 的世界矩阵）

多路混合时每路先乘自己的 offset，再按权重相加。
"""


def identity():
    u"""单位矩阵。"""

    return [
        1.0, 0.0, 0.0, 0.0,
        0.0, 1.0, 0.0, 0.0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0,
    ]


def multiply(first, second):
    u"""两个行主序 4x4 矩阵相乘：first * second。"""

    if len(first) != 16 or len(second) != 16:
        raise ValueError(u"矩阵必须是 16 个数")

    result = [0.0] * 16

    for row in range(4):
        for column in range(4):
            total = 0.0

            for index in range(4):
                total += first[row * 4 + index] * second[index * 4 + column]

            result[row * 4 + column] = total

    return result
