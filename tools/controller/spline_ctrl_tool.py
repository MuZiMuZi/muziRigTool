# coding=utf-8
u"""曲线控制器工具。

用于裙子 / 飘带 / 绳子这类沿曲线排布的次级控制。

界面：

    ┌─────────────────────────────────┐
    │ 曲线                             │
    │  [留空则用当前选择的曲线  ] [拾取] │
    │  ☐ 按跨度数重建曲线               │
    │  跨度数 [ 5 ]  次数 [ 3 ]         │
    │  控制点 ≈ 8 个（跨度数 + 3）      │
    │  ☑ 创建变形骨骼（跟随控制器）     │
    │  ☐ 创建 FK 控件（摆造型用）       │
    ├─────────────────────────────────┤
    │ 控制器名称  [spline            ] │
    ├─────────────────────────────────┤
    │ [        创建曲线控制器          ]│
    │ 状态：…                          │
    └─────────────────────────────────┘

生成的层级（N 个控制点）：

    grp_md_<part>_rig_001
    ├─ grp_md_<part>_jnt_001                骨骼组（默认隐藏）
    │   └─ jnt_md_<part>_bind_001 …         每根关节绑一个控制器
    ├─ grp_md_<part>_crv_001                曲线组（默认隐藏）
    │   └─ crv_md_<part>_spline_001         参考曲线（只用来排控制器）
    └─ grp_md_<part>_ctrl_001               控制器组（唯一默认可见的）
        ├─ zero_md_<part>_main_001          主控制器，位置在曲线最低点
        │   ├─ driven / space / connect / offset
        │   │   └─ ctrl_md_<part>_main_001
        │   └─ grp_md_<part>_pos_001        pos 组：和主控制器同位置
        ├─ zero_md_<part>_sub_001
        │   └─ driven_md_<part>_sub_001     ← 比例驱动写在这一层
        │       └─ space / connect / offset
        │           └─ ctrl_md_<part>_sub_001
        └─ zero_md_<part>_sub_002 …

FK 控件（可选）：

    output_md_<part>_main_001
    └─ ctrl_md_<part>_fk_N → … → ctrl_md_<part>_fk_001    一串父子链
        └─ 比例控制器挂在对应 FK 的 output 下面

    FK 挂在主控制器的 output 下，主控一动整串跟着走，不会留在起始位置
    （不然切到 FK 时看起来就像「回到默认形状」了）。
    转一节 FK，后面的控制点跟着甩，关节再跟着控制器走。

    FK 只作用在「曲线控制点」这一层，不去和 IK 抢骨骼，所以两套是叠加关系：
    比例驱动负责跟随主控，FK 负责手动摆造型，可以同时用、不会互相丢姿态。

    主控制器上的 ctrlType 是 enum，切换显示哪一套：

        0  IK    只显示比例控制器
        1  FK    只显示 FK 控件
        2  Both  两套都显示

    只切形状可见性，transform 一直在工作，所以切换不会改变姿态。

卷曲（curl，只在建 FK 控件时出现）：

    主控制器上的 curl（0 ~ 1）驱动 FK 链逐节旋转，绕控制器局部 X 轴：

        旋转 = clamp(curl - 启动时间, 0, 窗口) × 角度 / 窗口

        启动时间  尖端 0，往根部每节 +0.15  —— 尖端先动，根部后动
        角度      根部给满 90，往尖端**线性递减**（4 节时 22.5 / 45 / 67.5 / 90）
        窗口      0.35，相邻两节运动重叠，不会「一节转完才转下一节」

    每节三个节点：plusMinusAverage（扣启动时间）→ clamp（0 ~ 窗口）
    → multiplyDivide（换算成角度）。

默认显示状态：

    只有控制器组可见。骨骼、ikHandle、曲线、簇都隐藏，
    场景里专心摆控制器就行；要做蒙皮时临时打开骨骼组。
    主控制器上有 show_jnt / show_crv 两个开关，比去 Outliner 找组方便。

拉动上限：

    主控制器上有 maximumLength（默认 1000，等于不限制）。
    调小就是限制主控制器能把链条拉动多远，防止节间距被拉散、布料看起来被拉长。
    这是位移截断，不是曲线弧长的求解。

重复构建：

    骨骼名和数量都对得上时，只清掉控制器组、曲线组和旧 ikHandle，
    骨骼原地保留并更新位置 —— 这样已经刷好的蒙皮权重不会丢。
    骨骼数量变了才会整套重建（这时候蒙皮需要重新做）。

形变层（勾选「创建变形骨骼」时创建）：

    ctrl_md_<part>_sub_N ──pointConstraint──> jnt_md_<part>_bind_N

    关节链本身是连着的（骨骼显示正常），但每根关节直接绑到对应控制器上，
    不经过曲线、不用 spline IK —— 控制器摆到哪，关节就跟到哪。
    骨骼做完蒙皮就能驱动布料。

控制器位置：

    主控制器、小控制器和骨骼都按「沿曲线等弧长」排布，不取 CV 位置。
    CV 是控制多边形的顶点，重建只保证参数均匀、不保证弧长均匀，
    曲率大的地方会挤在一起——直接拿它当控制器位置，间距就忽长忽短。
    CV 仍然由簇绑在对应控制器上，控制器的位置不影响驱动。

编号规则：

    ctrl_..._sub_001 在曲线末端（离主控制器最远），编号越大越靠近主控制器。
    默认比例按「越近跟随越多」分布：第 i 个 = i / N，
    所以最远的给 1/N，最近的给满 1.0。

驱动关系：

    ctrl_md_<part>_main_001  --parentConstraint-->  grp_md_<part>_pos_001
    grp_md_<part>_pos_001.translate × ratio_N  -->  driven_md_<part>_sub_N.translate
    grp_md_<part>_pos_001.rotate    × ratio_N  -->  driven_md_<part>_sub_N.rotate

    位移全部接；旋转只接给最靠近主控制器的那个（ratio_N 里 N 最大的）。
    更远的控制器只位移不转：它们各自绕自己的轴心转，头发 / 飘带看起来会很怪。

驱动方式：

    界面固定用 ratio（比例位移）：每个控制器按比例跟随，越远跟得越少。
    代价是节与节的距离会变，拉大时曲线会被拉长/压短，
    所以主控制器上给了 maximumLength 截断拉动幅度。

    chain（父子链）保留在接口里（create_spline_ctrl 的 drive_mode），
    整条刚性跟随、长度严格不变，需要时可以直接从代码调用。

为什么驱动写在 driven 层：

    控制器层级里本来就有 driven（zero → driven → space → connect → offset → ctrl）。
    driven 和控制器同位置、自身 translate 初始为 0，正好用来接收位移，
    不需要额外再建一个驱动组。

为什么 pos 组挂在主控制器的 zero 组下面：

    pos 组和主控制器同位置，自身 translate 初始是 0。
    主控制器移动 Δ 时 pos 组跟着走 Δ，但它的父级（zero 组）没有动，
    所以 pos.translate 正好等于纯位移 Δ —— 乘比例乘的就是这个量。
    如果把 pos 组挂到世界层级，它的 translate 会变成「世界坐标」，包含基础位置，乘完就飞了。

比例属性：

    ctrl_md_<part>_main_001 上会生成 ratio_001 / ratio_002 / …，
    默认值按「越靠近主控制器越大」分布：第 i 个 = i / N，范围 0 ~ 1。

    比如 5 个控制器是 0.2 / 0.4 / 0.6 / 0.8 / 1.0，
    和主控制器同位置的那个给满 1.0，最远的给 0.2。

跳过第 2 / 倒数第 2 个控制点（固定行为，界面不提供开关）：

    默认勾上。这两个点紧挨着曲线两端，控制器放上去会挤在一起、不好点选，
    所以不建控制器、不绑簇。首尾两个点仍然有控制器。

    曲线本身形状不变；关节仍然跨整条曲线等弧长分布。

通道盒分组：
    主控制器的属性按组分段，段与段之间插一条不可 K 的分隔属性：

        --------limit--------    maximumLength
        --------ratio--------    ratio_001 … ratio_N
        --------show--------     ctrlType / show_jnt / show_crv

    分隔属性是只有一个选项的 enum，不参与任何连接，纯视觉分隔。

职责划分：

    本文件     只负责界面编排、参数收集与这套绑定流程的编排
    Ctrl       负责控制器创建、形状、颜色、层级
    curve_utils 负责曲线查询与等参数采样
    hierarchy_utils 负责组与挂接
    attr_utils 负责自定义属性
"""

