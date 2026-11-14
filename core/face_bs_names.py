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

# 融合修型：主人给的两个只是**参考示例**，不强制实现。
# 真正做的时候按项目需要另定组合；这里保留公式，方便连线时参考。
COMBO_EXAMPLES = {
    "eyeExpand": ("browUp", "eyeUpWide", "eyeDownWide"),
    "eyeCrush": ("browDown", "sneer", "squint", "eyeUpClose"),
}

# 基础目标体（不含示例组合）
ALL = BROW + EYE + NOSE + CHEEK + MOUTH + LIP


def all_targets():
    u"""返回全部基础目标体名字。"""

    return list(ALL)


def combo_examples():
    u"""返回参考用的融合修型（名字 → 成员）。"""

    return dict(COMBO_EXAMPLES)


def combo_members(name):
    u"""返回示例融合修型包含的基础目标体。"""

    try:
        return list(COMBO_EXAMPLES[name])
    except KeyError:
        raise KeyError(u"没有这个融合示例：{}".format(name))


def validate():
    u"""自检：融合目标引用的基础目标必须存在。

    Returns:
        list: 缺失的名字。

    Raises:
        ValueError: 有引用缺失时抛出，列出全部。
    """

    known = set(ALL)
    missing = []

    for name, members in COMBO_EXAMPLES.items():
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


def target_name(side, part, function, index=1):
    u"""按五段式拼目标体节点名：bs_<side>_<part>_<function>_001。

    例：bs_lf_brow_browUp_001。
    """

    from .name_utils import Name

    return Name(
        type="bs", side=side, part=part,
        function=function, index=index
    ).name
