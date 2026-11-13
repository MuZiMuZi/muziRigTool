# coding=utf-8
u"""眉毛/曲线绑定的区域权重数学。

眉毛曲线由内、中、外三个区域控制器驱动：
每个 CV 落在哪个区域、过渡有多软，全由这里算，不依赖 Maya。

设计：

    centers   区域中心在曲线上的位置（0~1）
    spread    单个区域的影响半径（0~1），越大过渡越软

    CV 到某个区域的权重 = max(0, 1 - 距离 / spread)
    再把同一 CV 的各区域权重归一化到总和 1

单独放在 core 里、且不 import maya，是为了能在没有 Maya 的环境里测试——
权重公式写错了，测试会立刻发现，不用开 Maya 才能验证。
"""


def region_centers(region_count):
    u"""返回区域中心位置。

    三段式（眉毛）：0.0 / 0.5 / 1.0。

    Args:
        region_count (int): 区域数量，至少 1。

    Returns:
        list: 0~1 之间的中心位置。
    """

    if region_count < 1:
        raise ValueError(
            u"region_count 至少为 1，收到：{}".format(region_count)
        )

    if region_count == 1:
        return [0.5]

    step = 1.0 / float(region_count - 1)

    return [index * step for index in range(region_count)]


def discrete_region_weights(cv_count, region_count=3):
    u"""按「整段归属」分配：每个 CV 100% 归一个区域。

    课程 demo（brow_demo.ma）里驱动曲线的实际蒙皮就是这样：
    5 个 CV、3 个区域，权重是 ``1 0 1 | 1 0 1 | 1 1 1 | 1 2 1 | 1 2 1``，
    也就是 2 / 1 / 2 的硬分组，没有过渡权重——
    过渡感来自曲线本身的 degree 3 插值，而不是权重。

    这里用 ``round(位置 × (区域数 - 1))`` 划分：
    0.25 归内（0.5 附近取偶）、0.75 归外，正好还原 demo 的 2 / 1 / 2。

    Args:
        cv_count (int): CV 数量。
        region_count (int): 区域数量。

    Returns:
        list: 长度 cv_count，每项是长度 region_count 的 0/1 权重。
    """

    if cv_count < 1:
        raise ValueError(u"cv_count 至少为 1，收到：{}".format(cv_count))

    if region_count < 1:
        raise ValueError(
            u"region_count 至少为 1，收到：{}".format(region_count)
        )

    rows = []

    for index in range(cv_count):
        fraction = 0.0 if cv_count == 1 else float(index) / (cv_count - 1)
        region = int(round(fraction * (region_count - 1)))

        row = [0.0] * region_count
        row[region] = 1.0

        rows.append(row)

    return rows


def region_weights(cv_count, region_count=3, spread=0.45):
    u"""计算曲线 CV 对各区域的权重。

    Args:
        cv_count (int): CV 数量。
        region_count (int): 区域数量。
        spread (float): 影响半径，0~1；太小会硬切，太大会互相淹没。

    Returns:
        list: 长度 cv_count，每项是长度 region_count 的权重列表，和为 1。

    Raises:
        ValueError: CV 数量不足或 spread 非法。

    Maya 使用示例：
        rows = region_weights(9, 3, 0.45)
        rows[0]   # 第一个 CV，几乎全归内侧
    """

    if cv_count < 1:
        raise ValueError(u"cv_count 至少为 1，收到：{}".format(cv_count))

    if not 0.0 < spread <= 1.0:
        raise ValueError(
            u"spread 必须在 (0, 1] 之间，收到：{}".format(spread)
        )

    centers = region_centers(region_count)
    rows = []

    for index in range(cv_count):
        fraction = 0.0 if cv_count == 1 else float(index) / (cv_count - 1)

        weights = [
            max(0.0, 1.0 - abs(fraction - center) / spread)
            for center in centers
        ]

        total = sum(weights)

        # 曲线太短、或 spread 太小时可能所有区域都为 0，
        # 这时退化成「归最近的中心」，保证每个 CV 都有主人。
        if total <= 0.0:
            nearest = min(
                range(region_count),
                key=lambda item: abs(fraction - centers[item])
            )
            weights = [0.0] * region_count
            weights[nearest] = 1.0
            total = 1.0

        rows.append([round(weight / total, 6) for weight in weights])

    return rows
