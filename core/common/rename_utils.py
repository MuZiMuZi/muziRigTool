# coding=utf-8
u"""节点重命名基础操作。

只处理「改名」本身：

    前后缀、查找替换、自动编号、模式命名、范围选择

命名规则（五段式）由 name_utils 负责，这里不做语义解析。

范围：

    选中物体    只处理当前选择
    选中层级    选择 + 它下面的所有 transform
    全场景      所有 transform

批量改名统一按 DAG 深度从深到浅处理：先改子级，避免父级改名后
子级的路径失效。整个操作包在同一个 Undo Chunk 里，一次 Ctrl+Z 可回退。
"""

import functools
import re

from maya import cmds


def undo_chunk(function):
    u"""把一次批量操作包进一个 Undo Chunk。"""

    @functools.wraps(function)
    def wrapper(*args, **kwargs):
        cmds.undoInfo(openChunk=True)

        try:
            return function(*args, **kwargs)
        finally:
            cmds.undoInfo(closeChunk=True)

    return wrapper


# ----------------------------------------------------------------------
# 查询
# ----------------------------------------------------------------------

def get_short_name(node):
    u"""返回节点短名（去掉 DAG 路径）。"""

    return node.split("|")[-1]


def get_selected_objects():
    u"""返回当前选中的对象，按鼠标点击顺序。"""

    return cmds.ls(orderedSelection=True) or []


def get_dag_depth(node):
    u"""返回节点在 DAG 中的深度。"""

    long_name = cmds.ls(node, long=True) or [node]

    return long_name[0].count("|")


def sort_objects_child_first(objects):
    u"""去重后按 DAG 深度从深到浅排序。

    先改子级：父级改名会连带改变子级的长路径，
    如果先改父级，之前记录的子级路径就失效了。

    Args:
        objects (list): 需要排序的节点。

    Returns:
        list: 排序后的节点。
    """

    unique = []

    for node in objects:
        if node not in unique:
            unique.append(node)

    unique.sort(key=get_dag_depth, reverse=True)

    return unique


def get_objects_by_scope(scope_name):
    u"""按范围返回要处理的对象。

    Args:
        scope_name (str): 选中物体 / 选中层级 / 全场景。

    Returns:
        list: 目标节点列表。
    """

    if scope_name == u"选中物体":
        return get_selected_objects()

    if scope_name == u"选中层级":
        selected = get_selected_objects()

        if not selected:
            return []

        collected = []

        for node in selected:
            descendants = cmds.listRelatives(
                node,
                allDescendents=True,
                type="transform",
                fullPath=True
            ) or []

            for child in descendants:
                if child not in collected:
                    collected.append(child)

            if node not in collected:
                collected.append(node)

        return sort_objects_child_first(collected)

    return sort_objects_child_first(cmds.ls(transforms=True, long=True) or [])


# ----------------------------------------------------------------------
# 改名
# ----------------------------------------------------------------------

def rename_node(node, new_name):
    u"""安全重命名单个节点。

    Args:
        node (str): 原节点。
        new_name (str): 新短名。

    Returns:
        str | None: 改名后的名称；跳过或失败时返回 None。
    """

    if not node or not new_name:
        return None

    if not cmds.objExists(node):
        return None

    # 名称没变化时不算一次改名，避免统计虚高
    if get_short_name(node) == new_name:
        return None

    try:
        return cmds.rename(node, new_name)
    except RuntimeError as error:
        cmds.warning(str(error))
        return None


@undo_chunk
def add_prefix(prefix):
    u"""给当前选中的对象批量添加前缀。

    Args:
        prefix (str): 前缀，例如 ctrl_。

    Returns:
        int: 实际改名数量。
    """

    if not prefix:
        return 0

    count = 0

    for node in get_selected_objects():
        new_name = prefix + get_short_name(node)

        if rename_node(node, new_name):
            count += 1

    return count


@undo_chunk
def add_suffix(suffix):
    u"""给当前选中的对象批量添加后缀。

    Args:
        suffix (str): 后缀，例如 _bind。

    Returns:
        int: 实际改名数量。
    """

    if not suffix:
        return 0

    count = 0

    for node in get_selected_objects():
        new_name = get_short_name(node) + suffix

        if rename_node(node, new_name):
            count += 1

    return count