from PySide2 import QtWidgets

from maya import cmds
from maya.app.general.mayaMixin import MayaQWidgetBaseMixin

from ...core import attr_utils
from ...core import curve_utils
from ...core import hierarchy_utils
from ...core import jnt_utils
from ...core import name_utils
from ...core.ctrl_utils import Ctrl


DEFAULT_PART = "spline"

# 重建曲线参数：和 Maya「重建曲线选项」里的「跨度数 / 次数」一一对应。
# 控制点数量 = 跨度数 + 次数（以重建结果为准，代码会读回来再用）。
DEFAULT_SPANS = 5
DEFAULT_DEGREE = 3

# 外观：主控制器给一个明显更大的方块；IK（次级）用方块，FK 用圆环，和身体模块保持一致。
MAIN_SHAPE = "cube"
MAIN_COLOR = 17
MAIN_SIZE = 2.5

SUB_SHAPE = "cube"
SUB_COLOR = 13
SUB_SIZE = 0.8

# FK 控件：串成父子链，挂在主控制器下面，用来手动摆造型。
# 全局约定 IK 方块、FK 圆环，所以这里用圆形，和比例控制器（方块）一眼能分开。
FK_SHAPE = "circle"
FK_COLOR = 6
FK_SIZE = 1.1

# 卷曲（curl）参数。
# 卷曲从尖端开始，逐节往根部传导，越靠根部转得越多——这样才会卷成一圈套一圈。
CURL_AXIS = "X"           # 绕控制器局部哪个轴转
CURL_BASE_ANGLE = 90.0    # 根部那节在 curl = 1 时转多少度
CURL_ONSET_STEP = 0.15    # 每往根部退一节，启动时间晚多少（curl 单位）
CURL_WINDOW = 0.35        # 每节从 0 转到满角度的过渡宽度（越大越软）

# 主控制器上 maximumLength 的默认值：给得很大，等于不限制。
# 调小就是限制主控制器能把链条拉动多远（防止节间距被拉散）。
DEFAULT_MAX_LENGTH = 1000.0

# 驱动方式。
#   ratio  每个控制器按比例跟随主控制器（有逐级衰减，会轻微拉伸）
#   chain  父子链，整条刚性跟随（长度严格不变，旋转会真的甩动）
DRIVE_MODE_RATIO = "ratio"
DRIVE_MODE_CHAIN = "chain"

DRIVE_MODES = (DRIVE_MODE_RATIO, DRIVE_MODE_CHAIN)


# ----------------------------------------------------------------------
# 名称
# ----------------------------------------------------------------------

def make_name(node_type, part, function, index=1):
    u"""统一走五段式命名接口，不手工拼字符串。"""

    return name_utils.Name(
        type=node_type,
        side="md",
        part=part,
        function=function,
        index=index
    ).name


def ratio_attr_name(index):
    u"""第 N 个控制器对应的比例属性名。"""

    return "ratio_{:03d}".format(index)


# ----------------------------------------------------------------------
# 取曲线与点位
# ----------------------------------------------------------------------

def get_source_curve(crv_name=None):
    u"""取要采样的曲线。

    优先用传入的名称，其次从当前选择里找第一条 NURBS 曲线。

    Args:
        crv_name (str | None): 曲线名称；None 表示用当前选择。

    Returns:
        str: 曲线 shape 的 Long Path。

    Raises:
        RuntimeError: 找不到曲线。
    """

    if crv_name:
        if not cmds.objExists(crv_name):
            raise RuntimeError(u"曲线不存在：{}".format(crv_name))

        return curve_utils.get_curve_shape(crv_name)

    selection = cmds.ls(selection=True, long=True) or []

    for node in selection:
        try:
            return curve_utils.get_curve_shape(node)
        except RuntimeError:
            # 选中的不是曲线，继续看下一个
            continue

    raise RuntimeError(
        u"请先选择一条 NURBS 曲线，或在「曲线」里填写曲线名称。"
    )


