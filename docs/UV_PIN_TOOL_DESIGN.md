# UV Pin 工具设计与实现拆解

> 这是一份设计稿，不是最终代码。  
> 目的是先把「为什么这么做」和「代码怎么拆」讲清楚，确认后再落实现。  
> 当前工作区：`muziRigTool`。
>
> 实现状态（2026-10-26）：世界级组、定位器不动、合并 uvPin、三种输出方式已落地；
> Maya 冒烟 11/11，单元测试 54/54。本文保留设计推演过程。

---

## 1. 目标

用户输入两样东西：

1. 一个 **Polygon Mesh 模型**
2. 一组 **定位器（Locator / Transform）**

工具输出：

- 每个定位器的世界位置对应一个 **世界级组**（`uvpin_<定位器名>`）
- 组被 `uvPin` 驱动，贴在模型表面
- 同一个模型尽量只建 **一个 `uvPin` 节点**，多个定位器用不同 index
- 定位器本身完全不动，只作为位置参考

最终效果：

```text
定位器（只提供位置，保留原样）
        ↓ 取 worldPosition
   uvpin_<locator>（世界级，无父级）
        ↓ offsetParentMatrix
      uvPin.outputMatrix[i]
        ↓ 跟随
   模型变形 / 整体移动
```

---

## 2. 原理

### 2.1 `uvPin` 到底是什么

`uvPin` 是 Maya 内置的 **程序化依赖节点（DG Node）**，不是约束。

它做的事情：

```text
输入：
    deformedGeometry   ← 变形后的网格
    coordinate[i].u/v  ← 表面上的 UV 坐标
    uvSetName          ← 使用哪套 UV
    normalAxis         ← 输出坐标系的哪个轴对准法线
    tangentAxis        ← 哪个轴对准切线

输出：
    outputMatrix[i]    ← 第 i 个点的完整矩阵
    outputTranslate[i] ← 第 i 个点的位置
```

关键点：

- 它用 **UV** 定位，不是用世界坐标或最近点搜索
- 每个节点可以有 **多个 `coordinate` 元素**，对应多个输出
- `outputMatrix` 是数组，`outputMatrix[0]`、`outputMatrix[1]`……分别对应每个 index

这也是「合并」能成立的原因。

### 2.2 从定位器位置到 UV

Maya 没有现成的「世界位置 → 表面 UV」命令，所以用 OpenMaya：

```python
selection = om2.MGlobal.getSelectionListByName(shape)
dag_path = selection.getDagPath(0)
mesh_fn = om2.MFnMesh(dag_path)

closest_point, face_index = mesh_fn.getClosestPoint(
    om2.MPoint(world_position),
    om2.MSpace.kWorld
)

u, v, face_index = mesh_fn.getUVAtPoint(
    closest_point,
    om2.MSpace.kWorld,
    uv_set
)
```

要点：

- `getClosestPoint` 得到表面上的最近点
- `getUVAtPoint` 把这个表面点插值成 UV
- 返回的 UV 再写进 `uvPin.coordinate[i]`

`uvPin` 拿到 UV 后，会自己在变形后的网格上重新算表面点，所以模型变形时会跟。

### 2.3 驱动方式一：`offsetParentMatrix`（默认）

一个 Transform 的世界矩阵可以理解成：

```text
world = parentWorld × offsetParentMatrix × localTRS
```

如果我们把 `localTRS` 清空（translate=0，rotate=0，scale=1），再把 `uvPin.outputMatrix[i]` 接到 `offsetParentMatrix`：

```text
world = parentWorld × pinMatrix
```

那么 Transform 的世界位置就完全由 pin 决定。

这比约束干净：

- 没有约束节点
- 没有偏移累积
- 直接是矩阵驱动，求值链短

代价：

- 会清掉组自身的 TRS（组本来就是我们新建的，无所谓）
- 如果以后要手工偏移，需要改 offsetParentMatrix 或再加一层

### 2.4 驱动方式二：`parentConstraint` / `pointConstraint`

有些流程不希望在 `offsetParentMatrix` 上做文章，而是希望用传统约束：

```text
uvPin.outputMatrix[i]
        ↓
隐藏的 pin_output Locator
        ↓ parentConstraint / pointConstraint
     目标组
```

- `parentConstraint`：位置 + 旋转都跟随
- `pointConstraint`：只跟随位置，旋转保留目标自己的
- `maintainOffset=True`：保留目标原来的相对偏移，适合接管已有控制器

