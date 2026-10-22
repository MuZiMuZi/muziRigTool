# coding=utf-8
u"""RigModule：绑定模块基础实现。

生命周期：

    build_rig()     读取 Guide -> 创建关节 -> 创建控制器 -> 整理层级
    connect_rig()   建立驱动连接（子类实现）
    delete_rig()    删除整个模块

设计原则：

    - 模块不负责寻找 Guide，只用外部传进来的
    - 需要几个关节、几个控制器，由子类决定
    - 连接方式（约束 / 矩阵 / 变形器）由子类决定

和旧库的差异：

    - 去掉 hierarchy_utils 依赖，两个小函数内联
    - 适配新库的 Jnt.create_jnt / Ctrl.create_ctrl
    - 精简 docstring，只保留解释「为什么」的部分
"""

from maya import cmds

from ....core.common.name_utils import Name
from ....core.rigging.ctrl_utils import Ctrl
from ....core.rigging.jnt_utils import Jnt


def ensure_group(name):
    u"""组不存在就创建，存在就复用。

    Args:
        name (str): 组名。

    Returns:
        str: 组名。
    """

    if cmds.objExists(name):
        return name

    return cmds.group(empty=True, name=name)


def parent_keep_world(child, parent):
    u"""挂到父节点下，保持世界位置。"""

    cmds.parent(child, parent, absolute=True)


class RigModule(object):
    u"""所有绑定模块共用的基类。"""

    def __init__(
        self,
        module=None,
        side="md",
        guides=None,
        jnt_parent=None,
        ctrl_parent=None
    ):
        self.module = module
        self.side = side
        self.guides = guides
        self.jnt_parent = jnt_parent
        self.ctrl_parent = ctrl_parent

        # 两个总组从初始化就固定名称，重建时复用它，不会产生第二套
        self.jnt_master_grp = Name(
            type="grp",
            side=side,
            part=module,
            function="jnt",
            index=1
        ).name

        self.ctrl_master_grp = Name(
            type="grp",
            side=side,
            part=module,
            function="ctrl",
            index=1
        ).name

        self.guide_list = []

    def get_guides(self):
        u"""整理并校验 Guide 列表。

        传入单个名称或列表都可以，顺序会被保留——
        关节和控制器的创建顺序依赖它。

        Returns:
            list: Guide 名称。

        Raises:
            RuntimeError: Guide 不存在。
        """

        self.guide_list = []

        if self.guides is None:
            return self.guide_list

        if isinstance(self.guides, (list, tuple)):
            self.guide_list = [str(name) for name in self.guides]
        else:
            self.guide_list = [str(self.guides)]

        # 一开始就检查，错误发生在创建任何节点之前
        for name in self.guide_list:
            if not cmds.objExists(name):
                raise RuntimeError(u"找不到 Guide：{}".format(name))

        return self.guide_list

    def create_joint(self, name, guide=None):
        u"""创建一个关节，可选对齐到 Guide。

        Args:
            name (str): 关节名。
            guide (str): 对齐目标。

        Returns:
            Jnt: 新建的关节。
        """

        return Jnt.create_jnt(name, target=guide)

    def create_ctrl(
        self,
        name,
        guide=None,
        shape="circle",
        color=17,
        size=1.0,
        axis="X+",
        hierarchy=True
    ):
        u"""创建一个控制器，可选对齐到 Guide。

        Args:
            name (str): 控制器名。
            guide (str): 对齐目标。
            shape (str): 形状名。
            color (int): 颜色索引。
            size (float): 大小倍率。
            axis (str): 朝向。
            hierarchy (bool): 是否建完整层级。

        Returns:
            Ctrl: 新建的控制器。
        """

        return Ctrl.create_ctrl(
            name,
            shape=shape,
            color=color,
            size=size,
            axis=axis,
            target=guide,
            hierarchy=hierarchy
        )

    # ------------------------------------------------------------------
    # 子类实现
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""创建模块需要的关节。"""

        pass

    def create_ctrls(self):
        u"""创建模块需要的控制器。"""

        pass

    def connect_rig(self):
        u"""建立驱动连接。"""

        pass

    # ------------------------------------------------------------------
    # 生命周期
    # ------------------------------------------------------------------

    def setup_hierarchy(self):
        u"""创建 jnt / ctrl 总组，并挂到指定父组。

        Returns:
            tuple: (jnt 组名, ctrl 组名)
        """

        ensure_group(self.jnt_master_grp)
        ensure_group(self.ctrl_master_grp)

        if self.jnt_parent:
            parent_keep_world(self.jnt_master_grp, self.jnt_parent)

        if self.ctrl_parent:
            parent_keep_world(self.ctrl_master_grp, self.ctrl_parent)

        return self.jnt_master_grp, self.ctrl_master_grp

    def build_rig(self):
        u"""创建模块的绑定输出。

        固定顺序：Guide -> Joint -> Ctrl -> Hierarchy。
        连接单独放在 connect_rig()，这样创建和连接可以分别测试。
        """

        self.get_guides()
        self.create_joints()
        self.create_ctrls()
        self.setup_hierarchy()

    def delete_rig(self):
        u"""删除模块的 jnt / ctrl 总组及其全部子节点。

        先删 ctrl 组再删 jnt 组：控制器可能约束着关节，
        反过来删会让约束报错。

        Returns:
            list: 被删除的节点名。
        """

        delete_nodes = []

        for name in (self.ctrl_master_grp, self.jnt_master_grp):
            if cmds.objExists(name):
                delete_nodes.append(name)

        if delete_nodes:
            cmds.delete(delete_nodes)

        return delete_nodes
