# coding=utf-8
u"""
systems.rig.module
==================

绑定模块。本文件只做索引，不导入任何子模块，避免 ``import`` 时产生额外副作用。

文件清单：

    base          基类：Guide -> 关节 -> 控制器 -> 层级 + 通用构件
    chain         纯 FK 链：关节链 + 控制器链 + parentConstraint
    ikfk          四肢三链（deform / bp / ik / fk + Switch），极向量内联在 create_ik_handle
    ikfk_chain    链式三链，极向量抽成可覆盖的 hook，供无极向量的链使用
    arm           手臂：三链 + 手部挂接点
    leg           腿：三链 + 脚部挂接点
    spine         脊柱：FK 链 + 样条 IK + skinCluster 驱动曲线

实际继承关系（以代码为准）：

    RigModule                        base
    ├─ FkChain                       chain
    ├─ LimbIkFk                      ikfk
    │   ├─ Arm                       arm
    │   └─ Leg                       leg
    ├─ IkFkChain                     ikfk_chain
    └─ Spine                         spine

接线状态：

    已接入工具
        base / ikfk / arm / leg
        tools/rig/limb_tool.py 通过 Arm、Leg 进入工具箱。

    待接入
        chain          FkChain 尚未被任何模块或工具使用。
        ikfk_chain     IkFkChain 是给脊柱、尾巴这类「无极向量」的链准备的基类。
        spine          Spine 已实现，等把脊柱并进身体绑定时再接工具入口。

注意：Spine 现在直接继承 RigModule，没有继承 IkFkChain。
调整继承关系要连同「脊柱并入身体绑定」一起做，并同时补一条 Maya smoke test——
当前没有测试覆盖 Spine，单独改基类无法验证。

新增模块的约定：

    1. 继承 RigModule（需要无极向量的链式三链时继承 IkFkChain）。
    2. 重写 create_joints / create_ctrls / connect_rig。
    3. 节点名在 build_names() 里一次生成，后续一律复用这些稳定名称。
    4. connect_rig() 不靠 listConnections() 反查自己创建的节点。
    5. delete_rig() 先删自己明确拥有的约束，再交给基类删组。
"""
