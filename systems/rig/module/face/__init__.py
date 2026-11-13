# coding=utf-8
u"""face 模块包。

本文件只做索引，不导入任何子模块，避免 import 时产生副作用。

文件清单：

    base      FaceModule：控制器风格 + locator 对连接 + 曲线工具
    jaw       下巴：根关节 + 下巴关节，旋转补位移
    eye       眼球：控制器 + 目标约束（追踪）

后续（M2 起）：

    brow      眉毛：定位器生成驱动/目标曲线 + 三段控制器
    lid       眼皮：wire + 眨眼 + 跟随眼球
    lip       嘴唇：三曲线
    zip       拉链嘴
    soft_bs   面片区 BS（脸颊 / 颈阔肌 / 脖子）
    linkage   控制器联动
    weight_init 权重初值（可选）
    corrective 修型驱动接口

约定：

    1. 每个模块继承 FaceModule（来自 base），实现
       create_joints / create_ctrls / connect_rig。
    2. 控制器到关节一律走 connect_ctrl_to_joint()，
       不直接约束 output。
    3. 曲线一律用 create_curve_from_locators() 从定位器生成。
    4. 顶点蒙皮权重由人刷，模块只建 skinCluster。
"""
