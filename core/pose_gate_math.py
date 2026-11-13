# coding=utf-8
u"""姿态门控数学。

把关节相对中立姿态的角度差值，换算成 8 个方向的修型权重。

纯 Python，不 import Maya，可以直接单测。

公式沿用 ADV 左肩 Pose Driver V5：

    gate(delta) = smoothstep(clamp(sign * delta / angle, 0, 1))
    smoothstep(t) = t * t * (3 - 2 * t)

A 轴决定 up / down，B 轴决定 front / back。
单轴权重 = 本方向门 * 另一轴未被占用的余量；
双轴权重 = 两个方向门相乘。

这套结构自带四个性质，不需要调参：

    中立全零        所有 delta 为 0 时门为 0
    单轴隔离        另一轴门为 0，双轴权重必然是 0
    超限保持        clamp 到 1，角度再大也不衰减
    权重不为负      同轴两门互斥，1 - front - back 恒大于等于 0

一个容易忽略的事实：中间态总权重是 ``U + F - U * F``，
只有单轴或双轴满时才等于 1。这是 V5 的原始语义，不是 bug。
"""

direction_list = (
    "up",
    "down",
    "front",
    "back",
    "front_up",
    "front_down",
    "back_up",
    "back_down",
)

single_axis_directions = ("up", "down", "front", "back")

diagonal_directions = ("front_up", "front_down", "back_up", "back_down")

direction_labels = {
    "up": u"上抬",
    "down": u"下压",
    "front": u"前摆",
    "back": u"后摆",
    "front_up": u"前上",
    "front_down": u"前下",
    "back_up": u"后上",
    "back_down": u"后下",
}


def clamp01(value):
    u"""把数值压回 0 ~ 1。

    Args:
        value (float): 任意数值。

    Returns:
        float: 0 ~ 1 之间的值。
    """

    value = float(value)

    if value < 0.0:
        return 0.0

    if value > 1.0:
        return 1.0

    return value


def smooth_step(value):
    u"""标准 smoothstep：t²(3 − 2t)。

    输入先压回 0 ~ 1。两端导数为零，所以权重进入和离开时没有拐折。

    Args:
        value (float): 0 ~ 1 之间的进度。

    Returns:
        float: 平滑后的值。
    """

    value = clamp01(value)

    return value * value * (3.0 - 2.0 * value)


def direction_gate(delta, sign, angle):
    u"""单个方向门。

    ``sign * delta / angle`` 表示「往这个方向转了多少比例」，clamp 之后
    交给 smoothstep。超过阈值角度后保持 1，因此角度再大也不会掉权重。

    Args:
        delta (float): 当前角度相对中立姿态的差值。
        sign (int): 1 或 -1，表示这个方向对应轴的正向还是负向。
        angle (float): 阈值角度，必须大于 0。

    Returns:
        float: 0 ~ 1 的门值。

    Raises:
        ValueError: sign 不是 ±1，或 angle 不是正数。
    """

    if sign not in (-1, 1):
        raise ValueError(u"方向符号只能是 1 或 -1，收到：{}".format(sign))

    if angle <= 0.0:
        raise ValueError(u"阈值角度必须大于 0，收到：{}".format(angle))

    return smooth_step(float(sign) * float(delta) / float(angle))


def gate_weights(delta_a, delta_b, angle_a, angle_b, enabled=None):
    u"""计算 8 个方向的权重。

    Args:
        delta_a (float): A 轴相对中立姿态的差值。
        delta_b (float): B 轴相对中立姿态的差值。
        angle_a (float): A 轴阈值角度。
        angle_b (float): B 轴阈值角度。
        enabled (iterable): 启用的方向；None 表示全部启用。
            未启用的方向返回 0.0。

    Returns:
        dict: {方向名: 权重}，键顺序与 direction_list 一致。

    Raises:
        ValueError: 方向名非法，或阈值角度非法。
    """

    enabled_names = _resolve_enabled(enabled)

    up = direction_gate(delta_a, -1, angle_a)
    down = direction_gate(delta_a, 1, angle_a)
    front = direction_gate(delta_b, 1, angle_b)
    back = direction_gate(delta_b, -1, angle_b)

    # 同一根轴上两个方向互斥，所以这两个余量一定落在 0 ~ 1
    free_a = 1.0 - (up + down)
    free_b = 1.0 - (front + back)

    weights = {
        "up": up * free_b,
        "down": down * free_b,
        "front": front * free_a,
        "back": back * free_a,
        "front_up": front * up,
        "front_down": front * down,
        "back_up": back * up,
        "back_down": back * down,
    }

    result = {}

    for name in direction_list:
        if name in enabled_names:
            result[name] = weights[name]
        else:
            result[name] = 0.0

    return result


def total_weight(delta_a, delta_b, angle_a, angle_b):
    u"""返回 8 个方向权重之和，用于验证中间态语义。

    理论值：``U + F - U * F``，其中 U 是 A 轴双门之和，F 是 B 轴双门之和。

    Args:
        delta_a (float): A 轴差值。
        delta_b (float): B 轴差值。
        angle_a (float): A 轴阈值。
        angle_b (float): B 轴阈值。

    Returns:
        float: 权重总和。
    """

    up = direction_gate(delta_a, -1, angle_a)
    down = direction_gate(delta_a, 1, angle_a)
    front = direction_gate(delta_b, 1, angle_b)
    back = direction_gate(delta_b, -1, angle_b)

    amount_a = up + down
    amount_b = front + back

    return amount_a + amount_b - amount_a * amount_b


# ----------------------------------------------------------------------
# 内部
# ----------------------------------------------------------------------

def _resolve_enabled(enabled):
    u"""把 enabled 参数归一化成方向名集合。

    Args:
        enabled (iterable): 方向列表；None 表示全部。

    Returns:
        set: 方向名集合。

    Raises:
        ValueError: 出现未知方向名。
    """

    if enabled is None:
        return set(direction_list)

    names = set(enabled)

    for name in names:
        if name not in direction_list:
            raise ValueError(u"未知方向：{}".format(name))

    return names
