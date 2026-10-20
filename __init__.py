# coding=utf-8
u"""
muziRigTool
===========

面向 Maya 2023 的模块化 Rigging 框架。

当前处于基建阶段：包入口、测试入口与 CI 已就绪，业务模块按阶段陆续加入。

正式分层（依赖方向自上而下单向）：

    app
        应用入口、主工具箱、窗口生命周期。

    ui
        公共 PySide Theme、Window 与可复用 Widget。

    systems
        完整 Rig Module 与可重复构建的工作流。

    core
        Maya / Python 通用能力，不包含具体 Rig 业务语义。

    tools
        绑定师直接使用的小型 UI / Action Tool。
"""

__version__ = "0.1.0"
