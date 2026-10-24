# coding=utf-8
"""chain_skin_utils：一键链式蒙皮。"""
import maya.cmds as cmds
from maya.api import OpenMaya as om
from ..common import hierarchy_utils,scene_utils



def collect_chain_joints(root_joint):
    """从根关节收集整条关节链，父节点在前。"""
    scene_utils.validate_node(root_joint,u'根关节')
    root_joint = scene_utils.get_long_name(root_joint)

    #判断给定的root_joint是不是关节,不是则报错
    if cmds.nodeType(root_joint) != 'joint':
        raise RuntimeError('{}不是关节'.format(root_joint))

    return hierarchy_utils.get_child_object(root_joint,type = 'joint')
