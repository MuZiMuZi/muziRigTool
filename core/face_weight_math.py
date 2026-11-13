# coding=utf-8
u"""蒙皮权重的纯数学部分：倒数距离初值。

用途：面部绑定里给「关节 → 顶点」铺一套能用的初始权重，
再由绑定师手修过渡。它不负责平滑、不做笔刷模拟，只保证：

    每个顶点权重和 = 1
    影响数不超过 max_influences
    离得越近权重越大（power 控制软硬）

放在 core 且不 import maya，是为了能脱离 Maya 单测——
公式写错时测试立刻报，不用开场景。

公式：

    w_i = 1 / (d_i + epsilon) ** power
    取前 max_influences 个，归一化

Maya 里用法：

    from muziRigTool.core.face_weight_math import inverse_distance_weights

    pairs = inverse_distance_weights(vertex, joint_positions, power=2.0)
    # [(关节下标, 权重), ...]，直接喂给 cmds.skinPercent
"""

import math


def _distance(first, second):
    u"""两个三维点的距离。"""

    return math.sqrt(
        sum((a - b) ** 2 for a, b in zip(first, second))
    )


def inverse_distance_weights(
        position,
        joint_positions,
        power=2.0,
        max_influences=4,
        epsilon=1e-4):
    u"""按距离倒数计算一个顶点的权重。

    Args:
        position (tuple): 顶点世界坐标。
        joint_positions (list): 各关节的世界坐标。
        power (float): 距离的幂，越大过渡越硬。
        max_influences (int): 最多保留几个关节。
        epsilon (float): 防止距离为 0 时除零。

    Returns:
        list: [(joint_index, weight), ...]，按下标升序，权重和 = 1。

    Raises:
        ValueError: 关节列表为空，或 power / max_influences 非法。
    """

    if not joint_positions:
        raise ValueError(u"joint_positions 不能为空")

    if power <= 0.0:
        raise ValueError(u"power 必须大于 0，收到：{}".format(power))

    if max_influences < 1:
        raise ValueError(
            u"max_influences 至少为 1，收到：{}".format(max_influences)
        )

    if epsilon <= 0.0:
        raise ValueError(u"epsilon 必须大于 0，收到：{}".format(epsilon))

    scored = []

    for index, joint_position in enumerate(joint_positions):
        distance = _distance(position, joint_position)
        scored.append((index, 1.0 / ((distance + epsilon) ** power)))

    # 权重大的在前；权重相同按原顺序，保证结果稳定可复现。
    scored.sort(key=lambda item: (-item[1], item[0]))
    scored = scored[:max_influences]

    total = sum(weight for _, weight in scored)

    if total <= 0.0:
        # 极端情况：全都算成 0（浮点下溢），退化成等分给第一个关节。
        return [(scored[0][0], 1.0)]

    result = [
        (index, weight / total)
        for index, weight in scored
    ]

    return sorted(result, key=lambda item: item[0])
