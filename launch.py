# coding=utf-8
u"""开发期启动入口。

Maya 里改完代码后不用重启，直接：

    from muziRigTool import launch
    launch.launch()

它会按依赖顺序重新加载模块，然后打开工具箱。

为什么需要 reload：

    Python 3 不会自动重新读磁盘上的 .py 文件，
    已经 import 过的模块会一直用内存里的旧版本。
"""

from importlib import import_module, reload


# 按依赖顺序：底层在前，上层在后
reload_order = (
    "muziRigTool.ui.theme",
    "muziRigTool.core.common.rename_utils",
    "muziRigTool.core.common.scene_utils",
    "muziRigTool.core.rigging.snap_utils",
    "muziRigTool.core.rigging.ctrl_utils",
    "muziRigTool.tools",
    "muziRigTool.app.toolbox",
)


def reload_modules():
    u"""重新加载 muziRigTool 下的关键模块。

    Returns:
        list: 成功重载的模块名。
    """

    reloaded = []

    for name in reload_order:
        try:
            module = import_module(name)
            reload(module)
            reloaded.append(name)
        except ImportError:
            # 模块还没创建过，跳过
            continue

    return reloaded


def launch():
    u"""重载模块并打开工具箱。

    Returns:
        ToolboxWindow: 工具箱窗口。
    """

    reload_modules()

    from muziRigTool.app import toolbox

    return toolbox.main()


def reload_and_launch():
    u"""launch 的别名，方便记忆。"""

    return launch()
