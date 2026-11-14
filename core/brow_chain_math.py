# coding=utf-8
u"""眉毛链的控制器权重分配（纯数学）。

眉毛用「关节直驱 + 分段控制器」：
    5 个关节沿眉毛排开，3 个控制器放在内 / 中 / 外位置；
    每个关节由最近的 1~2 个控制器按比例驱动。

比例规则：

    控制器中心在 chain 上的位置：0 / 0.5 / 1（三段）
    关节位置 f = i / (N - 1)
    落在两个相邻中心之间时，按线性插值分权重

这样动内侧控制器时，关节 1 全跟、关节 2 跟一半，
中间不会突然断开——不需要第二条 aim 曲线，也不需要曲线蒙皮。

不 import maya，方便在没有 Maya 的环境里测试。
"""


def controller_centers(region_count=3):
    u"""控制器在链上的位置（0~1）。"""

    if region_count < 1:
        raise ValueError(
            u"region_count 至少为 1，收到：{}".format(region_count)
        )

    if region_count == 1:
        return [0.5]

    step = 1.0 / (region_count - 1)

    return [index * step for index in range(region_count)]


def chain_weights(index, joint_count, region_count=3):
    u"""第 index 个关节对各控制器的权重。

    Args:
        index (int): 关节序号（0 开始）。
        joint_count (int): 关节总数。
        region_count (int): 控制器数量。

    Returns:
        list: [(controller_index, weight), ...]，权重和 = 1。
    """

    if joint_count < 2:
        raise ValueError(
            u"joint_count 至少为 2，收到：{}".format(joint_count)
        )

    if not 0 <= index < joint_count:
        raise ValueError(
            u"index 超出范围：{} / {}".format(index, joint_count)
        )

    centers = controller_centers(region_count)
    fraction = float(index) / (joint_count - 1)

    if fraction <= centers[0]:
        return [(0, 1.0)]

    if fraction >= centers[-1]:
        return [(len(centers) - 1, 1.0)]

    # 正好落在控制器中心时直接全给那一个，避免出现 (0, 0.0) 这种空权重
    for position, center in enumerate(centers):
        if abs(fraction - center) < 1e-9:
            return [(position, 1.0)]

    for position in range(len(centers) - 1):
        left = centers[position]
        right = centers[position + 1]

        if left <= fraction <= right:
            span = right - left
            blend = 0.0 if span <= 0 else (fraction - left) / span

            return [
                (position, round(1.0 - blend, 6)),
                (position + 1, round(blend, 6)),
            ]

    return [(len(centers) - 1, 1.0)]
