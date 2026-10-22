# coding=utf-8
u"""Module Guide：定位器模板的导入与查询。

每个模块一个 .ma 模板：

    resources/module_guide/<module>_guide.ma

模板结构：

    grp_md_<module>_guide_001
        └─ zero_<side>_<module>_guide_001
            └─ loc_<side>_<module>_bind_001      根
                └─ zero_<side>_<module>_guide_002
                    └─ loc_<side>_<module>_bind_002    中
                        └─ zero_<side>_<module>_guide_003
                            └─ loc_<side>_<module>_bind_003    末端

        └─ zero_<side>_<module>_pole_001
            └─ loc_<side>_<module>_pole_001      极向量

定位器外面套一层 zero 组：zero 组负责位置，locator 负责旋转，
这样移动定位器时不会影响它的子级链。

用法：

    guide = Guide("arm")
    guide.import_template()
    locators = guide.get_locators("lf")   # [根, 中, 末端, 极向量]
"""

import os

from maya import cmds


# resources/module_guide 的绝对路径
_rig_dir = os.path.dirname(os.path.abspath(__file__))
_package_dir = os.path.dirname(os.path.dirname(_rig_dir))
guide_dir = os.path.join(_package_dir, "resources", "module_guide")


def template_root_name(module):
    u"""返回模块的 Guide 根组名。"""

    return "grp_md_{}_guide_001".format(module)


class Guide(object):
    u"""一个模块的定位器模板。"""

    def __init__(self, module="face"):
        self.module = module
        self.root_name = template_root_name(module)
        self.template_path = os.path.join(
            guide_dir, "{}_guide.ma".format(module)
        )
        self.root = None

    # ------------------------------------------------------------------
    # 导入
    # ------------------------------------------------------------------

    def import_template(self):
        u"""导入模板；已经存在时直接复用。

        Returns:
            str: 根组名。

        Raises:
            IOError: 模板文件不存在。
            RuntimeError: 导入后找不到根组。
        """

        if cmds.objExists(self.root_name):
            self.root = self.root_name

            return self.root

        if not os.path.exists(self.template_path):
            raise IOError(
                u"找不到 {} 的 Guide 模板：{}".format(
                    self.module, self.template_path
                )
            )

        cmds.file(
            self.template_path,
            i=True,
            type="mayaAscii",
            ignoreVersion=True,
            mergeNamespacesOnClash=False,
            namespace=":",
            options="v=0;"
        )

        if not cmds.objExists(self.root_name):
            raise RuntimeError(
                u"模板已导入，但找不到根组：{}".format(self.root_name)
            )

        self.root = self.root_name

        return self.root

    # ------------------------------------------------------------------
    # 查询
    # ------------------------------------------------------------------

    def get_descendants(self):
        u"""返回根组下的所有 transform。"""

        if not cmds.objExists(self.root_name):
            return []

        return cmds.listRelatives(
            self.root_name,
            allDescendents=True,
            type="transform",
            fullPath=True
        ) or []

    def get_locators(self, side="lf"):
        u"""返回一侧的定位器：根 / 中 / 末端 / 极向量。

        Args:
            side (str): lf / rt / md。

        Returns:
            list: locator 名，按顺序；不足时返回已找到的部分。
        """

        descendants = self.get_descendants()
        bind_prefix = "loc_{}_{}_bind_".format(side, self.module)
        pole_name = "loc_{}_{}_pole_001".format(side, self.module)

        binds = []
        pole = None

        for node in descendants:
            short_name = node.split("|")[-1]

            if short_name.startswith(bind_prefix):
                binds.append((short_name, node))
            elif short_name == pole_name:
                pole = node

        # 按 001 / 002 / 003 的序号排序
        binds.sort(key=lambda item: item[0])

        result = [node for _, node in binds]

        if pole:
            result.append(pole)

        return result

    def get_all_locators(self):
        u"""返回左右两侧的所有关节定位器（不含极向量）。

        Returns:
            dict: {"lf": [...], "rt": [...]}
        """

        result = {}

        for side in ("lf", "rt", "md"):
            locators = self.get_locators(side)

            if locators:
                result[side] = locators

        return result