def get_control_points(curve, rebuild, spans, degree):
    u"""生成一条专用的变形曲线，并返回它的控制点。

    为什么要专用曲线：
        曲线只用来排控制器位置，不参与形变。
        直接拿用户原本那条，重建时会把原曲线改坏，而且也会污染输入。

    重建时按「跨度数 + 次数」交给 Maya 的 rebuildCurve；
    不重建时复制一条（CV 数量和形状都保持原样）。

    Args:
        curve (str): 源曲线 shape。
        rebuild (bool): 是否重建曲线。
        spans (int): 重建时的跨度数。
        degree (int): 重建时的阶数。

    Returns:
        tuple: (控制点列表, 新建的曲线名)
    """

    if rebuild:
        work_curve = curve_utils.rebuild_curve(curve, spans, degree)
    else:
        duplicated = cmds.duplicateCurve(curve)

        if not duplicated:
            raise RuntimeError(u"复制曲线失败：{}".format(curve))

        work_curve = duplicated[0]

    points = curve_utils.get_curve_cv_positions(work_curve, world_space=True)

    if len(points) < 2:
        cmds.delete(work_curve)
        raise RuntimeError(
            u"控制点不足 2 个，无法生成曲线控制器：{}".format(curve)
        )

    return points, work_curve


# ----------------------------------------------------------------------
# 控制器
# ----------------------------------------------------------------------

def create_placed_ctrl(name, position, shape, color, size, parent):
    u"""按标准流程建控制器，放到指定世界位置，再挂到 parent 下。

    Ctrl.create_ctrl 负责形状 / 颜色 / 大小 / 层级，
    这里只补两件事：把整条层级挪到目标位置、挂到指定父级。

    Args:
        name (str): 控制器名称。
        position (list): 世界坐标 [x, y, z]。
        shape (str): 形状名。
        color (int): 颜色索引。
        size (float): 大小倍率。
        parent (str): 挂接父级。

    Returns:
        tuple: (Ctrl 对象, 最外层 zero 组名, driven 组名)

        返回 driven 组是给调用方接驱动用的：
        driven 组和控制器同位置、自身 translate 为 0，
        所以「往 driven 上写位移」等于「整条控制器偏移多少」。
    """

    ctrl = Ctrl.create_ctrl(
        name,
        shape=shape,
        color=color,
        size=size,
        axis="Y+",
        target=None,
        hierarchy=True
    )

    zero_name = name.replace("ctrl_", "zero_", 1)
    driven_name = name.replace("ctrl_", "driven_", 1)

    # create_hierarchy 建出来的每一层都对齐在控制器位置，挪 zero 就等于挪整条。
    cmds.xform(zero_name, worldSpace=True, translation=position)
    hierarchy_utils.parent_keep_world(zero_name, parent)

    return ctrl, zero_name, driven_name


def add_separator(node, label):
    u"""在通道盒里插一条分组线，把同类属性隔开。

    做法：加一个不可 K 的 enum 属性，显示名是一串虚线 + 分组名。

    属性名必须合法（Maya 不接受连字符），所以真名用 ``sep_<label>``，
    再用 niceName 把通道盒里显示的名字换成虚线。

    Args:
        node (str): 节点名，一般是主控制器。
        label (str): 分组名。

    Returns:
        str: 属性名。
    """

    name = u"sep_{}".format(label)
    display = u"--------{}--------".format(label)
    node_attr = attr_utils.Attr(node)

    if node_attr.attr_exists(name):
        return name

    cmds.addAttr(
        node,
        longName=name,
        niceName=display,
        attributeType="enum",
        enumName=display,
        keyable=False
    )

    return name


def add_ratio_attr(main_ctrl, index, total):
    u"""在主控制器上创建第 index 个比例属性。

    默认值按「越靠近主控制器越大」分布，最近的给满，远处的按比例削：

        第 i 个 = i / total

    比如 5 个控制器就是 0.2 / 0.4 / 0.6 / 0.8 / 1.0，
    第 5 个（和主控制器同位置那个）是 1.0，最远的第 1 个是 0.2。

    Args:
        main_ctrl (str): 主控制器名称。
        index (int): 控制器序号，从 1 开始，越大越靠近主控制器。
        total (int): 控制器总数。

    Returns:
        str: 属性名。
    """

    name = ratio_attr_name(index)
    node_attr = attr_utils.Attr(main_ctrl)

    if node_attr.attr_exists(name):
        return name

    node_attr.add_attr(
        name,
        attr_type="double",
        # 用 round 收一下浮点误差：1/3 这类值直接写进属性会显示一长串小数。
        default=round(float(index) / float(total), 3) if total else 1.0,
        min_value=0.0,
        max_value=1.0
    )

    return name


def create_pull_limit(main_ctrl, pos_group, part):
    u"""把 pos 的位移夹在 ±maximumLength 之内，返回夹过之后的三个通道引脚。

    为什么要夹：控制器按比例被拉出去，拉得越远节间距变得越多，布料看起来就被拉长。
    给主控制器一个上限，超出的部分直接截断，链条不会被拉散。

    注意：这是「拉动幅度上限」，不是曲线弧长解算。
    真正限制曲线长度需要额外的求解，这里只做最简单可靠的截断。

    Args:
        main_ctrl (str): 主控制器名称，上面需要有 maximumLength 属性。
        pos_group (str): pos 组名称。
        part (str): 部位 token。

    Returns:
        dict: {"X": plug, "Y": plug, "Z": plug}，夹过之后的位移引脚。
    """

    clamp = cmds.createNode("clamp", name=make_name("clm", part, "limit", 1))
    negative = cmds.createNode(
        "multiplyDivide", name=make_name("mul", part, "neg", 1))

    cmds.connectAttr(
        "{}.translateX".format(pos_group), "{}.inputR".format(clamp), force=True)
    cmds.connectAttr(
        "{}.translateY".format(pos_group), "{}.inputG".format(clamp), force=True)
    cmds.connectAttr(
        "{}.translateZ".format(pos_group), "{}.inputB".format(clamp), force=True)

    # 上限取正值，下限用 -1 乘出来；一个 clamp 节点就能吃三个通道。
    cmds.connectAttr(
        "{}.maximumLength".format(main_ctrl),
        "{}.input1X".format(negative),
        force=True
    )
    cmds.setAttr("{}.input2X".format(negative), -1.0)

    for channel in ("R", "G", "B"):
        cmds.connectAttr(
            "{}.maximumLength".format(main_ctrl),
            "{}.max{}".format(clamp, channel),
            force=True
        )
        cmds.connectAttr(
            "{}.outputX".format(negative),
            "{}.min{}".format(clamp, channel),
            force=True
        )

    return {
        "X": "{}.outputR".format(clamp),
        "Y": "{}.outputG".format(clamp),
        "Z": "{}.outputB".format(clamp),
    }


