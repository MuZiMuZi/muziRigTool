# coding=utf-8
u"""
name_utils：Maya Rig 基础命名工具。

标准命名规则：
    [类型]_[方向]_[部位]_[功能]_[序号]

其中 part 允许使用下划线组成复合部位名称，例如：
    upper_lid
    nose_center
    mouth_corner

例如：
    grp_md_face_master_001
    ctrl_lf_eye_main_001
    jnt_rt_brow_bind_003
    loc_lf_upper_lid_bind_001

方法介绍与使用场景：

    Name.__init__
        创建一个名称对象。
        可以直接传入完整名称，也可以分别传入 type / side / part / function / index。

    Name.decompose_name
        将完整标准名称拆分成 type / side / part / function / index。
        支持 part 中包含下划线，例如 upper_lid、nose_center。
        适合读取已有 Maya 节点名称中的命名信息。

    Name.compose_name
        根据 type / side / part / function / index 组合标准名称。
        适合创建 Joint、Controller、Group、Locator 等节点名称。

    Name.flip
        翻转左右方向 lf / rt。
        适合镜像 Rig、Joint、Controller 等左右结构时使用。
"""


class Name(object):
    u"""五段式 Rig 名称对象：组合、解析与左右翻转。

    所有配置与校验入口都挂在类上，外部可以直接读取：

        Name.side_list
        Name.side_alias
        Name.index_min
        Name.index_max
        Name.check_side("left")
    """

    # 合法的方向值。
    side_list = ("lf", "rt", "md")

    # 常见写法的归一化映射；不在表里的值必须本身就是 lf / rt / md。
    side_alias = {
        "left": "lf",
        "right": "rt",
        "middle": "md",
        "center": "md",
    }

    # 序号范围。
    index_min = 1
    index_max = 999

    def __init__(
            self,
            name=None,
            type=None,
            side=None,
            part=None,
            function=None,
            index=None
    ):
        u"""
        初始化名称数据。

        name(str): 可选完整标准名称。
        type(str): 节点类型，例如 "ctrl"、"jnt"、"loc"、"grp"。
        side(str): 节点方向，例如 "lf"、"rt"、"md"。
        part(str): 节点部位，允许包含下划线，例如 "upper_lid"。
        function(str): 节点功能，例如 "bind"、"main"、"aim"。
        index(int): 节点序号，默认 1。

        Maya 使用示例：
            from muziRigTool.core.common import name_utils
            name_object = name_utils.Name(
                type="ctrl",
                side="lf",
                part="eye",
                function="main",
                index=1
            )
        """

        # 传入完整名称时，其余字段由解析得到。
        if name is not None:
            if not isinstance(name, str) or not name.strip():
                raise ValueError(u"name 必须是非空字符串，收到：{!r}".format(name))
            self.name = name.strip()
            self.decompose_name()
            return

        # 组合路径：五个字段全部校验通过后才允许拼名。
        self.type = self.check_token(type, "type")
        self.side = self.check_side(side)
        self.part = self.check_part(part)
        self.function = self.check_token(function, "function")
        self.index = 1 if index is None else self.check_index(index)
        self.compose_name()

    def decompose_name(self):
        u"""
        将标准名称拆分到当前对象的数据中。

        命名解析规则固定使用：
            第 1 段       -> type
            第 2 段       -> side
            中间所有段    -> part
            倒数第 2 段   -> function
            最后 1 段     -> index

        因此 part 可以安全包含下划线：
            loc_lf_upper_lid_bind_001
                type     = loc
                side     = lf
                part     = upper_lid
                function = bind
                index    = 1

        Returns:
            list: 原始名称按照下划线拆分后的字符串列表。

            Maya 使用示例：
                from muziRigTool.core.common import name_utils
                name_object = name_utils.Name(name="loc_lf_upper_lid_bind_001")
                print(name_object.part)
        """

        name_parts = self.name.split("_")

        if len(name_parts) < 5:
            raise ValueError(
                u"名称不符合标准命名规则：{}".format(self.name)
            )

        self.type = self.check_token(name_parts[0], "type")
        self.side = self.check_side(name_parts[1])
        self.part = self.check_part("_".join(name_parts[2:-2]))
        self.function = self.check_token(name_parts[-2], "function")
        self.index = self.check_index(name_parts[-1])

        return name_parts

    def compose_name(self):
        u"""
        根据当前数据组合标准名称。

        part 可以包含下划线，compose_name() 会将它整体作为部位字段使用。

        Returns:
            str: 组合后的标准名称。

            Maya 使用示例：
                from muziRigTool.core.common import name_utils
                name_object = name_utils.Name(
                    type="loc",
                    side="lf",
                    part="upper_lid",
                    function="bind",
                    index=1
                )
                print(name_object.compose_name())
                # loc_lf_upper_lid_bind_001
        """

        self.name = "{0}_{1}_{2}_{3}_{4:03d}".format(
            self.type,
            self.side,
            self.part,
            self.function,
            self.index
        )

        return self.name

    def flip(self):
        u"""
        翻转左右方向：lf <-> rt。

        Returns:
            str: 翻转后的 side。

            Maya 使用示例：
                name_object = name_utils.Name(
                    type="ctrl",
                    side="lf",
                    part="eye",
                    function="main",
                    index=1
                )
                name_object.flip()
                print(name_object.side)
                # rt
        """

        if self.side == "lf":
            self.side = "rt"

        elif self.side == "rt":
            self.side = "lf"

        return self.side

    @staticmethod
    def check_token(value, field):
        u"""单段字符串：非空、不含下划线。"""
        if not isinstance(value, str):
            raise ValueError(u"{} 必须是字符串，收到：{!r}".format(field, value))
        value = value.strip()
        if not value:
            raise ValueError(u"{} 不能为空".format(field))
        if "_" in value:
            raise ValueError(u"{} 必须是单个 Token，收到：{!r}".format(field, value))
        return value

    @classmethod
    def check_side(cls, value):
        u"""方向：归一化成 lf / rt / md。"""
        if not isinstance(value, str):
            raise ValueError(u"side 必须是字符串，收到：{!r}".format(value))
        key = value.strip().lower()
        key = cls.side_alias.get(key, key)
        if key not in cls.side_list:
            raise ValueError(u"side 只能是 lf / rt / md，收到：{!r}".format(value))
        return key

    @staticmethod
    def check_part(value):
        u"""部位：允许内部下划线，但不允许首尾下划线或连续下划线。"""
        if not isinstance(value, str):
            raise ValueError(u"part 必须是字符串，收到：{!r}".format(value))
        value = value.strip()
        if not value:
            raise ValueError(u"part 不能为空")
        if value.startswith("_") or value.endswith("_"):
            raise ValueError(u"part 不能以 _ 开头或结尾，收到：{!r}".format(value))
        if "__" in value:
            raise ValueError(u"part 不能包含连续下划线，收到：{!r}".format(value))
        return value

    @classmethod
    def check_index(cls, value):
        u"""序号：1 ~ 999 的整数。"""
        if isinstance(value, bool):
            raise ValueError(u"index 必须是整数，收到 bool：{!r}".format(value))
        try:
            number = int(value)
        except (TypeError, ValueError):
            raise ValueError(u"index 必须是整数，收到：{!r}".format(value))
        if not cls.index_min <= number <= cls.index_max:
            raise ValueError(
                u"index 必须在 {} ~ {} 之间，收到：{!r}".format(
                    cls.index_min,
                    cls.index_max,
                    value
                )
            )
        return number
