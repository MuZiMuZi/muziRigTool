# coding=utf-8
u"""节点属性操作。

围绕一个节点做常用的属性管理：

    查询 / 创建 / 删除自定义属性
    读写值
    锁定、隐藏、keyable 状态
    属性之间的连接

旧库这个模块有 1712 行、40 个方法，包含矩阵、限制、message 等大量分支。
这里只保留工具实际需要的部分，后续按需补充。
"""

from maya import cmds


# 创建属性时支持的类型 -> Maya attributeType
attribute_types = {
    "double": "double",
    "float": "float",
    "int": "long",
    "bool": "bool",
    "string": "string",
    "enum": "enum",
}


class Attr(object):
    u"""一个节点的属性操作入口。

    用法：

        attr = Attr("pCube1")
        attr.add_attr("myWeight", "double", 0.0)
        attr.set_value("myWeight", 1.0)
    """

    def __init__(self, node, attr=None):
        u"""绑定一个节点，可选地绑定一个属性。

        Args:
            node (str): Maya 节点名。
            attr (str | None): 常用属性名。绑定之后调用方可以省略 attr 参数；
                只有 connect_to / disconnect_from 必须绑定，
                因为它们没有单独接收源属性名的入口。
        """

        self.node = node
        self.attr = attr

    # ------------------------------------------------------------------
    # 查询
    # ------------------------------------------------------------------

    def attr_exists(self, attr=None):
        u"""判断属性是否存在。"""

        name = attr or self.attr

        if not name or not cmds.objExists(self.node):
            return False

        return cmds.attributeQuery(name, node=self.node, exists=True)

    def get_value(self, attr=None):
        u"""读取属性值。"""

        name = attr or self.attr

        if not self.attr_exists(name):
            raise RuntimeError(u"属性不存在：{}.{}".format(self.node, name))

        plug = "{}.{}".format(self.node, name)

        return cmds.getAttr(plug)

    def list_custom_attrs(self):
        u"""返回节点上的自定义属性名列表。"""

        if not cmds.objExists(self.node):
            return []

        attrs = cmds.listAttr(self.node, userDefined=True) or []

        return sorted(attrs)

    def get_attr_type(self, attr=None):
        u"""返回属性类型。"""

        name = attr or self.attr

        if not self.attr_exists(name):
            return None

        # 查询一次就够：原来把同一个 attributeQuery 调了两次。
        attr_type = cmds.attributeQuery(
            name,
            node=self.node,
            attributeType=True
        )

        if attr_type:
            return attr_type

        # 复合属性（如 compound）没有 attributeType
        return "compound"

    # ------------------------------------------------------------------
    # 读写
    # ------------------------------------------------------------------

    def set_value(self, attr=None, value=None):
        u"""设置属性值。"""

        name = attr or self.attr

        if not self.attr_exists(name):
            raise RuntimeError(u"属性不存在：{}.{}".format(self.node, name))

        plug = "{}.{}".format(self.node, name)

        cmds.setAttr(plug, value)

        return plug

    # ------------------------------------------------------------------
    # 状态
    # ------------------------------------------------------------------

    def set_state(self, attr=None, lock=None, keyable=None, hidden=None):
        u"""设置锁定 / keyable / 隐藏状态。

        任何一个参数为 None 时保持原状态不变。

        Args:
            attr (str): 属性名。
            lock (bool): 锁定。
            keyable (bool): 是否可 K 帧。
            hidden (bool): 是否隐藏。
        """

        name = attr or self.attr

        if not self.attr_exists(name):
            raise RuntimeError(u"属性不存在：{}.{}".format(self.node, name))

        plug = "{}.{}".format(self.node, name)
        changed = []

        if lock is not None:
            cmds.setAttr(plug, lock=lock)
            changed.append("lock")

        if keyable is not None:
            cmds.setAttr(plug, keyable=keyable)
            changed.append("keyable")

        if hidden is not None:
            # 隐藏和 keyable 是互斥的：隐藏前必须先取消 keyable
            cmds.setAttr(plug, keyable=not hidden)
            changed.append("hidden")

        return changed

    # ------------------------------------------------------------------
    # 创建 / 删除
    # ------------------------------------------------------------------

    def add_attr(
        self,
        name,
        attr_type="double",
        default=None,
        min_value=None,
        max_value=None,
        enum_names=None
    ):
        u"""添加一个自定义属性。

        Args:
            name (str): 属性名。
            attr_type (str): double / float / int / bool / string / enum。
            default: 默认值。
            min_value: 最小值（数值类型）。
            max_value: 最大值（数值类型）。
            enum_names (str): enum 的选项，冒号分隔，例如 "a:b:c"。

        Raises:
            RuntimeError: 属性已存在或类型不支持。
        """

        if self.attr_exists(name):
            raise RuntimeError(u"属性已存在：{}".format(name))

        maya_type = attribute_types.get(attr_type)

        if maya_type is None:
            raise RuntimeError(u"不支持的属性类型：{}".format(attr_type))

        kwargs = {
            "longName": name,
            "attributeType": maya_type,
            "keyable": True,
        }

        if attr_type == "enum":
            kwargs["enumName"] = enum_names or "off:on"

        if default is not None:
            kwargs["defaultValue"] = default

        if min_value is not None:
            kwargs["minValue"] = min_value

        if max_value is not None:
            kwargs["maxValue"] = max_value

        cmds.addAttr(self.node, **kwargs)

        return "{}.{}".format(self.node, name)

    def delete_attr(self, attr=None):
        u"""删除属性。"""

        name = attr or self.attr

        if not self.attr_exists(name):
            return False

        cmds.deleteAttr(self.node, attribute=name)

        return True

    # ------------------------------------------------------------------
    # 连接
    # ------------------------------------------------------------------

    def _require_attr(self):
        u"""返回构造时绑定的属性名；没有绑定时明确报错。

        connect_to / disconnect_from 没有单独接收「源属性名」的参数，
        只能用 Attr(节点, 属性名) 绑定的那个。以前写的是 ``self.attr or ""``，
        没绑定时会拼出 ``"node."`` 这种非法 plug，Maya 的报错完全看不出
        是少传了参数，所以这里提前拦住。
        """

        if not self.attr:
            raise RuntimeError(
                u"{} 没有绑定属性：请用 Attr(节点, 属性名) 创建后再连接。".format(
                    self.node
                )
            )

        return self.attr

    def connect_to(self, target_node, target_attr):
        u"""把当前属性连接到目标属性。

        Args:
            target_node (str): 目标节点。
            target_attr (str): 目标属性名。

        Returns:
            str: 目标 plug。

        Raises:
            RuntimeError: 当前实例没有绑定属性，或目标节点不存在。
        """

        source = "{}.{}".format(self.node, self._require_attr())

        if not cmds.objExists(target_node):
            raise RuntimeError(u"目标节点不存在：{}".format(target_node))

        target = "{}.{}".format(target_node, target_attr)

        cmds.connectAttr(source, target, force=True)

        return target

    def disconnect_from(self, target_node, target_attr):
        u"""断开到目标属性的连接。

        Args:
            target_node (str): 目标节点。
            target_attr (str): 目标属性名。

        Returns:
            bool: 原本有连接、已经断开时返回 True。

        Raises:
            RuntimeError: 当前实例没有绑定属性。
        """

        source = "{}.{}".format(self.node, self._require_attr())
        target = "{}.{}".format(target_node, target_attr)

        if cmds.isConnected(source, target):
            cmds.disconnectAttr(source, target)

            return True

        return False
