# coding=utf-8
u"""
core
====

Maya / Python 通用原子能力，不包含具体 Rig 业务语义。

core 是扁平目录，不分子包。模块按用途分组如下，按需直接 import：

    通用场景能力
        attr_utils          Attribute 读写与增删
        hierarchy_utils     层级、父子、分组、节点校验、Long Path
        name_utils          五段式命名（type_side_part_function_index）
        rename_utils        重命名与名称解析
        curve_utils         曲线查询与从边 / 节点建曲线

    Rig 原语
        ctrl_utils          控制器（Ctrl）创建、外观、层级
        jnt_utils           关节（Jnt）与关节链（JntChain）
        jntbas_utils        jntbas 基础关节与 bindPreMatrix 联动
        constraint_utils    约束创建，含极向量约束
        snap_utils          吸附与对齐
        uv_pin_utils        uvPin 驱动定位

    形变与权重
        skin_utils             蒙皮查询与操作
        pose_driver_utils       Pose Driver 网络构建
        pose_gate_math          Pose Driver 的姿态门权重数学
        rbf_pose_driver_utils   RBF Pose Driver 网络构建
        rbf_weight_math         RBF 高斯核与线性求解

已移出（2026-11-13 归档，当前阶段用不上）：

    deformer_weight_utils   变形器权重读写
    weight_math             权重矩阵纯数学运算

    存档位置：C:\\Users\\X\\Documents\\maya\\scripts\\_archives\\
              muziRigTool_removed_2026-11-13\\
    恢复方法见该目录下的 README.md。

约束：core 不允许 import systems / tools / app / ui。
"""
