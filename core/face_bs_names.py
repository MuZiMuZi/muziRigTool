# coding=utf-8
u"""面部修型目标体的标准名字（与主人之前的目标体对齐）。

代码只认名字，不生成形状。融合修型按公式叠权重，不单独建目标体。

注意几个容易写错的名字：
    borrowDown   → 不是，标准写法 browDown
    mouthWide    → 之前的清单里叫 mouthStretch（同一类）
    lipPountleft → 统一成 lipPountLeft
"""

BROW = (
    "browUp", "browDown", "browSqueeze",
)

EYE = (
    "eyeUpWide", "eyeDownWide",
    "eyeUpClose", "eyeDownClose",
    "eyeUpMid", "eyeDownMid",
)

NOSE = ("sneer", "squint")

CHEEK = ("cheekOut", "cheekIn", "cheekUp", "cheekDown")

MOUTH = (
    "mouthSmile", "mouthFrown", "mouthStretch",
    "mouthNarrow", "mouthNarrowUp", "mouthNarrowDown",
    "mouthCornerUp", "mouthCornerDown", "mouthSideLeft",
)

LIP = ("lipRollOut", "lipRollIn", "lipPount", "lipPountLeft")

# 融合修型：**单独雕目标体**，不靠基础形状叠权重。
# 这里记的是「由哪些基础控制驱动它的权重」，只作为连线参考。
COMBINED = (
    "eyeExpand", "eyeCrush",
)

COMBOS = {
    "eyeExpand": ("browUp", "eyeUpWide", "eyeDownWide"),
    "eyeCrush": ("browDown", "sneer", "squint", "eyeUpClose"),
}

ALL = BROW + EYE + NOSE + CHEEK + MOUTH + LIP + COMBINED


def all_targets():
    u"""返回全部目标体名字（含融合修型）。"""

    return list(ALL)


def all_combined():
    u"""返回融合修型的名字。"""

    return list(COMBINED)


def combo_members(name):
    u"""返回融合修型包含的基础目标体。"""

    try:
        return list(COMBOS[name])
    except KeyError:
        raise KeyError(u"没有这个融合修型：{}".format(name))


def validate():
    u"""自检：融合目标引用的基础目标必须存在。

    Returns:
        list: 缺失的名字。

    Raises:
        ValueError: 有引用缺失时抛出，列出全部。
    """

    known = set(ALL)
    missing = []

    for name, members in COMBOS.items():
        for member in members:
            if member not in known:
                missing.append("{} → {}".format(name, member))

    if missing:
        raise ValueError(
            u"融合修型引用了不存在的目标体：{}".format(
                u", ".join(missing)
            )
        )

    return []


def target_name(part, name, index=1):
    u"""拼目标体节点名：bs_<part>_<name>_001。"""

    return "bs_{}_{}_{:03d}".format(part, name, index)