代价：

- 每个 pin 多一个隐藏 Locator
- 多一个约束节点
- 约束会占用目标的 translate/rotate 通道

所以默认用 `offsetParentMatrix`，约束作为兼容选项。

### 2.5 空间：为什么组要放世界级

`uvPin` 有一个节点级属性 `relativeSpaceMode`：

| 模式 | 含义 |
|---|---|
| `World` | 输出世界矩阵 |
| `Local` | 相对几何体父级 |
| `Custom` | 相对 `relativeSpaceMatrix` 指定的矩阵 |

我们把组统一放在 **世界级（没有父级）**，于是：

- `relativeSpaceMode = World`
- `outputMatrix[i]` 就是世界矩阵
- 组没有父级，`offsetParentMatrix` 正好按世界矩阵解释
- 不需要连接 `relativeSpaceMatrix`，也不需要处理「父级叠加两次」

如果组有父级，就必须用 `Custom` 把父级世界矩阵接进来，否则会双重变换。  
现在统一世界级，逻辑最简单。

### 2.6 合并：为什么能省，省在哪

一个 `uvPin` 节点支持多个坐标：

```text
uvPin
├─ coordinate[0] → outputMatrix[0] → grp_A
├─ coordinate[1] → outputMatrix[1] → grp_B
└─ coordinate[2] → outputMatrix[2] → grp_C
```

合并后：

- 模型只连一次 `deformedGeometry`
- 只创建一个 uvPin 节点
- 减少 DG 节点数量、重复的几何输入连接和调度

但要清楚：

- **不是**把三次计算变成一次。每个 index 仍然要算
- 节点级属性必须一致：`uvSetName`、`normalAxis`、`tangentAxis`、`relativeSpaceMode`
- 不同父级的 target 不能共用一个 Custom 空间，需要按父级分组
- 不同模型不能合并（一个 uvPin 只有一个几何输入）

所以分组 key 是：

```text
(uv_set, normal_axis, tangent_axis, 空间父级)
```

组都在世界级时，空间父级统一是 `None`，同一模型通常就只剩一个节点。

---

## 3. 总体流程

```text
① 读输入
   模型 shape
   定位器列表

② 对每个定位器
   取 worldPosition
   求最近点 UV
   按 key 分桶

③ 对每个桶
   创建一个 uvPin 节点
   设置节点级属性（UV 集 / 轴 / 空间）
   连接 deformedGeometry

④ 对桶里的每个定位器
   在定位器世界位置创建一个世界级组
   写 coordinate[i]
   连接 outputMatrix[i] → 组.offsetParentMatrix
   （或约束模式：outputMatrix[i] → 隐藏 locator → 约束组）

⑤ 收尾
   返回 created / failed / nodes
   工具层包一个 Undo Chunk
```

---

## 4. 文件与职责

```text
muziRigTool/
├─ core/rigging/uv_pin_utils.py      # 只做 Maya 操作，不读选择、不建窗口
├─ tools/rig/uv_pin_tool.py          # 选择、参数、状态、Undo
└─ tests/
   ├─ uv_pin_tool_maya_smoke_test.py # Maya 真机测试
   └─ test_uv_pin_tool_registry.py   # 无 Maya 的注册/静态测试
```

分层原则：

- **Core**：输入是明确的节点名 / 坐标 / 参数，输出是 dict；不知道 UI 存在
- **Tool**：只负责从 `cmds.ls(selection=True)` 拿数据、读控件、报状态
- **Test**：Core 逻辑用 Maya 真机测；工具注册用普通 Python 测

这样 UI 改版不会动算法，算法改动也能单独回归。

---

## 5. 核心代码拆解

### 5.1 解析模型：`get_shape(node)`

职责：

- 允许传 Transform 或 Mesh Shape
- 最终返回 Mesh Shape 的 Long Path

伪代码：

```python
if cmds.nodeType(node) == "mesh":
    return long_name(node)

shapes = cmds.listRelatives(
    node, shapes=True, noIntermediate=True,
    fullPath=True, type="mesh"
)

if not shapes:
    raise RuntimeError("请选择一个 Polygon Mesh 模型")

return shapes[0]
```

为什么要 `noIntermediate=True`：

- 避免拿到 intermediate shape（比如历史里的中间对象）

