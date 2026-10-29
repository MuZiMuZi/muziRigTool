# coding=utf-8
u"""权重数组运算。

只做纯 Python 的数组混合与归一化，不 import Maya，
因此可以脱离 Maya 直接单测。

数据用「行」表示顶点、「列」表示影响骨骼：

    rows[顶点][影响] = 权重

这个形状和 skinCluster 的 weightList 一致，写回时整表交给
MFnSkinCluster.setWeights，避免逐顶点 setAttr。
"""


mode_replace = "replace"
mode_add = "add"
mode_multiply = "multiply"

mode_list = (mode_replace, mode_add, mode_multiply)

mode_labels = {
    mode_replace: u"覆盖",
    mode_add: u"叠加",
    mode_multiply: u"相乘",
}


def clamp_unit(value):
    u"""把单个权重压回 0 ~ 1。"""

    if value < 0.0:
        return 0.0

    if value > 1.0:
        return 1.0

    return value


def to_rows(flat, row_count, column_count):
    u"""把 Maya 返回的扁平数组切成二维表。

    MFnSkinCluster.getWeights 返回的是「顶点优先」的一维数组，
    顺序为 v0c0, v0c1, ..., v1c0, ...

    Args:
        flat (list): 扁平权重。
        row_count (int): 顶点数。
        column_count (int): 影响数。

    Returns:
        list: [[权重, ...], ...]

    Raises:
        ValueError: 扁平数组长度和行列数不匹配。
    """

    expected = row_count * column_count

    if len(flat) != expected:
        raise ValueError(
            u"权重数组长度与矩阵不匹配，收到：{} 个值，期望 {} × {} = {}".format(
                len(flat), row_count, column_count, expected
            )
        )

    rows = []

    for row_index in range(row_count):
        start = row_index * column_count
        rows.append(list(flat[start:start + column_count]))

    return rows


def to_flat(rows):
    u"""把二维表压回一维，顺序与 to_rows 对应。"""

    flat = []

    for row in rows:
        flat.extend(row)

    return flat


def apply_column(rows, column, values, mode=mode_replace, scale=1.0):
    u"""把一列外部权重混合进矩阵。

    就地修改 rows，不返回新表。

    Args:
        rows (list): 权重矩阵。
        column (int): 目标影响列。
        values (list): 每个顶点一个值，通常是变形器的 per-vertex 权重。
        mode (str): replace / add / multiply。
        scale (float): 写入前的缩放系数。

    Raises:
        ValueError: 权重数量、列号或模式不合法。
    """

    if not rows:
        raise ValueError(u"权重矩阵为空，无法写入。")

    if mode not in mode_list:
        raise ValueError(u"未知的混合模式，收到：{}".format(mode))

    if len(values) != len(rows):
        raise ValueError(
            u"变形器权重数量与顶点数不一致，收到：{} 个权重，{} 个顶点".format(
                len(values), len(rows)
            )
        )

    if column < 0 or column >= len(rows[0]):
        raise ValueError(u"影响列超出范围，收到：{}".format(column))

    for row_index, row in enumerate(rows):
        incoming = values[row_index] * scale
        current = row[column]

        if mode == mode_replace:
            result = incoming
        elif mode == mode_add:
            result = current + incoming
        else:
            result = current * incoming

        row[column] = clamp_unit(result)


def normalize_rows(rows):
    u"""就地归一化每一行，让行和为 1。

    行和为 0 的顶点无法归一化（全零行会让顶点塌到原点），
    保持原样并把顶点索引返回给调用方，由上层决定是否提示。

    Args:
        rows (list): 权重矩阵。

    Returns:
        list: 行和为 0 的顶点索引。
    """

    zero_rows = []

    for row_index, row in enumerate(rows):
        total = sum(row)

        if total <= 0.0:
            zero_rows.append(row_index)
            continue

        # 已经归一化的行不重复除，省一点浮点误差
        if abs(total - 1.0) <= 1e-6:
            continue

        inverse = 1.0 / total

        for column in range(len(row)):
            row[column] *= inverse

    return zero_rows


def pair_names(sources, targets):
    u"""把变形器和关节按顺序一对一配对。

    Args:
        sources (list): 变形器名。
        targets (list): 关节名。

    Returns:
        list: [(变形器, 关节), ...]

    Raises:
        RuntimeError: 任一列表为空，或数量不一致。
    """

    if not sources or not targets:
        raise RuntimeError(
            u"变形器和关节都不能为空，收到：{} 个变形器，{} 个关节".format(
                len(sources), len(targets)
            )
        )

    if len(sources) != len(targets):
        raise RuntimeError(
            u"变形器与关节数量必须一致，收到：{} 个变形器，{} 个关节".format(
                len(sources), len(targets)
            )
        )

    return list(zip(sources, targets))
