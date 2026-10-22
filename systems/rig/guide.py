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

import math
import os

from maya import cmds


def _sub(a, b):
    u"""向量相减。"""

    return [a[0] - b[0], a[1] - b[1], a[2] - b[2]]


def _cross(a, b):
    u"""叉乘。"""

    return [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]


def _length(vector):
    u"""向量长度。"""

    return math.sqrt(sum(value * value for value in vector))


def align_pole_to_plane(start, mid, end, pole, distance=None):
    u"""把极向量对齐到关节链所在的平面。

    平面由三个关节点定义，法线是两条边的叉乘。
    极向量放到「mid + 法线 × 距离」上，保证和三个关节共面。

    法线方向沿用极向量当前的方向，不会被翻到另一侧。

    Args:
        start (str): 根关节。
        mid (str): 中间关节。
        end (str): 末端关节。
        pole (str): 极向量定位器。
        distance (float | None): 距 mid 的距离；None 表示保持当前距离。

    Returns:
        list: 极向量的新世界位置；三点共线时返回原位置。
    """

    positions = [
        cmds.xform(node, query=True, worldSpace=True, translation=True)
        for node in (start, mid, end)
    ]

    start_pos, mid_pos, end_pos = positions
    pole_pos = cmds.xform(pole, query=True, worldSpace=True, translation=True)

    first = _sub(mid_pos, start_pos)
    second = _sub(end_pos, mid_pos)
    normal = _cross(first, second)

    length = _length(normal)

    # 三个点共线时平面不存在，直接返回
    if length < 1e-6:
        return pole_pos

    normal = [value / length for value in normal]

    # 沿用当前方向：极向量在法线正侧就保持，负侧就翻过来
    current = _sub(pole_pos, mid_pos)

    if sum(current[index] * normal[index] for index in range(3)) < 0:
        normal = [-value for value in normal]

    if distance is None:
        distance = _length(current)

        if distance < 1e-6:
            distance = 25.0

    new_position = [
        mid_pos[index] + normal[index] * distance
        for index in range(3)
    ]

    cmds.xform(pole, worldSpace=True, translation=new_position)

    return new_position



# resources/module_guide 的绝对路径
_rig_dir = os.path.dirname(os.path.abspath(__file__))
_package_dir = os.path.dirname(os.path.dirname(_rig_dir))
guide_dir = os.path.join(_package_dir, "resources", "module_guide")


def template_root_name(module):
    u"""返回模块的 Guide 根组名。"""

    return "grp_md_{}_guide_001".format(module)


# 身体模板里，各部位对应的关节名片段
# 名字按规范拼写：upperArm / elbow / ankle
body_part_chains = {
    "arm": ("upperArm", "elbow", "wrist"),
    "leg": ("upperLeg", "knee", "ankle"),
    "spine": (
        "spine_guide_001",
        "spine_guide_003",
        "spine_guide_005",
    ),
    "neck": ("neck_guide_001", "neck_guide_002", "head_guide_001"),
}



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

    # ------------------------------------------------------------------
    # 身体模板
    # ------------------------------------------------------------------

    def get_body_chain(self, side, part):
        u"""从 body 模板里取一条肢体关节链。

        body_guide.ma 用的是关节而不是定位器，
        命名是 jnt_<side>_<片段>_guide_001。

        Args:
            side (str): lf / rt / md。
            part (str): arm / leg / spine / neck。

        Returns:
            list: 关节名，按根到末端排序；缺失时返回空列表或部分结果。
        """

        pieces = body_part_chains.get(part)

        if not pieces:
            return []

        result = []

        for piece in pieces:
            # spine / neck / head 的片段里已经带了完整序号
            if piece.startswith(("spine", "neck", "head")):
                name = "jnt_{}_{}".format(side, piece)
            else:
                name = "jnt_{}_{}_guide_001".format(side, piece)

            if cmds.objExists(name):
                result.append(name)

        return result

    def get_body_pole(self, side, part):
        u"""返回 body 模板里某个部位的极向量关节。

        Args:
            side (str): lf / rt / md。
            part (str): arm / leg。

        Returns:
            str | None: 极向量关节名。
        """

        if part not in ("arm", "leg"):
            return None

        name = "jnt_{}_{}_pole_guide_001".format(side, part)

        if cmds.objExists(name):
            return name

        return None

    def get_body_limb(self, side, part):
        u"""返回完整的肢体 guide：3 个关节 + 极向量。

        Args:
            side (str): lf / rt / md。
            part (str): arm / leg。

        Returns:
            list: 4 个节点；极向量缺失时只有 3 个。
        """

        chain = self.get_body_chain(side, part)
        pole = self.get_body_pole(side, part)

        if pole:
            chain.append(pole)

        return chain

    def mirror_chain(self, chain):
        u"""把一条 lf 链镜像成 rt 坐标。

        用于 body 模板只有左侧的情况：创建右侧关节时按 X 取反。

        Args:
            chain (list): 左侧关节名。

        Returns:
            list: [(世界位置, 世界旋转), ...]，按链顺序。
        """

        result = []

        for node in chain:
            position = cmds.xform(
                node, query=True, worldSpace=True, translation=True
            )
            rotation = cmds.xform(
                node, query=True, worldSpace=True, rotation=True
            )

            result.append((
                [-position[0], position[1], position[2]],
                [rotation[0], -rotation[1], -rotation[2]],
            ))

        return result
