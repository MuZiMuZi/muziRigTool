# coding=utf-8
"""RBF 权重计算：高斯核 + 归一化。纯 Python，不依赖 Maya，可 CI 测试。"""

import math


def vector_distance_squared(first, second):
    u"""返回两个等长向量的欧氏距离平方。

    Args:
        first (list): 第一组数值。
        second (list): 第二组数值。

    Returns:
        float: 距离平方。

    Raises:
        ValueError: 两个维度不一致。
    """

    if len(first) != len(second):
        raise ValueError(
            u"向量维度不一致：{} vs {}".format(len(first), len(second))
        )

    return sum((a - b) ** 2 for a, b in zip(first, second))


def gaussian_kernel(distance_squared, sigma):
    u"""返回高斯核值 exp(-d² / (2σ²))。

    Args:
        distance_squared (float): 距离平方。
        sigma (float): 核宽度，必须为正。

    Returns:
        float: 核值。

    Raises:
        ValueError: sigma 不是正数。
    """

    if sigma <= 0:
        raise ValueError(u"sigma 必须为正数，收到：{}".format(sigma))

    return math.exp(-0.5 * distance_squared / (sigma ** 2))


def rbf_weights(input_vector, sample_centers, sigma):
    u"""返回归一化后的 RBF 权重列表。

    权重 = 每个样本的高斯核 / 所有核之和，范围 0~1，总和为 1。

    Args:
        input_vector (list): 当前输入向量。
        sample_centers (list): 样本中心列表，每项等长。
        sigma (float): 核宽度。

    Returns:
        list: 与样本一一对应的归一化权重。

    Raises:
        ValueError: 没有样本，或维度不一致。
    """

    if not sample_centers:
        raise ValueError(u"至少需要一个样本中心")

    kernels = []

    for center in sample_centers:
        kernels.append(
            gaussian_kernel(
                vector_distance_squared(input_vector, center), sigma
            )
        )

    total = sum(kernels)

    if total <= 0:
        return [0.0] * len(kernels)

    return [value / total for value in kernels]