def connect_scaled_channel(main_ctrl, driven_group, part, index,
                           function, channel, sources):
    u"""把某个通道 × 比例，接到 driven 的同一个通道。

    每个轴单独连：位移那一路要先过 clamp，所以不能整个三元组一起传。

    Args:
        main_ctrl (str): 主控制器名称。
        driven_group (str): 小控制器的 driven 组名称。
        part (str): 部位 token。
        index (int): 控制器序号。
        function (str): 命名用的功能字段，ratio / rot。
        channel (str): 要连的通道，translate 或 rotate。
        sources (dict): {"X": plug, "Y": plug, "Z": plug}。

    Returns:
        str: 创建的 multiplyDivide 节点名。
    """

    ratio_name = ratio_attr_name(index)
    multiplier = cmds.createNode(
        "multiplyDivide",
        name=make_name("mul", part, function, index)
    )

    for axis in ("X", "Y", "Z"):
        cmds.connectAttr(
            sources[axis],
            "{}.input1{}".format(multiplier, axis),
            force=True
        )
        # 一个 double 属性同时驱动三个分量，比例对 XYZ 一致生效。
        cmds.connectAttr(
            "{}.{}".format(main_ctrl, ratio_name),
            "{}.input2{}".format(multiplier, axis),
            force=True
        )

    cmds.connectAttr(
        "{}.output".format(multiplier),
        "{}.{}".format(driven_group, channel),
        force=True
    )

    return multiplier


def connect_ratio(main_ctrl, driven_group, part, index, total,
                  translate_sources, rotate_sources):
    u"""把「pos × 比例」接到小控制器的 driven 层。

    位移全部接（先过 maximumLength 截断）；旋转只接给最靠近主控制器的那个：
    更远的控制器如果也转，是各自绕自己的轴心原地转，头发/飘带看起来会很怪。

    Args:
        main_ctrl (str): 主控制器名称。
        driven_group (str): 小控制器的 driven 组名称。
        part (str): 部位 token。
        index (int): 控制器序号，越大越靠近主控制器。
        total (int): 控制器总数。
        translate_sources (dict): 截断后的位移引脚。
        rotate_sources (dict): 旋转引脚。
    """

    connect_scaled_channel(
        main_ctrl, driven_group, part, index,
        "ratio", "translate", translate_sources)

    if index >= total:
        connect_scaled_channel(
            main_ctrl, driven_group, part, index,
            "rot", "rotate", rotate_sources)


# ----------------------------------------------------------------------
# 形变层：关节直接跟随控制器
# ----------------------------------------------------------------------

def create_deform_chain(part, points, ctrl_names, joint_group,
                        reuse_joints=False):
    u"""创建变形骨骼，每根关节直接挂在对应控制器的 output 组下。

    结构：

        ctrl_md_<part>_sub_N
        └─ output_md_<part>_sub_N
            └─ jnt_md_<part>_bind_N

    用父级而不是约束：少一堆节点，控制器怎么动关节就怎么动。
    关节不再是首尾相连的一条链，但每根都挂在控制器下面，
    蒙皮只看每根关节的世界矩阵，所以照样能驱动布料。

    Args:
        part (str): 部位 token。
        points (list): 关节位置，与 ctrl_names 一一对应。
        ctrl_names (list): 控制器名，顺序与 points 一致。
        joint_group (str): 骨骼组，新建时先建在这里。
        reuse_joints (bool): True 表示骨骼已存在，不重建，只重新挂父级。

    Returns:
        dict: ``joints`` / ``ik_handle``（恒为 None）。

    Raises:
        RuntimeError: 骨骼创建失败，或数量对不上。
    """

    total = len(ctrl_names)

    if len(points) != total:
        raise RuntimeError(
            u"控制器和关节数量对不上：{} vs {}".format(len(points), total))

    joint_names = [
        make_name("jnt", part, "bind", index)
        for index in range(1, total + 1)
    ]

    if not reuse_joints:
        jnt_utils.JntChain.create_chain(
            points,
            names=joint_names,
            parent=joint_group,
            radius=0.2
        )

    # ---- 每根关节挂到对应控制器的 output 下 ----
    # 重复构建时再挂一次是幂等的，位置由父级决定，不需要另外挪。
    for ctrl_name, joint_name in zip(ctrl_names, joint_names):
        output_name = ctrl_name.replace("ctrl_", "output_", 1)
        hierarchy_utils.parent_keep_world(joint_name, output_name)

    return {
        "joints": joint_names,
        "ik_handle": None,
    }


# ----------------------------------------------------------------------
# 主控制器的开关
# ----------------------------------------------------------------------

def add_visibility_switch(main_ctrl, attr_name, target_node, default=0):
    u"""在主控制器上加一个布尔开关，驱动目标节点的可见性。

    「显示骨骼 / 显示曲线」都在通道盒里切，不用去 Outliner 里找对应的组。

    Args:
        main_ctrl (str): 主控制器名称。
        attr_name (str): 属性名，例如 show_jnt。
        target_node (str): 被驱动的节点，一般是组。
        default (int): 默认值，0 隐藏 / 1 显示。
    """

    node_attr = attr_utils.Attr(main_ctrl)

    if not node_attr.attr_exists(attr_name):
        node_attr.add_attr(
            attr_name,
            attr_type="bool",
            default=default
        )

    cmds.connectAttr(
        "{}.{}".format(main_ctrl, attr_name),
        "{}.visibility".format(target_node),
        force=True
    )


def create_fk_chain(part, points, parent):
    u"""创建一串 FK 控制器，父子相连。

    编号规则和曲线控制器一致：编号越大越靠近主控制器，
    所以从大编号往小编号建，每一节挂到上一节的 output 下。

    转一节，后面的整体跟着甩，曲线被带着弯，spline IK 再跟上。
    这样 FK 只作用在「曲线控制点」这一层，不去和 IK 抢骨骼。

    Args:
        part (str): 部位 token。
        points (list): 控制点，index 1 对应 points[-1]。
        parent (str): 第一节的父级。

    Returns:
        dict: {index: output 名称}，给比例控制器挂父级用。
    """

    total = len(points)
    parents = {}
    chain_parent = parent

    for index in range(total, 0, -1):
        point = points[total - index]
        ctrl_name = make_name("ctrl", part, "fk", index)

        create_placed_ctrl(
            ctrl_name,
            point,
            FK_SHAPE,
            FK_COLOR,
            FK_SIZE,
            chain_parent
        )

        # 下一节要挂在 output 下才会跟着转：driven 在 ctrl 上面一层，
        # 转 ctrl 影响不到它。
        output_name = ctrl_name.replace("ctrl_", "output_", 1)

        parents[index] = output_name
        chain_parent = output_name

    return parents


