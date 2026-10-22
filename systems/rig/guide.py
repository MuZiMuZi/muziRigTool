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


def create_auto_pole_vector(start, mid, end, pole, distance=25.0):
    u"""用节点网络让极向量自动保持在关节链平面上。

    极向量不能在「平面法线」上——那样反而垂直于平面。
    正确的位置是平面内、垂直于链的方向：

        v = mid - start
        axis = end - start
        ratio = (v · axis) / (axis · axis)
        proj = start + axis * ratio
        offset = mid - proj          -> 平面内、垂直于链
        pole = mid + normalize(offset) * distance

    这样移动任何一个关节，极向量都会跟着重新定位，
    并且始终和三个关节共面。

    Args:
        start (str): 根关节。
        mid (str): 中间关节。
        end (str): 末端关节。
        pole (str): 极向量定位器。
        distance (float): 距离 mid 的长度。

    Returns:
        list: 建好的节点列表。
    """

    nodes = []

    # 三个关节的世界位置
    decomposers = {}

    for name, node in (("start", start), ("mid", mid), ("end", end)):
        decompose = cmds.createNode(
            "decomposeMatrix",
            name="autoPole_{}_world".format(name)
        )
        cmds.connectAttr(node + ".worldMatrix[0]", decompose + ".inputMatrix")

        decomposers[name] = decompose
        nodes.append(decompose)

    # v = mid - start
    to_mid = cmds.createNode("plusMinusAverage", name="autoPole_toMid")
    cmds.setAttr(to_mid + ".operation", 2)   # subtract
    cmds.connectAttr(decomposers["mid"] + ".outputTranslate", to_mid + ".input3D[0]")
    cmds.connectAttr(decomposers["start"] + ".outputTranslate", to_mid + ".input3D[1]")
    nodes.append(to_mid)

    # axis = end - start
    axis = cmds.createNode("plusMinusAverage", name="autoPole_axis")
    cmds.setAttr(axis + ".operation", 2)
    cmds.connectAttr(decomposers["end"] + ".outputTranslate", axis + ".input3D[0]")
    cmds.connectAttr(decomposers["start"] + ".outputTranslate", axis + ".input3D[1]")
    nodes.append(axis)

    # dot1 = v · axis
    dot_mid = cmds.createNode("vectorProduct", name="autoPole_dotMid")
    cmds.setAttr(dot_mid + ".operation", 1)   # dot（Maya 2023 实测）
    cmds.connectAttr(to_mid + ".output3D", dot_mid + ".input1")
    cmds.connectAttr(axis + ".output3D", dot_mid + ".input2")
    nodes.append(dot_mid)

    # dot2 = axis · axis
    dot_axis = cmds.createNode("vectorProduct", name="autoPole_dotAxis")
    cmds.setAttr(dot_axis + ".operation", 1)
    cmds.connectAttr(axis + ".output3D", dot_axis + ".input1")
    cmds.connectAttr(axis + ".output3D", dot_axis + ".input2")
    nodes.append(dot_axis)

    # ratio = dot1 / dot2
    ratio = cmds.createNode("multiplyDivide", name="autoPole_ratio")
    cmds.setAttr(ratio + ".operation", 2)   # divide
    cmds.connectAttr(dot_mid + ".outputX", ratio + ".input1X")
    cmds.connectAttr(dot_axis + ".outputX", ratio + ".input2X")
    nodes.append(ratio)

    # proj = axis * ratio（标量乘向量，ratio 要连到三个分量）
    projection = cmds.createNode("multiplyDivide", name="autoPole_projection")
    cmds.connectAttr(axis + ".output3D", projection + ".input1")

    for component in ("X", "Y", "Z"):
        cmds.connectAttr(
            ratio + ".outputX",
            projection + ".input2{}".format(component)
        )

    nodes.append(projection)

    # offset = v - proj
    offset = cmds.createNode("plusMinusAverage", name="autoPole_offset")
    cmds.setAttr(offset + ".operation", 2)
    cmds.connectAttr(to_mid + ".output3D", offset + ".input3D[0]")
    cmds.connectAttr(projection + ".output", offset + ".input3D[1]")
    nodes.append(offset)

    # 长度
    distance_node = cmds.createNode("distanceBetween", name="autoPole_length")
    cmds.connectAttr(offset + ".output3D", distance_node + ".point1")
    cmds.setAttr(distance_node + ".point2", 0.0, 0.0, 0.0)
    nodes.append(distance_node)

    # dir = offset / length
    direction = cmds.createNode("multiplyDivide", name="autoPole_direction")
    cmds.setAttr(direction + ".operation", 2)   # divide
    cmds.connectAttr(offset + ".output3D", direction + ".input1")

    for component in ("X", "Y", "Z"):
        cmds.connectAttr(
            distance_node + ".distance",
            direction + ".input2{}".format(component)
        )

    nodes.append(direction)

    # scaled = dir * distance
    scaled = cmds.createNode("multiplyDivide", name="autoPole_scaled")
    cmds.connectAttr(direction + ".output", scaled + ".input1")
    cmds.setAttr(scaled + ".input2", distance, distance, distance)
    nodes.append(scaled)

    # pole = mid + scaled
    final = cmds.createNode("plusMinusAverage", name="autoPole_position")
    cmds.setAttr(final + ".operation", 1)   # sum
    cmds.connectAttr(decomposers["mid"] + ".outputTranslate", final + ".input3D[0]")
    cmds.connectAttr(scaled + ".output", final + ".input3D[1]")
    nodes.append(final)

    cmds.connectAttr(final + ".output3D", pole + ".translate")

    return nodes


def create_pole_display(mid, pole, name="crv_auto_pole_display"):
    u"""创建一条连接关节和极向量的显示曲线。

    两个 CV 分别由 mid 和 pole 的世界位置驱动，
    移动任一端曲线都会跟着变。

    Args:
        mid (str): 中间关节。
        pole (str): 极向量定位器。
        name (str): 曲线名。

    Returns:
        str: 曲线 transform 名。
    """

    curve = cmds.curve(
        point=[(0, 0, 0), (0, 0, 0)],
        degree=1,
        name=name
    )

    shape = cmds.listRelatives(curve, shapes=True)[0]

    # 两端都用世界位置驱动，避免父级空间不一致
    for index, node in enumerate((mid, pole)):
        decompose = cmds.createNode(
            "decomposeMatrix",
            name="{}_cv{}".format(name, index)
        )
        cmds.connectAttr(node + ".worldMatrix[0]", decompose + ".inputMatrix")
        cmds.connectAttr(
            decompose + ".outputTranslate",
            shape + ".cv[{}]".format(index)
        )

    # 曲线本身不参与渲染，只做视觉参考
    cmds.setAttr(shape + ".overrideEnabled", 1)
    cmds.setAttr(shape + ".overrideColor", 6)

    return curve


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
