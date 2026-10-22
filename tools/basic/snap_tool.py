# coding=utf-8
u"""快速吸附工具。

把最后一个选择吸附到前面所有选择的平均位置和平均旋转。

    选择 A B C D  ->  A B C 是参考，D 被吸附到它们的平均位置

TOOL_MODE = "action"：双击直接执行，不建窗口。
"""

from maya import cmds

from ...core.rigging import snap_utils


TOOL_MODE = "action"


def main():
    u"""按当前选择执行一次快速吸附。

    Returns:
        bool: 成功返回 True。
    """

    selection = cmds.ls(orderedSelection=True) or []

    if len(selection) < 2:
        cmds.warning(u"至少选择两个对象，最后一个作为被吸附目标。")
        return False

    references = selection[:-1]
    target = selection[-1]

    cmds.undoInfo(openChunk=True)

    try:
        result = snap_utils.snap_to_average(
            reference_items=references,
            target_item=target,
            include_rotation=True
        )
    except Exception as error:
        cmds.warning(str(error))
        return False
    finally:
        cmds.undoInfo(closeChunk=True)

    print(u"已吸附到：{}".format(
        [round(value, 3) for value in result["position"]]
    ))

    return True