def connect_curl(main_ctrl, fk_ctrl_names, part):
    u"""把主控制器上的 curl 属性接到 FK 链，做成从尖端往根部的卷曲。

    每一节的旋转量这样算：

        旋转 = clamp(curl - 启动时间, 0, 窗口) × 角度/窗口

        - 启动时间按位置递增：尖端最先动，根部最后动
        - 角度**均匀递减**：根部给满 BASE，往尖端逐节线性减小
          （比如 4 节、BASE=90 时是 22.5 / 45 / 67.5 / 90）
        - 窗口决定过渡宽度：越大越软、相邻两节越重叠，不会「一节转完才转下一节」

    每节用三个节点：加减（扣掉启动时间）→ 限制（0 ~ 窗口）→ 乘除（换算成角度）。

    Args:
        main_ctrl (str): 主控制器名称，上面需要有 curl 属性。
        fk_ctrl_names (list): FK 控制器名，按编号升序（001 在尖端）。
        part (str): 部位 token。

    Returns:
        list: 每节创建的乘除节点名，方便调试。
    """

    total = len(fk_ctrl_names)
    nodes = []

    for position, ctrl_name in enumerate(fk_ctrl_names):
        # position = 0 是尖端，最后一节是根部。
        onset = position * CURL_ONSET_STEP
        # 角度均匀递减：根部给满，往尖端线性减小。
        angle = CURL_BASE_ANGLE * (position + 1) / float(total)

        subtract = cmds.createNode(
            "plusMinusAverage",
            name=make_name("pma", part, "curl", position + 1)
        )
        cmds.connectAttr(
            "{}.curl".format(main_ctrl),
            "{}.input1D[0]".format(subtract),
            force=True
        )
        # 启动时间用负值加进去，等于「curl - onset」。
        cmds.setAttr("{}.input1D[1]".format(subtract), -onset)
        cmds.setAttr("{}.operation".format(subtract), 1)

        clamp = cmds.createNode(
            "clamp", name=make_name("clm", part, "curl", position + 1))
        cmds.connectAttr(
            "{}.output1D".format(subtract),
            "{}.inputR".format(clamp),
            force=True
        )
        cmds.setAttr("{}.minR".format(clamp), 0.0)
        cmds.setAttr("{}.maxR".format(clamp), CURL_WINDOW)

        scale = cmds.createNode(
            "multiplyDivide",
            name=make_name("mul", part, "curl", position + 1)
        )
        cmds.connectAttr(
            "{}.outputR".format(clamp),
            "{}.input1X".format(scale),
            force=True
        )
        # 把 0~窗口 的进度换算成角度。
        cmds.setAttr("{}.input2X".format(scale), angle / CURL_WINDOW)
        cmds.connectAttr(
            "{}.outputX".format(scale),
            "{}.rotate{}".format(ctrl_name, CURL_AXIS),
            force=True
        )

        nodes.append(scale)

    return nodes


def add_control_type_switch(main_ctrl, fk_ctrl_names, sub_ctrl_names, part):
    u"""在主控制器上加 enum 属性切换显示哪一套控制器。

        ctrlType = 0  IK   —— 只显示比例控制器
        ctrlType = 1  FK   —— 只显示 FK 控件
        ctrlType = 2  Both —— 两套都显示

    只切**形状**的可见性，不动 transform：两套控制器一直都在工作，
    所以切来切去不会丢姿态。

    可见性的算法：

        FK 可见 = clamp(ctrlType, 0, 1)      0→0，1→1，2→1
        IK 可见 = 1 - (ctrlType == 1)        只有切到 FK 时藏起来

    Args:
        main_ctrl (str): 主控制器名称。
        fk_ctrl_names (list): FK 控制器名。
        sub_ctrl_names (list): 比例控制器名。
        part (str): 部位 token。

    Returns:
        dict: 创建的几个驱动节点名。
    """

    node_attr = attr_utils.Attr(main_ctrl)

    if not node_attr.attr_exists("ctrlType"):
        node_attr.add_attr(
            "ctrlType",
            attr_type="enum",
            enum_names="IK:FK:Both",
            default=0
        )

    # FK：ctrlType 大于等于 1 就显示，用 clamp 把 2 压成 1。
    clamp = cmds.createNode("clamp", name=make_name("clm", part, "type", 1))
    cmds.connectAttr(
        "{}.ctrlType".format(main_ctrl), "{}.inputR".format(clamp), force=True)
    cmds.setAttr("{}.minR".format(clamp), 0.0)
    cmds.setAttr("{}.maxR".format(clamp), 1.0)

    # IK：只有 ctrlType 恰好是 1（FK）时才藏。
    # condition 的两个输入通道叫 colorIfTrue / colorIfFalse，不是 color1 / color2。
    condition = cmds.createNode(
        "condition", name=make_name("con", part, "type", 1))
    cmds.setAttr("{}.operation".format(condition), 0)
    cmds.setAttr("{}.colorIfTrueR".format(condition), 1.0)
    cmds.setAttr("{}.colorIfFalseR".format(condition), 0.0)
    cmds.connectAttr(
        "{}.ctrlType".format(main_ctrl),
        "{}.firstTerm".format(condition),
        force=True
    )
    cmds.setAttr("{}.secondTerm".format(condition), 1.0)

    reverse = cmds.createNode("reverse", name=make_name("rev", part, "type", 1))
    cmds.connectAttr(
        "{}.outColorR".format(condition),
        "{}.inputX".format(reverse),
        force=True
    )

    for ctrl_name in fk_ctrl_names:
        for shape in cmds.listRelatives(ctrl_name, shapes=True) or []:
            cmds.connectAttr(
                "{}.outputR".format(clamp),
                "{}.visibility".format(shape),
                force=True
            )

    for ctrl_name in sub_ctrl_names:
        for shape in cmds.listRelatives(ctrl_name, shapes=True) or []:
            cmds.connectAttr(
                "{}.outputX".format(reverse),
                "{}.visibility".format(shape),
                force=True
            )

    return {"clamp": clamp, "condition": condition, "reverse": reverse}


