# coding=utf-8
u"""RigModule：绑定模块基础实现。

生命周期：

    build_rig()     清旧输出 -> 读取 Guide -> 创建关节 -> 创建控制器 -> 整理层级
    connect_rig()   建立驱动连接（子类实现）
    delete_rig()    删除整个模块

设计原则：

    - 模块不负责寻找 Guide，只用外部传进来的
    - 需要几个关节、几个控制器，由子类决定
    - 连接方式（约束 / 矩阵 / 变形器）由子类决定
    - 只包装真正有逻辑的部分：批量创建、串链、总组管理
      单纯转发 core 的方法不在这里重复一遍

和旧库的差异：

    - 去掉 hierarchy_utils 依赖，两个小函数内联
    - 不再包装 create_joint / create_ctrl，子类直接调 core
    - build_rig 先清理旧输出，支持重复构建
"""

from maya import cmds

from ....core.common.hierarchy_utils import ensure_group, parent_keep_world
from ....core.common.name_utils import Name
from ....core.rigging.ctrl_utils import Ctrl
from ....core.rigging.jnt_utils import Jnt


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

    # ------------------------------------------------------------------
    # Guide
    # ------------------------------------------------------------------

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

    # ------------------------------------------------------------------
    # 子类实现
    # ------------------------------------------------------------------

    def create_joints(self):
        u"""创建模块需要的关节。

        子类必须实现，否则 build_rig 会静默什么都不建。
        """

        raise NotImplementedError(
            u"{} 必须实现 create_joints()".format(type(self).__name__)
        )

    def create_ctrls(self):
        u"""创建模块需要的控制器。

        子类必须实现。
        """

        raise NotImplementedError(
            u"{} 必须实现 create_ctrls()".format(type(self).__name__)
        )

    def connect_rig(self):
        u"""建立驱动连接。

        可选实现：纯结构模块（只建关节和控制器）可以不覆盖。
        """

    # ------------------------------------------------------------------
    # 通用构件
    # ------------------------------------------------------------------

    def create_joints_for_guides(self, guides, names):
        u"""按 Guide 和名称列表批量建关节。

        Args:
            guides (list): 定位器列表。
            names (list): 关节名列表，数量和 guides 一致。

        Returns:
            list: Jnt 对象列表。
        """

        return [
            Jnt.create_jnt(name, target=guide)
            for name, guide in zip(names, guides)
        ]

    def create_ctrls_for_guides(
        self,
        guides,
        names,
        shape="circle",
        color=17,
        size=1.0,
        axis="X+",
        hierarchy=True,
        match_position=True,
        match_rotation=True,
        match_scale=True
    ):
        u"""按 Guide 和名称列表批量建控制器。

        Args:
            guides (list): 定位器列表。
            names (list): 控制器名列表。
            shape (str): 形状名。
            color (int): 颜色索引。
            size (float): 大小倍率。
            axis (str): 朝向。
            hierarchy (bool): 是否建完整层级。
            match_position (bool): 是否对齐位置。
            match_rotation (bool): 是否对齐旋转。
            match_scale (bool): 是否对齐缩放。

        Returns:
            list: Ctrl 对象列表。
        """

        return [
            Ctrl.create_ctrl(
                name,
                shape=shape,
                color=color,
                size=size,
                axis=axis,
                target=guide,
                hierarchy=hierarchy,
                match_position=match_position,
                match_rotation=match_rotation,
                match_scale=match_scale
            )
            for name, guide in zip(names, guides)
        ]

    def chain_joints(self, joints, parent=None):
        u"""把关节按顺序串成链。

        第一个挂到 parent（默认 jnt 总组），后续依次挂到上一个关节下。

        Args:
            joints (list): Jnt 对象列表。
            parent (str | None): 链根父级。

        Returns:
            list: 传入的关节列表。
        """

        parent = parent or self.jnt_master_grp

        for jnt in joints:
            cmds.parent(jnt.name, parent, absolute=True)
            parent = jnt.name

        return joints

    def chain_zero_groups(self, ctrls, parent=None):
        u"""把控制器的 zero 组串成链。

        第一个挂到 parent（默认 ctrl 总组），后续挂到上一个控制器的 output，
        这样旋转父控制器会带动整条链。

        Args:
            ctrls (list): Ctrl 对象列表。
            parent (str | None): 链根父级。

        Returns:
            list: 传入的控制器列表。
        """

        parent = parent or self.ctrl_master_grp

        for ctrl in ctrls:
            zero_grp = ctrl.name.replace("ctrl_", "zero_", 1)
            cmds.parent(zero_grp, parent, absolute=True)
            parent = ctrl.get_output()

        return ctrls

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

        固定顺序：清理旧输出 -> Guide -> Joint -> Ctrl -> Hierarchy。
        连接单独放在 connect_rig()，这样创建和连接可以分别测试。

        先清旧输出是为了支持重复构建：同一个实例第二次 build 时，
        上一次的关节和控制器会被删掉再重建，不会撞名。
        """

        self.delete_rig()

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