### 5.2 解析定位器：`get_driver_transform(driver)`

职责：

- 允许传 Locator Shape 或 Transform
- 最终返回可驱动的 Transform
- 检查有没有 `offsetParentMatrix`

为什么单独抽：

- 用户可能选的是 Locator 的 Shape
- 后面建组、取世界位置、连接，都需要统一的 Transform

### 5.3 求最近点 UV：`get_closest_uv(shape, world_position, uv_set)`

职责：

- 只做「世界位置 → (u, v)」
- 返回 `u / v / point / face / distance` 方便 UI 显示和测试断言

关键代码就是 2.2 那一段。  
注意 `getUVAtPoint` 在 API 2.0 返回的是 `(u, v, faceIndex)`，前两个才是 UV。

### 5.4 建组：`create_zero_group(driver, group_name=None)`

本次需求的核心变化：

- 不把定位器 parent 到组下
- 组只在世界级，复制定位器的世界位置
- 定位器保持原样

伪代码：

```python
driver = get_driver_transform(driver)

short_name = driver.rsplit("|", 1)[-1].rsplit(":", 1)[-1]
group_name = group_name or "uvpin_" + short_name

world_position = snap_utils.get_item_world_position(driver)

group = cmds.createNode("transform", name=group_name)
cmds.xform(group, worldSpace=True, translation=world_position)

# 旋转/缩放保持 identity
# 定位器不 parent，不改 transform
return group
```

为什么不做成 zero group 层级？

- 需求明确：定位器只提供位置，后续都跟组走
- 少一层父子关系，少一次 parent 补偿
- 定位器可以随时删掉，不影响组

### 5.5 单个 pin：`create_uv_pin(...)`

职责：

- 一个定位器 → 一个组 → 一个 uvPin（或者被合并时只建索引）

流程：

```python
shape = get_shape(shape)
driver = get_driver_transform(driver)

# 1. 取世界位置、求 UV
world_position = snap_utils.get_item_world_position(driver)
uv = get_closest_uv(shape, world_position, uv_set)

# 2. 建组
group = create_zero_group(driver)

# 3. 建 uvPin
node = cmds.createNode("uvPin", name=driver_short + "_uvPin")
cmds.setAttr(node + ".coordinate[0].coordinateU", uv["u"])
cmds.setAttr(node + ".coordinate[0].coordinateV", uv["v"])
cmds.connectAttr(shape + ".worldMesh[0]", node + ".deformedGeometry")

# 4. 节点级属性
cmds.setAttr(node + ".uvSetName", uv_set, type="string")
cmds.setAttr(node + ".normalAxis", normal_axis)
cmds.setAttr(node + ".tangentAxis", tangent_axis)
cmds.setAttr(node + ".relativeSpaceMode", 0)  # World

# 5. 驱动
cmds.connectAttr(
    node + ".outputMatrix[0]",
    group + ".offsetParentMatrix"
)
```

返回：

```python
{
    "driver": driver,     # 定位器
    "group": group,       # 新建的组
    "target": group,      # 被驱动的对象（组）
    "node": node,
    "index": 0,
    ...
}
```

> 约束模式的差别只在第 5 步：先建隐藏 Locator，再 `parentConstraint` / `pointConstraint`。

### 5.6 批量 + 合并：`create_uv_pins(...)`

这是最值得学的一段：**先分桶，再建节点，再写 index**。