# ----------------------------------------------------------------------
# 主流程
# ----------------------------------------------------------------------

def create_spline_ctrl(part_name=DEFAULT_PART, crv_name=None,
                       rebuild=False, spans=DEFAULT_SPANS,
                       degree=DEFAULT_DEGREE,
                       drive_mode=DRIVE_MODE_RATIO,
                       skip_points=True,
                       with_fk=False, with_ik=True):
    u"""按曲线创建一整套带主控制器的次级控制器。

    Args:
        part_name (str): 部位 token，用于生成节点名。
        crv_name (str | None): 曲线名称；None 表示用当前选择。
        rebuild (bool): True 表示按跨度数重建曲线，False 复制现有曲线。
        spans (int): 重建时的跨度数（对应 Maya 重建选项里的「跨度数」）。
        degree (int): 重建时的阶数（对应「次数」）。
        drive_mode (str): ``ratio`` 比例位移 / ``chain`` 父子链。
        skip_points (bool): 是否跳过第 2 个和倒数第 2 个控制点。
        with_fk (bool): 是否额外创建一串 FK 控制器（摆造型用）。
        with_ik (bool): 是否创建变形骨骼（每根关节跟一个控制器）。

    Returns:
        dict: ``root`` / ``curve`` / ``main_ctrl`` / ``pos`` /
        ``controls`` / ``ratios`` / ``points`` / ``joints`` / ``ik_handle``。

    Raises:
        RuntimeError: 找不到曲线、控制点不足，或节点创建失败。
        ValueError: 名称、跨度数、阶数或驱动方式不合法。
    """

    if drive_mode not in DRIVE_MODES:
        raise ValueError(
            u"不支持的驱动方式：{}".format(drive_mode)
        )

    if with_fk and drive_mode == DRIVE_MODE_CHAIN:
        raise ValueError(
            u"父子链模式本身就是链条，不需要再叠 FK 控件。"
        )

    # 借 Name 的 check_part 校验 part_name，非法值会在这里就报出来。
    part = name_utils.Name(
        type="grp",
        side="md",
        part=part_name,
        function="rig",
        index=1
    ).part

    curve = get_source_curve(crv_name)

    # 点位要在删除旧结果之前取好。
    points, work_curve = get_control_points(curve, rebuild, spans, degree)

    # 跳过第 2 个和倒数第 2 个控制点：这两个点贴着两端，放控制器挤在一起不好用。
    # 曲线本身不动，只是不在那两点上建控制器、不绑簇。
    if skip_points and len(points) > 3:
        skipped = {1, len(points) - 2}
        cv_indices = [index for index in range(len(points)) if index not in skipped]
    else:
        cv_indices = list(range(len(points)))

    # 控制器位置：沿弧长等距取点，不直接拿 CV。
    # CV 只是控制多边形的顶点，重建只保证参数均匀、不保证弧长均匀——
    # 曲率大的地方 CV 会挤在一起，直接拿 CV 放控制器，间距就忽长忽短。
    # 簇仍然绑在原 CV 上（见 create_deform_chain 的 cv_indices）：
    # 控制器不需要和 CV 同位置，动控制器时 CV 一样跟着走。
    ctrl_bounds = (points[cv_indices[0]], points[cv_indices[-1]])

    try:
        ctrl_points = curve_utils.sample_curve_points(
            work_curve,
            len(cv_indices),
            bounds=ctrl_bounds
        )
    except RuntimeError as error:
        # 采样失败就退回 CV 位置：宁可略不匀，也别让整套建不出来。
        cmds.warning(str(error))
        ctrl_points = [points[index] for index in cv_indices]

    names = {
        "root": make_name("grp", part, "rig"),
        "main_ctrl": make_name("ctrl", part, "main"),
        "pos": make_name("grp", part, "pos"),
        "curve": make_name("crv", part, "spline"),
    }

    result = {
        "root": names["root"],
        "curve": None,
        "main_ctrl": names["main_ctrl"],
        "pos": names["pos"],
        "controls": [],
        "ratios": [],
        "points": ctrl_points,
        "joints": [],
        "ik_handle": None,
    }

    cmds.undoInfo(openChunk=True, chunkName="SplineCtrl")

    try:
        # 三块分组：骨骼 / 曲线 / 控制器，Outliner 里一眼能找到。
        groups = {
            "jnt": make_name("grp", part, "jnt"),
            "crv": make_name("grp", part, "crv"),
            "ctrl": make_name("grp", part, "ctrl"),
        }

        # 关节数量 = 控制器数量（每根关节跟一个控制器）
        total_joints = len(ctrl_points)
        joint_names = [
            make_name("jnt", part, "bind", index)
            for index in range(1, total_joints + 1)
        ]

        # 重建时尽量保住骨骼：蒙皮权重挂在骨骼上，骨骼一删权重就废了。
        # 骨骼名和数量都能对上，就只更新位置，不重建。
        reuse_joints = bool(
            with_ik
            and cmds.objExists(groups["jnt"])
            and all(cmds.objExists(name) for name in joint_names)
        )

        if reuse_joints:
            # 只清掉控制器组和曲线组，骨骼留着。
            for doomed in (groups["ctrl"], groups["crv"]):
                if cmds.objExists(doomed):
                    cmds.delete(doomed)
        elif cmds.objExists(names["root"]):
            # 骨骼对不上（数量变了或之前没建），只能整套重建。
            cmds.delete(names["root"])

        root = hierarchy_utils.ensure_group(names["root"])

        for group_name in groups.values():
            hierarchy_utils.parent_keep_world(
                hierarchy_utils.ensure_group(group_name),
                root
            )

        # 变形曲线：Maya 给的是自动名，这里改成正式名再挂到曲线组下。
        # 不在旧根组里的同名曲线也要清掉，否则 rename 会自动加序号。
        if cmds.objExists(names["curve"]):
            cmds.delete(names["curve"])

        work_curve = cmds.rename(work_curve, names["curve"])
        hierarchy_utils.parent_keep_world(work_curve, groups["crv"])
        result["curve"] = work_curve

        # ---- 主控制器：放在可用点位的起点 ----
        _, main_zero, _ = create_placed_ctrl(
            names["main_ctrl"],
            ctrl_points[0],
            MAIN_SHAPE,
            MAIN_COLOR,
            MAIN_SIZE,
            groups["ctrl"]
        )

        # ---- 小控制器：两种驱动方式二选一 ----
        total = len(ctrl_points)

        if drive_mode == DRIVE_MODE_CHAIN:
            # 父子链：main 的 output → sub_N → sub_{N-1} → … → sub_001。
            # 移动/旋转 main，整条一起走，长度严格不变；不需要 pos 组和比例属性。
            # pos 组不存在，返回里如实报 None，不要给一个对不上的名字。
            result["pos"] = None
            chain_parent = names["main_ctrl"].replace("ctrl_", "output_", 1)

            for position, point in enumerate(ctrl_points):
                # 点位从主控制器那头往外走，所以编号是倒着分配的。
                index = total - position
                ctrl_name = make_name("ctrl", part, "sub", index)

                _, _, _ = create_placed_ctrl(
                    ctrl_name,
                    point,
                    SUB_SHAPE,
                    SUB_COLOR,
                    SUB_SIZE,
                    chain_parent
                )

                result["controls"].append(ctrl_name)
                chain_parent = ctrl_name.replace("ctrl_", "output_", 1)
        else:
            # ---- pos 组：和主控制器同位置，挂在主控制器的 zero 下 ----
            pos = cmds.createNode("transform", name=names["pos"])

            # 相对挂接：pos 自身的 translate 保持 0，世界位置自动落到 zero 的位置。
            cmds.parent(pos, main_zero)

            # 主控制器驱动 pos：位移和旋转都要，所以用 parentConstraint。
            # pos 和主控制器同位置、同父级，所以 pos 的 translate / rotate
            # 正好等于主控制器相对静止姿态的偏移量。
            cmds.parentConstraint(
                names["main_ctrl"],
                pos,
                maintainOffset=False
            )

            # ---- 拉动幅度上限：超出的位移直接截断 ----
            add_separator(names["main_ctrl"], "limit")

            attr_utils.Attr(names["main_ctrl"]).add_attr(
                "maximumLength",
                attr_type="double",
                default=DEFAULT_MAX_LENGTH,
                min_value=0.0
            )

            translate_sources = create_pull_limit(
                names["main_ctrl"], pos, part)
            rotate_sources = {
                axis: "{}.rotate{}".format(pos, axis)
                for axis in ("X", "Y", "Z")
            }

            # FK 控件：一串父子链，比例控制器挂在它们下面。
            # 转 FK 会带着下面的控制点一起动，曲线弯了 spline IK 自然跟上。
            fk_parents = {}

            if with_fk:
                # 挂在主控制器的 output 下：主控一动，FK 整串跟着走，
                # 不会留在起始位置，切过去也就不会「回到默认形状」。
                fk_parents = create_fk_chain(
                    part,
                    ctrl_points,
                    names["main_ctrl"].replace("ctrl_", "output_", 1)
                )

                # ---- 卷曲属性：从尖端往根部逐节卷 ----
                add_separator(names["main_ctrl"], "curl")

                attr_utils.Attr(names["main_ctrl"]).add_attr(
                    "curl",
                    attr_type="double",
                    default=0.0,
                    min_value=0.0,
                    max_value=1.0
                )

                connect_curl(
                    names["main_ctrl"],
                    [make_name("ctrl", part, "fk", index)
                     for index in range(1, total + 1)],
                    part
                )

            # ---- 比例属性：单独分一组 ----
            add_separator(names["main_ctrl"], "ratio")

            # 编号越大离主控制器越近：reversed 让 001 落在曲线末端，
            # 最大编号正好落在主控制器所在的那个点上。
            for index, point in enumerate(reversed(ctrl_points), start=1):
                ctrl_name = make_name("ctrl", part, "sub", index)

                _, _, driven_name = create_placed_ctrl(
                    ctrl_name,
                    point,
                    SUB_SHAPE,
                    SUB_COLOR,
                    SUB_SIZE,
                    fk_parents[index] if with_fk else groups["ctrl"]
                )

                ratio_name = add_ratio_attr(names["main_ctrl"], index, total)
                connect_ratio(
                    names["main_ctrl"],
                    driven_name,
                    part,
                    index,
                    total,
                    translate_sources,
                    rotate_sources
                )

                result["controls"].append(ctrl_name)
                result["ratios"].append(ratio_name)

        # ---- 显示类属性：单独分一组 ----
        add_separator(names["main_ctrl"], "show")

        # ctrlType：enum 切换显示 IK / FK / Both。
        # 只换形状显隐，两套控制器的 transform 一直在工作，所以不会丢姿态。
        if with_fk:
            add_control_type_switch(
                names["main_ctrl"],
                [make_name("ctrl", part, "fk", index)
                 for index in range(1, total + 1)],
                [make_name("ctrl", part, "sub", index)
                 for index in range(1, total + 1)],
                part
            )

        # 父子链是倒着建的，统一按编号升序归档，后面绑 CV 时才好反序。
        result["controls"].sort()

        # ---- 形变层：每根关节跟一个控制器 ----
        # 控制器顺序是反的（001 在末端），但曲线 CV 的顺序是正向的，
        # 所以这里要把控制器列表反过来，才能和 cv[0..N-1] 一一对应。
        if with_ik:
            deform = create_deform_chain(
                part,
                ctrl_points,
                list(reversed(result["controls"])),
                groups["jnt"],
                reuse_joints=reuse_joints
            )
            result["joints"] = deform["joints"]
            result["ik_handle"] = deform["ik_handle"]

        # 骨骼、曲线都是内部用的，默认隐藏。
        # 开关挂到主控制器上，在通道盒里就能切，不用去 Outliner 找组。
        add_visibility_switch(
            names["main_ctrl"], "show_jnt", groups["jnt"], 0)
        add_visibility_switch(
            names["main_ctrl"], "show_crv", groups["crv"], 0)

        # 关节是挂在控制器下面的，不在 jnt 组里，
        # 所以 show_jnt 还要单独接到每根关节的 visibility 上。
        for joint_name in result["joints"]:
            cmds.connectAttr(
                "{}.show_jnt".format(names["main_ctrl"]),
                "{}.visibility".format(joint_name),
                force=True
            )
    finally:
        cmds.undoInfo(closeChunk=True)

    return result


