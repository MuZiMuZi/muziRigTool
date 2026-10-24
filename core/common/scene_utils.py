# coding=utf-8
u"""场景清理与查询。

六类清理：

    空组     没有 shape、没有子级的 transform
    历史     Construction History
    冻结     makeIdentity
    解锁     标准 transform 通道
    Pivot    几何中心
    Unknown  未知节点

安全保护（命中即跳过）：

    默认相机、Reference 节点、动画曲线输入、约束输入、Deformer 历史

所有批量操作都包在 undo_chunk 里，一次 Ctrl+Z 回退整批。
"""

import functools

from maya import cmds


def validate_node(node ,label = None):
    """
    检验节点名称是否符合规范
    :param node: Maya 节点名或 DAG Path，例如 "root"、"|grp|root"
    :param label:可选的字符串，例如 "根关节"、"子节点"、"Parent"
    :return:
    """
    display_label = label or u'maya节点'
    #拦截为空的名称
    if node is None :
        raise RuntimeError (u"{}名称不能为空。".format (display_label))

    node = str (node).strip ()

    if not node :
        raise RuntimeError (u"{}名称不能为空。".format (display_label))
    #如果node里有.的话说明是属性
    if "." in node :
        raise RuntimeError (
            u"{}必须是 Maya Node，不能是 Plug / Component：{}".format (
                display_label , node
            )
        )
    # 判断节点名称是否存在场景里
    if not cmds.objExists (node) :
        raise RuntimeError (
            u"{}不存在：{}".format (display_label , node)
        )

    return True

def get_long_name(node):
    "获取节点的长名字，名称不唯一的时候报错"
    #检验名称
    validate_node(node)

    matches = cmds.ls (node , long = True)

    if matches is None :
        matches = []

    if not matches :
        return str (node)

    if len (matches) > 1 :
        raise RuntimeError (
            u"节点名称不唯一，请使用完整路径：{}".format (node)
        )

    return matches [0]