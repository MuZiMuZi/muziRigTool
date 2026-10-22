# coding=utf-8
u"""
systems.rig.module
==================

绑定模块。

    base       基类：Guide -> 关节 -> 控制器 -> 层级 + 通用构件
    chain      纯 FK 链
    ikfk       IK/FK 三链（deform / bp / ik / fk + Switch）
    arm        手臂：三链 + 手部挂接点
    leg        腿：三链 + 脚部挂接点

继承关系：

    RigModule
    ├─ FkChain
    └─ LimbIkFk
        ├─ Arm
        └─ Leg

新模块继承 RigModule，重写 create_joints / create_ctrls / connect_rig。
"""