# ----------------------------------------------------------------------
# 界面
# ----------------------------------------------------------------------

class SplineCtrlWindow(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    u"""曲线控制器工具窗口。"""

    def __init__(self, parent=None):
        super(SplineCtrlWindow, self).__init__(parent)

        self.setWindowTitle(u"曲线控制器")
        self.resize(380, 340)

        self.build_ui()

    # ------------------------------------------------------------------
    # 界面：只负责把区块从上到下排好
    # ------------------------------------------------------------------

    def build_ui(self):
        u"""搭界面。

        这里不碰具体逻辑，只决定「有哪些区块、谁在上面」。
        """

        layout = QtWidgets.QVBoxLayout(self)

        layout.addWidget(self.build_curve_section())
        layout.addWidget(self.build_name_section())
        layout.addWidget(self.build_action_section())

        # 底部留白：没有这一行，控件会被纵向拉伸铺满整个窗口。
        layout.addStretch()

    def build_curve_section(self):
        u"""曲线区块：源曲线与拾取、是否重建、跨度数与次数。"""

        group = QtWidgets.QGroupBox(u"曲线")
        layout = QtWidgets.QVBoxLayout(group)

        curve_row = QtWidgets.QHBoxLayout()

        self.curve_edit = QtWidgets.QLineEdit()
        self.curve_edit.setPlaceholderText(u"留空则使用当前选择里的曲线")
        curve_row.addWidget(self.curve_edit)

        self.pick_button = QtWidgets.QPushButton(u"拾取")
        self.pick_button.setFixedWidth(56)
        self.pick_button.setToolTip(u"把当前选择里的曲线填进来")
        self.pick_button.clicked.connect(self.pick_curve)
        curve_row.addWidget(self.pick_button)

        layout.addLayout(curve_row)

        self.rebuild_check = QtWidgets.QCheckBox(u"按跨度数重建曲线")
        layout.addWidget(self.rebuild_check)

        # 跨度数 / 次数：对应 Maya「重建曲线选项」里的同两个值。
        # 控制点数量 = 跨度数 + 次数，下面直接把结果显示出来，避免错位。
        self.spans_spin = QtWidgets.QSpinBox()
        self.spans_spin.setRange(1, 64)
        self.spans_spin.setValue(DEFAULT_SPANS)
        self.spans_spin.setEnabled(False)

        spans_row = QtWidgets.QHBoxLayout()
        spans_row.addWidget(QtWidgets.QLabel(u"跨度数"))
        spans_row.addWidget(self.spans_spin)
        spans_row.addStretch()

        layout.addLayout(spans_row)

        self.point_count_label = QtWidgets.QLabel()
        self.point_count_label.setWordWrap(True)
        layout.addWidget(self.point_count_label)

        self.spans_spin.valueChanged.connect(self.update_point_count)
        self.update_point_count()

        # 不勾重建时，这个参数没有意义，直接灰掉避免误操作。
        self.rebuild_check.toggled.connect(self.spans_spin.setEnabled)

        self.ik_check = QtWidgets.QCheckBox(
            u"创建变形骨骼（跟随控制器）"
        )
        self.ik_check.setChecked(True)
        layout.addWidget(self.ik_check)

        self.fk_check = QtWidgets.QCheckBox(u"创建 FK 控件（摆造型用）")
        layout.addWidget(self.fk_check)

        return group

    def update_point_count(self):
        u"""把「跨度数 + 次数 ≈ 控制点数」的关系显示出来。

        次数固定用 DEFAULT_DEGREE，不放到界面上。
        """

        total = self.spans_spin.value() + DEFAULT_DEGREE

        self.point_count_label.setText(
            u"控制点 ≈ {} 个（跨度数 + {}）".format(total, DEFAULT_DEGREE)
        )

    def pick_curve(self):
        u"""把当前选择里的曲线填进输入框。

        选择里可能有多个对象，取第一条曲线；不是曲线的直接跳过。
        """

        selection = cmds.ls(selection=True, long=True) or []

        for node in selection:
            try:
                curve_utils.get_curve_shape(node)
            except RuntimeError:
                # 选中的不是曲线，继续看下一个
                continue

            # 填短名就行：输入框是给人看的，objExists 也认短名。
            self.curve_edit.setText(node.rsplit("|", 1)[-1])

            return

        cmds.warning(u"当前选择里没有 NURBS 曲线。")

    def build_name_section(self):
        u"""控制器名称区块。"""

        group = QtWidgets.QGroupBox(u"控制器名称")
        layout = QtWidgets.QHBoxLayout(group)

        self.name_edit = QtWidgets.QLineEdit(DEFAULT_PART)
        layout.addWidget(self.name_edit)

        return group

    def build_action_section(self):
        u"""执行区块：按钮与状态。"""

        group = QtWidgets.QGroupBox(u"执行")
        layout = QtWidgets.QVBoxLayout(group)

        self.build_button = QtWidgets.QPushButton(u"创建曲线控制器")
        self.build_button.clicked.connect(self.run_build)
        layout.addWidget(self.build_button)

        self.status_label = QtWidgets.QLabel(u"准备就绪")
        self.status_label.setWordWrap(True)
        layout.addWidget(self.status_label)

        return group

    # ------------------------------------------------------------------
    # 执行
    # ------------------------------------------------------------------

    def run_build(self):
        u"""按当前界面参数执行创建。"""

        part_name = self.name_edit.text().strip() or DEFAULT_PART
        crv_name = self.curve_edit.text().strip() or None

        try:
            result = create_spline_ctrl(
                part_name=part_name,
                crv_name=crv_name,
                rebuild=self.rebuild_check.isChecked(),
                spans=self.spans_spin.value(),
                degree=DEFAULT_DEGREE,
                skip_points=True,
                with_fk=self.fk_check.isChecked(),
                with_ik=self.ik_check.isChecked()
            )
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"创建失败：{}".format(error))
            return

        deform = u""

        if result["joints"]:
            deform = u"，{} 根骨骼（跟随控制器）".format(len(result["joints"]))

        if result["ratios"]:
            preview = u"、".join(result["ratios"][:3])

            if len(result["ratios"]) > 3:
                preview += u" …"

            naming = u"，比例属性 {}".format(preview)
        else:
            naming = u"，刚性跟随"

        self.status_label.setText(
            u"完成：{} 个控制器{}{}".format(
                len(result["controls"]),
                deform,
                naming
            )
        )


_window = None


def main():
    global _window

    _window = SplineCtrlWindow()
    _window.show()

    return _window
