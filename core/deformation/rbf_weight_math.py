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
    仅用于快速预览；正式训练请用 train_coefficients。

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


def scaled_distance_squared(first, second, scales):
    u"""按尺度归一化的距离平方：Σ((a-b)/scale)²。"""

    if len(first) != len(second) or len(first) != len(scales):
        raise ValueError(u"向量或尺度数量不一致")

    result = 0.0

    for index, scale in enumerate(scales):
        if scale <= 0:
            raise ValueError(u"尺度必须为正数")

        result += ((first[index] - second[index]) / scale) ** 2

    return result


def solve_linear(matrix, targets):
    u"""部分主元 Gauss-Jordan，解 K · w = T。

    Args:
        matrix (list): N × N 系数矩阵。
        targets (list): N × M 目标矩阵，每行一个样本。

    Returns:
        list: N × M 系数矩阵。

    Raises:
        ValueError: 矩阵病态或维度不一致。
    """

    if not matrix or len(matrix) != len(matrix[0]):
        raise ValueError(u"矩阵必须是方阵")

    size = len(matrix)

    if len(targets) != size:
        raise ValueError(u"目标矩阵行数与样本数不一致")

    columns = len(targets[0])
    rows = []

    for index in range(size):
        rows.append(list(matrix[index]) + list(targets[index]))

    for pivot in range(size):
        best = pivot

        for index in range(pivot + 1, size):
            if abs(rows[index][pivot]) > abs(rows[best][pivot]):
                best = index

        if abs(rows[best][pivot]) < 1e-12:
            raise ValueError(u"矩阵病态，请调整样本或核宽")

        rows[pivot], rows[best] = rows[best], rows[pivot]

        factor = rows[pivot][pivot]

        for column in range(pivot, size + columns):
            rows[pivot][column] /= factor

        for index in range(size):
            if index == pivot:
                continue

            factor = rows[index][pivot]

            for column in range(pivot, size + columns):
                rows[index][column] -= factor * rows[pivot][column]

    return [row[size:] for row in rows]


def train_coefficients(
    sample_centers,
    neutral_index,
    sigma,
    scales=None,
    regularization=0.0,
):
    u"""训练精确插值系数。

    第一个样本是中立姿态（目标全 0），其余每个样本目标为对应 one-hot。

    Args:
        sample_centers (list): 样本中心向量，含中立样本。
        neutral_index (int): 中立样本在列表中的序号。
        sigma (float): 高斯核宽度。
        scales (list | None): 每个输入的尺度，默认全 90。
        regularization (float): 对角线正则项。

    Returns:
        list: 系数矩阵，行对应样本、列对应修型输出。
    """

    if not sample_centers:
        raise ValueError(u"至少需要一个样本")

    dimensions = len(sample_centers[0])
    scales = list(scales) if scales else [90.0] * dimensions
    output_count = len(sample_centers) - 1

    matrix = []

    for index, center in enumerate(sample_centers):
        row = []

        for other_index, other in enumerate(sample_centers):
            distance = scaled_distance_squared(center, other, scales)
            value = gaussian_kernel(distance, sigma)

            if index == other_index:
                value += regularization

            row.append(value)

        matrix.append(row)

    targets = []

    for index in range(len(sample_centers)):
        if index == neutral_index:
            targets.append([0.0] * output_count)
        else:
            order = index if index < neutral_index else index - 1
            target = [0.0] * output_count
            target[order] = 1.0
            targets.append(target)

    return solve_linear(matrix, targets)