```python
buckets = {}

for driver in drivers:
    world_position = get_item_world_position(driver)
    uv = get_closest_uv(shape, world_position, uv_set)
    parent = get_parent(driver)  # 世界级组时为 None

    key = (uv_set, normal_axis, tangent_axis, parent)
    buckets.setdefault(key, []).append((driver, uv))

created = []
failed = []
nodes = []

for key, items in buckets.items():
    node = cmds.createNode("uvPin")
    nodes.append(node)

    # 节点级属性只设置一次
    cmds.setAttr(node + ".uvSetName", key[0], type="string")
    cmds.setAttr(node + ".normalAxis", key[1])
    cmds.setAttr(node + ".tangentAxis", key[2])
    cmds.connectAttr(shape + ".worldMesh[0]", node + ".deformedGeometry")

    if key[3]:
        cmds.setAttr(node + ".relativeSpaceMode", 2)  # Custom
        cmds.connectAttr(
            key[3] + ".worldMatrix[0]",
            node + ".relativeSpaceMatrix"
        )
    else:
        cmds.setAttr(node + ".relativeSpaceMode", 0)  # World

    for index, (driver, uv) in enumerate(items):
        # 每个 index 一个组
        group = create_zero_group(driver)

        cmds.setAttr(
            "{}.coordinate[{}].coordinateU".format(node, index),
            uv["u"]
        )
        cmds.setAttr(
            "{}.coordinate[{}].coordinateV".format(node, index),
            uv["v"]
        )

        if output_mode == "offset_parent_matrix":
            cmds.connectAttr(
                "{}.outputMatrix[{}]".format(node, index),
                group + ".offsetParentMatrix"
            )
        else:
            pin_output = cmds.spaceLocator(name=...)[0]
            cmds.connectAttr(
                "{}.outputMatrix[{}]".format(node, index),
                pin_output + ".offsetParentMatrix"
            )
            cmds.parentConstraint(
                pin_output, group,
                maintainOffset=maintain_offset
            )

        created.append({
            "driver": driver,
            "group": group,
            "target": group,
            "node": node,
            "index": index,
        })
```

重点：

1. **分桶 key 决定能不能合并**
2. **节点级属性只设置一次**
3. **每个 index 单独写 coordinate / outputMatrix**
4. 失败处理应该按定位器粒度，不要一个失败整批回滚

### 5.7 失败的粒度

`create_uv_pins` 里每个定位器独立 `try/except`：

```python
for driver in drivers:
    try:
        ...
    except Exception as error:
        failed.append({"driver": driver, "error": str(error)})
```

这样 UI 可以显示：

```text
已创建 8 个 UV Pin；失败 2 个
```

而不是整批崩掉。

---

## 6. UI 设计

### 6.1 控件

| 区块 | 控件 | 作用 |
|---|---|---|
| 目标模型 | 标签 + `载入选择` | 从当前选择取 Mesh |
| 定位器 | 列表 + 添加 / 移除 / 清空 | 管理位置参考 |
| 创建选项 | UV 集下拉 | 多 UV 时选择 |
|  | 输出方式 | `Offset Parent Matrix` / `Parent Constraint` / `Point Constraint` |
|  | 驱动对象 | `组（推荐）` / `定位器本身` |
|  | 合并 UV Pin | 默认勾选 |
|  | 保持偏移 | 仅约束模式可勾 |
|  | 法线轴 / 切线轴 | 6 个轴向 |
| 操作 | `创建 UV Pin` | 执行 |

### 6.2 交互流程

```text
选模型 + 定位器
      ↓
[载入选择]
      ↓
模型标签显示 pSphereShape1
定位器列表显示 locator1 / locator2 ...
      ↓
调参数
      ↓
[创建 UV Pin]
      ↓
Undo Chunk 包住整批
      ↓
状态：已创建 5 个组 / 1 个 uvPin 节点；失败 0
```

### 6.3 Tool 层的职责边界

Tool **不做**：

- 不自己算 UV
- 不自己建 uvPin
- 不自己处理父级空间

Tool **只做**：

- 从选择里识别 Mesh / Transform
- 读写控件
- 打开 / 关闭 Undo Chunk
- 把 Core 的异常转成 `cmds.warning` 和状态文字

---

## 7. 错误处理与边界

| 情况 | 处理 |
|---|---|
| 选中的不是 Mesh | Core 抛 `RuntimeError`，Tool 显示 warning |
| 模型没有 UV | `polyUVSet` 返回空，提示先展 UV |
| 指定的 UV Set 不存在 | 拒绝创建 |
| 定位器是组件 | 拒绝（`snap_utils.is_component`） |
| 定位器有锁定 TRS | 清空时抛错，提示先解锁 |
| 同一个定位器重复执行 | 会新建组和节点；旧连接可能被覆盖，建议先清理 |
| 法线轴 = 切线轴 | 拒绝创建 |
| 约束模式 | 多一个隐藏 `*_output` Locator，组本身保留 |

---

## 8. 测试设计

### 8.1 Maya 真机测试