@undo_chunk
def search_replace(search_text, replace_text, scope_name=u"选中物体"):
    u"""按范围执行查找替换。

    Args:
        search_text (str): 要查找的文本。
        replace_text (str): 替换成的文本。
        scope_name (str): 选中物体 / 选中层级 / 全场景。

    Returns:
        int: 实际改名数量。
    """

    if not search_text:
        return 0

    count = 0

    for node in get_objects_by_scope(scope_name):
        short_name = get_short_name(node)

        if search_text not in short_name:
            continue

        new_name = short_name.replace(search_text, replace_text)

        if rename_node(node, new_name):
            count += 1

    return count


# ----------------------------------------------------------------------
# 编号
# ----------------------------------------------------------------------

def number_to_alpha(number, uppercase=True):
    u"""把序号转成字母编号：0 -> A，25 -> Z，26 -> AA。

    Args:
        number (int): 从 0 开始的序号。
        uppercase (bool): 是否大写。

    Returns:
        str: 字母编号。
    """

    letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" if uppercase else "abcdefghijklmnopqrstuvwxyz"
    result = ""
    current = int(number)

    while True:
        result = letters[current % 26] + result
        current = current // 26 - 1

        if current < 0:
            break

    return result


def get_number_string(number, padding, number_type):
    u"""按编号类型生成编号文本。

    Args:
        number (int): 序号，从 1 开始。
        padding (int): 位数，0 表示不补零。
        number_type (str): 数字 / 大写字母 / 小写字母。

    Returns:
        str | None: 编号文本；字母编号遇到非法序号时返回 None。
    """

    if number_type == u"数字":
        text = str(number)

        if padding > 0:
            text = text.zfill(padding)

        return text

    alpha_number = number - 1

    if alpha_number < 0:
        return None

    uppercase = number_type != u"小写字母"
    text = number_to_alpha(alpha_number, uppercase=uppercase)

    if padding <= len(text):
        return text

    fill_character = "A" if uppercase else "a"

    return text.rjust(padding, fill_character)


@undo_chunk
def auto_number(base_name="", start_number=1, padding=3, number_type=u"数字"):
    u"""按选择顺序自动编号。

    base_name 为空时使用每个对象自己的原名。

    Args:
        base_name (str): 基础名称。
        start_number (int): 起始序号。
        padding (int): 位数。
        number_type (str): 数字 / 大写字母 / 小写字母。

    Returns:
        int: 实际改名数量。
    """

    selected = get_selected_objects()

    if not selected:
        return 0

    count = 0

    for index, node in enumerate(selected):
        number_string = get_number_string(
            start_number + index,
            padding,
            number_type
        )

        if number_string is None:
            cmds.warning(u"字母编号的起始序号必须大于等于 1。")
            continue

        head = base_name or get_short_name(node)
        new_name = "{}_{}".format(head, number_string)

        if rename_node(node, new_name):
            count += 1

    return count


# ----------------------------------------------------------------------
# 模式命名
# ----------------------------------------------------------------------

def build_pattern_name(pattern, number):
    u"""把模式里的连续 * 替换成数字编号。

    ctrl_lf_arm_***  +  1  ->  ctrl_lf_arm_001

    Args:
        pattern (str): 含 * 占位符的模式。
        number (int): 序号。

    Returns:
        str: 生成的名称。
    """

    star_blocks = re.findall(r"\*+", pattern)

    if not star_blocks:
        return "{}{}".format(pattern, number)

    parts = re.split(r"\*+", pattern)
    new_name = parts[0]

    for index, star_block in enumerate(star_blocks):
        new_name += str(number).zfill(len(star_block))
        new_name += parts[index + 1]

    return new_name


@undo_chunk
def pattern_rename(pattern):
    u"""按 * 占位规则重命名当前选择。

    连续 * 的数量表示数字位数：*** -> 001。

    Args:
        pattern (str): 例如 ctrl_lf_arm_***。

    Returns:
        int: 实际改名数量。
    """

    if not pattern:
        cmds.warning(u"请输入重命名模式。")
        return 0

    selected = get_selected_objects()

    if not selected:
        return 0

    count = 0

    for index, node in enumerate(selected):
        new_name = build_pattern_name(pattern, index + 1)

        if rename_node(node, new_name):
            count += 1

    return count