| 用例 | 断言 |
|---|---|
| 批量创建 | 组数量 = 定位器数量；组在世界级；定位器父级/变换未变 |
| 组位置 | 组的世界位置 = 定位器创建时的世界位置 |
| 合并 | 同一模型 + 同轴 + 同 UV → 1 个 uvPin 节点；每个 target 接对应 `outputMatrix[i]` |
| 跟随 | 移动模型，组的世界位置跟着变 |
| 约束模式 | 约束节点存在；`pointConstraint + maintainOffset` 保留偏移 |
| 兼容模式 | `drive_group=False` 时 target = 定位器，行为不回归 |
| 非法参数 | 同轴 / 非法 UV Set 被拒绝 |

### 8.2 无 Maya 测试

- 工具被注册到 `rig` 分类
- 标题、`TOOL_MODE` 正确
- 工具模块有 `main()`
- Core 的公开函数都存在

这样 CI 不依赖 Maya，Maya 相关测试留给本机。

---

## 9. 性能说明

### 9.1 合并的收益

N 个定位器：

| 项目 | 合并前 | 合并后 |
|---|---|---|
| uvPin 节点 | N | 1（同空间/轴/UV） |
| `deformedGeometry` 连接 | N | 1 |
| DG 调度 | N 个节点 | 1 个节点 |
| 每点求值 | N 次 | N 次（index 仍要算） |

所以省的是 **节点和连接**，不是把 N 次计算变成 1 次。

### 9.2 还能更省的地方

`uvPin` 还有一个 `originalGeometry` 输入：

- 接未变形的几何，用于「不变状态下采样 UV」
- 官方说对性能很关键
- 当前实现没接，因为要额外拿一份原始几何
- 如果以后做大规模 pin，可以加

---

## 10. 代码骨架

### `core/rigging/uv_pin_utils.py`

```python
AXIS_NAMES = ("X", "Y", "Z", "-X", "-Y", "-Z")

OUTPUT_OFFSET_PARENT_MATRIX = "offset_parent_matrix"
OUTPUT_PARENT_CONSTRAINT = "parent_constraint"
OUTPUT_POINT_CONSTRAINT = "point_constraint"
OUTPUT_MODES = (...)

RELATIVE_SPACE_WORLD = 0
RELATIVE_SPACE_CUSTOM = 2


def get_shape(node): ...
def get_driver_transform(driver): ...
def get_uv_sets(shape): ...
def get_current_uv_set(shape): ...
def get_closest_uv(shape, world_position, uv_set=None): ...

def create_zero_group(driver, group_name=None): ...

def create_uv_pin(
    shape, driver, uv_set=None,
    normal_axis=0, tangent_axis=1,
    node_name=None,
    output_mode=OUTPUT_OFFSET_PARENT_MATRIX,
    maintain_offset=False,
    drive_group=True,
    group_name=None,
): ...

def create_uv_pins(
    shape, drivers, uv_set=None,
    normal_axis=0, tangent_axis=1,
    output_mode=OUTPUT_OFFSET_PARENT_MATRIX,
    maintain_offset=False,
    drive_group=True,
    merge=True,
): ...
```

### `tools/rig/uv_pin_tool.py`

```python
class UVPinTool(MayaQWidgetBaseMixin, QtWidgets.QWidget):
    def build_ui(self): ...
    def build_model_section(self): ...
    def build_locator_section(self): ...
    def build_option_section(self): ...
    def build_action_section(self): ...

    def load_from_selection(self): ...
    def add_selected_drivers(self): ...
    def remove_selected_drivers(self): ...
    def clear_drivers(self): ...

    def set_model(self, node): ...
    def refresh_uv_sets(self): ...

    def on_output_mode_changed(self, index): ...
    def create_pins(self): ...


def main(): ...
```

---

## 11. 后续可以扩展的方向

1. **follicle 模式**：和 uvPin 不是同一套节点，需要 hairSystem / follicle 链，单独做
2. **NURBS 支持**：要处理等参线归一化
3. **自动清理**：按组名或节点名删除旧 pin
4. **创建后隐藏定位器**：可选，不影响组
5. **`originalGeometry`**：大规模 pin 的性能优化

---

## 12. 结论

这套实现的核心就三句话：

1. **UV 定位**：定位器世界位置 → 最近点 → UV
2. **组承载**：每个位置一个世界级组，`uvPin` 用矩阵驱动组
3. **分桶合并**：同模型、同轴、同 UV、同空间 → 一个 `uvPin` 节点多个 index

把这三件事拆成 Core 的小函数，Tool 只做选择和参数，测试分别覆盖真机和静态注册。  
这样即使以后加 follicle 或 NURBS，也不需要推翻现有结构。
