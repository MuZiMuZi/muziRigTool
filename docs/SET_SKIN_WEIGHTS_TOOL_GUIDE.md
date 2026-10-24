# Set Skin Weights Tool 开发手册：链式蒙皮

> 版本：1.0
>
> 适用环境：Maya 2023 / Python 3.9 / PySide2 / Maya API 2.0
>
> 目标：从零写出一个可用的链式蒙皮工具，并能继续扩展成完整的权重工具。

> **muziRigTool 适配说明**
>
> 本手册已迁移到 `muziRigTool`，Core 部分（第 1–7、9 课）与当前仓库一致。
>
> 第 8 课的 UI 代码仍沿用旧仓库的 `ui.window_utils`、`theme.make_card`、
> `theme.style_primary` 等接口；`muziRigTool` 的工具窗口请参考
> `tools/basic/rename_tool.py` 的写法：`MayaQWidgetBaseMixin + QtWidgets.QWidget`，
> 并使用 `theme.make_title` / `make_subtitle` / `make_section` / `button_style`。
> 直接照抄第 8 课会报 `ModuleNotFoundError`。
>
> 工具注册也不需要改 `app/toolbox_catalog.py`：`muziRigTool/tools/__init__.py`
> 会从模块 docstring 第一行或 `TOOL_TITLE` 读取显示名。

---

## 目录

- [0. 你将做出什么](#0-你将做出什么)
- [1. 开始之前](#1-开始之前)
- [2. 课程地图](#2-课程地图)
- [3. 第 0 课：工程结构与分层](#3-第-0-课工程结构与分层)
- [4. 第 1 课：收集关节链](#4-第-1-课收集关节链)
- [5. 第 2 课：读取坐标](#5-第-2-课读取坐标)
- [6. 第 3 课：最近骨段与参数 t](#6-第-3-课最近骨段与参数-t)
- [7. 第 4 课：生成权重矩阵](#7-第-4-课生成权重矩阵)
- [8. 第 5 课：写进 skinCluster](#8-第-5-课写进-skincluster)
- [9. 第 6 课：平滑、限制与收尾](#9-第-6-课平滑限制与收尾)
- [10. 第 7 课：封装一键入口](#10-第-7-课封装一键入口)
- [11. 第 8 课：UI 面板](#11-第-8-课ui-面板)
- [12. 第 9 课：测试与验收](#12-第-9-课测试与验收)
- [13. 第 10 课：排错、性能与生产化](#13-第-10-课排错性能与生产化)
- [附录 A：完整 Core 代码](#附录-a完整-core-代码)
- [附录 B：API 速查](#附录-bapi-速查)
- [附录 C：参考资料](#附录-c参考资料)
- [附录 D：下一步可以加什么](#附录-d下一步可以加什么)

---

## 0. 你将做出什么

最终工具是一个常驻的 Maya 面板：

```text
┌──────────────────────────────────────┐
│ Chain Skin Tool                      │
│ 选择网格和根关节，一键生成链式蒙皮。   │
│                                      │
│ 模式        [距离权重 / Geodesic ▼]  │
│ 平滑次数    [1]                      │
│ 最大影响数  [4]                      │
│ 混合起点    [0.50]                   │
│ [x] 替换已有蒙皮                      │
│                                      │
│        [ 一键链式蒙皮 ]               │
│                                      │
│ 完成：12 个关节，平均影响 2.10        │
└──────────────────────────────────────┘
```

用户操作只有三步：

1. 选一个网格；
2. 选这根链的根关节；
3. 点按钮。

工具会在一次 Undo 内完成：

- 收集整条关节链；
- 按骨段计算初始权重；
- 创建 `skinCluster`；
- 批量写入权重；
- 平滑、限制影响数、归一化；
- 给未加权顶点兜底；
- 返回统计信息。

完成后，动画师或绑定师再接管手动微调。

> 这份文档只实现“链式自动权重”和它的工具外壳。刷权重笔刷、权重表、软选择预览，是后续扩展，不在这里展开。

---

## 1. 开始之前

### 1.1 环境

- Maya 2023（Python 3.9）；
- 仓库 `muziRigTool` 已经在 Maya 的 Python 路径中，能执行 `import muziRigTool`；
- Maya 2023 自带 NumPy；
- 使用 PySide2（Maya 2023 自带）；
- 使用 Maya API 2.0：`from maya.api import OpenMaya`。

验证环境：

```python
import sys
import numpy
import maya.cmds as cmds
from maya.api import OpenMaya as om
from maya.api import OpenMayaAnim as oma

print(sys.version)
print(numpy.__version__)
print(cmds.about(version=True))
```

如果 `import numpy` 失败，说明 Maya 的 Python 环境有问题，先解决环境，不要继续。

### 1.2 建议的工作方式

1. 新建一个 Git 分支，例如 `feature/chain-skin-tool`；
2. 每完成一课，提交一次；
3. 每课都在一个空场景里验证；
4. 不要一开始就把所有代码复制进去，先跑当前课的最小代码；
5. 卡住时先看本课“常见错误”，再看附录 A。

修改模块后，Maya 不会自动重新加载。开发时在 Script Editor 里这样做：

```python
import importlib
importlib.reload(chain_skin_utils)
```

或者在改完代码后重启 Maya。否则你看到的可能还是旧函数。

### 1.3 测试场景

后面反复用到这个场景：

```python
import maya.cmds as cmds

cmds.file(new=True, force=True)

cmds.polyCylinder(
    r=1, h=10,
    sx=20, sy=20, sz=5,
    name="body",
)

cmds.select(clear=True)
cmds.joint(p=(0, -5, 0), name="root")
cmds.joint(p=(0, 0, 0), name="mid")
cmds.joint(p=(0, 5, 0), name="tip")
```

它包含：

- 一个高 10、半径 1 的圆柱；
- 三根关节 `root → mid → tip`；
- 关节在 Y 轴 -5、0、5 的位置。

> 注意：`cmds.file(new=True, force=True)` 会清空当前场景。先保存你正在做的文件。

---

## 2. 课程地图

| 课 | 产出 | 验收标准 |
|---|---|---|
| 0 | 目录与分层 | 知道 core / tools / tests 各放什么 |
| 1 | `collect_chain_joints` | 打印出 `root → mid → tip` |
| 2 | 坐标读取 | 顶点数、关节数、世界坐标范围正确 |
| 3 | 最近骨段与 `t` | 骨段中点 `t≈0.5`，关节处 `t≈0/1` |
| 4 | 权重矩阵 | 每行和为 1，每行最多 2 个非零 |
| 5 | 写入 `skinCluster` | 弯 `mid` 时圆柱平滑变形 |
| 6 | 平滑 / 限制 / 归一化 | 最大影响数 ≤ 4，无未加权点 |
| 7 | 一键入口 | 一次调用完成，一次 Undo 回退 |
| 8 | UI 面板 | 按钮可用，状态栏显示统计 |
| 9 | 测试 | Maya smoke test 通过 |
| 10 | 排错与性能 | 能定位常见问题 |

文件节奏：

- 第 1 课创建 `chain_skin_utils.py`；
- 第 2~7 课都往这个文件里追加；
- 第 8 课创建 `chain_skin_tool.py`；
- 第 9 课创建 `chain_skin_maya_smoke_test.py`。

每课末尾的“验收”没通过，不要急着进下一课。

---

## 3. 第 0 课：工程结构与分层

### 3.1 目标

先定好文件位置，避免写着写着把 UI、算法、Maya 命令混在一起。

最终结构：

```text
muziRigTool/
├─ core/
│  └─ deformation/
│     └─ chain_skin_utils.py      # 纯数据与算法，不碰 UI
├─ tools/
│  └─ skin/
│     └─ chain_skin_tool.py       # PySide2 面板，调用 core
└─ tests/
   └─ chain_skin_maya_smoke_test.py
```

### 3.2 分层规则

| 层 | 可以做什么 | 不可以做什么 |
|---|---|---|
| `core` | 读 Maya 数据、算权重、写 `skinCluster` | 创建窗口、读当前选择、弹提示 |
| `tools` | 读选择、收集参数、显示状态、调用 core | 复制 core 的算法、直接 `cmds.undoInfo` |
| `tests` | 建测试场景、断言结果 | 依赖交互式 UI |

两个必须记住的仓库约束：

1. `core` 不允许反向 import `tools / ui / app / systems`；
2. `tools / ui / systems` 里不允许直接调用 `cmds.undoInfo`，统一走 `core.common.scene_utils`。

本工具的 Undo 由 core 的 `bind_chain_skin()` 内部管理，UI 不碰 Undo，正好符合约束。

### 3.3 创建文件

在仓库根目录创建：

```text
core/deformation/chain_skin_utils.py
tools/skin/chain_skin_tool.py
tests/chain_skin_maya_smoke_test.py
```

如果 `core/deformation/__init__.py` 或 `tools/skin/__init__.py` 已经存在，不需要改；Python 可以直接按模块路径 import。

### 3.4 本课验收

- [ ] 三个文件已创建；
- [ ] 知道 core 不写 UI、tools 不写算法；
- [ ] 知道 `cmds.undoInfo` 只在 core 里出现。

---

## 4. 第 1 课：收集关节链

### 4.1 目标

输入根关节，输出一条**父节点在前**的关节列表：

```text
root → mid → tip
```

### 4.2 为什么不能只写一个 while 循环

单链确实可以：

```python
current = root
while current:
    ...
```

但真实绑定里经常有分支：手指、脊椎、尾巴、触手。递归可以自然处理分支，单链只是它的特例。

### 4.3 代码

把下面内容写入 `core/deformation/chain_skin_utils.py`：

```python
# coding=utf-8
"""chain_skin_utils：一键链式蒙皮。"""

from __future__ import print_function

import numpy as np
import maya.cmds as cmds
from maya.api import OpenMaya as om
from maya.api import OpenMayaAnim as oma

from ..common import hierarchy_utils
from ..common import scene_utils


def collect_chain_joints(root_joint):
    """从根关节收集整条关节链，父节点在前。"""

    scene_utils.validate_node(root_joint, u"根关节")
    root_joint = scene_utils.get_long_name(root_joint)

    if cmds.nodeType(root_joint) != "joint":
        raise RuntimeError("不是关节：{}".format(root_joint))

    return hierarchy_utils.get_child_object(root_joint, "joint")
```

### 4.4 逐段解释

**验证**

- `scene_utils.validate_node`：拦住空名、不存在的对象、组件；
- `nodeType != "joint"`：拦住 mesh、group、locator；
- `scene_utils.get_long_name`：把短名统一成 `|root` 这样的唯一路径。

**复用仓库遍历**

`hierarchy_utils.get_child_object(root, "joint")` 会：

- 返回所有 joint 后代，并包含 root 本身；
- 统一返回 Long Path；
- 按父级到子级的顺序排列。

它比手写递归更符合仓库的“单一来源”原则。注意它会穿过非 joint 的 group，所以第 6 课的 `build_segments` 会从每个关节向上找最近的 joint 父级，保证隔组也能建段。

### 4.5 验证

在 Maya Script Editor 里：

```python
import maya.cmds as cmds
from muziRigTool.core.deformation import chain_skin_utils

cmds.file(new=True, force=True)

cmds.polyCylinder(r=1, h=10, sx=20, sy=20, sz=5, name="body")
cmds.select(clear=True)
cmds.joint(p=(0, -5, 0), name="root")
cmds.joint(p=(0, 0, 0), name="mid")
cmds.joint(p=(0, 5, 0), name="tip")

joints = chain_skin_utils.collect_chain_joints("root")

for index, joint in enumerate(joints):
    print(index, joint)
```

预期输出：

```text
0 |root
1 |root|mid
2 |root|mid|tip
```

### 4.6 常见错误

| 现象 | 原因 |
|---|---|
| `根关节不存在` | 名字写错，或在命名空间里 |
| `不是关节` | 选中的是 mesh / group |
| 只返回一个关节 | 关节不是父子链，中间断了 |
| 返回了额外关节 | 有分支，或 joint 挂在非 joint 的 group 下（会被穿过） |
| `名称不唯一` | 场景里有多个同名 `root` |

### 4.7 本课验收

- [ ] 输出三行，顺序是 root → mid → tip；
- [ ] 在 `mid` 下加一根分支关节后，输出四行；
- [ ] 传入 mesh 时会报“不是关节”。

---

## 5. 第 2 课：读取坐标

### 5.1 目标

拿到两样东西：

1. 网格每个顶点的**世界坐标**；
2. 每根关节的**世界坐标**。

后面的距离计算全在这两个坐标系里做，所以必须统一。

### 5.2 代码

继续在 `chain_skin_utils.py` 里追加：

```python
def _as_node(name):
    selection = om.MSelectionList()
    selection.add(name)
    return selection.getDependNode(0)


def _as_dag_path(name):
    selection = om.MSelectionList()
    selection.add(name)
    return selection.getDagPath(0)


def get_shape_dag_path(mesh):
    """把 transform / shape 统一成 mesh shape 的 DagPath。"""

    dag = _as_dag_path(mesh)

    if dag.node().apiType() == om.MFn.kTransform:
        dag.extendToShape()

    if dag.node().apiType() != om.MFn.kMesh:
        raise RuntimeError("不是 Polygon Mesh：{}".format(mesh))

    return dag


def find_skin_cluster(mesh):
    """返回网格上的第一个 skinCluster；没有时返回 None。"""

    shapes = cmds.listRelatives(
        mesh,
        shapes=True,
        noIntermediate=True,
        fullPath=True,
    ) or []

    targets = shapes or [mesh]

    for shape in targets:
        for node in cmds.listHistory(shape) or []:
            if cmds.nodeType(node) == "skinCluster":
                return node

    return None


def get_joint_positions(joints):
    return np.array(
        [
            cmds.xform(joint, q=True, ws=True, t=True)
            for joint in joints
        ],
        dtype=np.float64,
    )


def get_mesh_points(dag):
    points = om.MFnMesh(dag).getPoints(om.MSpace.kWorld)
    return np.array(
        [[point.x, point.y, point.z] for point in points],
        dtype=np.float64,
    )
```

### 5.3 为什么用 API 2.0

- `MFnMesh.getPoints(kWorld)` 一次拿到全部顶点，比逐点 `cmds.pointPosition` 快；
- 返回的是世界坐标，和 `cmds.xform(ws=True)` 的关节坐标在同一空间；
- `getPoints` 拿到的是当前形状，不涉及选择集。

### 5.4 验证

```python
from muziRigTool.core.deformation import chain_skin_utils

dag = chain_skin_utils.get_shape_dag_path("body")
points = chain_skin_utils.get_mesh_points(dag)

joints = chain_skin_utils.collect_chain_joints("root")
positions = chain_skin_utils.get_joint_positions(joints)

print("vertices:", points.shape)
print("joints:", positions.shape)
print("bounds min:", points.min(axis=0))
print("bounds max:", points.max(axis=0))
print(positions)
```

预期：

```text
vertices: (N, 3)
joints: (3, 3)
bounds min: [-1. -5. -1.]
bounds max: [ 1.  5.  1.]
[[ 0. -5.  0.]
 [ 0.  0.  0.]
 [ 0.  5.  0.]]
```

`N` 是圆柱顶点数，具体值取决于分段；只要明显大于 0 且 bounds 合理即可。

### 5.5 常见错误

| 现象 | 原因 |
|---|---|
| `不是 Polygon Mesh` | 传了 NURBS 或 transform 下没有 mesh |
| 顶点坐标全是 0 | 传错了 shape，或网格没有 `outMesh` |
| 关节坐标不是世界坐标 | 用了 `q=True, t=True` 但没加 `ws=True` |
| 顶点数和预期不符 | 多 shape，或中间有 intermediate object |

### 5.6 本课验收

- [ ] `points.shape` 是 `(N, 3)`；
- [ ] `positions.shape` 是 `(3, 3)`；
- [ ] bounds 在 X/Z 约 `-1..1`，Y 约 `-5..5`。

---

## 6. 第 3 课：最近骨段与参数 t

### 6.1 目标

对每个顶点，找到离它最近的骨段，并算出它在这段上的投影参数 `t`：

- `t = 0`：在骨段起点；
- `t = 1`：在骨段终点；
- `t = 0.5`：在骨段中点。

### 6.2 数学

给定骨段 `A → B` 和顶点 `P`：

```text
AB = B - A
t  = clamp( dot(P - A, AB) / dot(AB, AB), 0, 1 )
C  = A + t * AB
d  = |P - C|
```

`t` 被 clamp 到 0~1，所以投影点不会跑到线段外面。

### 6.3 代码

```python
def _distance_to_segment(points, start, end):
    """返回每个点到线段的距离，以及投影参数 t。"""

    direction = end - start
    length_sq = float(np.dot(direction, direction))

    if length_sq < 1e-12:
        distance = np.linalg.norm(points - start, axis=1)
        return distance, np.zeros(len(points))

    t = np.clip(
        ((points - start) @ direction) / length_sq,
        0.0,
        1.0,
    )
    closest = start + t[:, None] * direction
    distance = np.linalg.norm(points - closest, axis=1)

    return distance, t
```

### 6.4 建立骨段列表

```python
def build_segments(joints):
    """返回 (parent_index, child_index) 的骨段列表。"""

    index_by_name = {
        name: index for index, name in enumerate(joints)
    }
    segments = []

    for child_index, child in enumerate(joints):
        parent = (
            cmds.listRelatives(child, parent=True, fullPath=True)
            or [None]
        )[0]

        while parent and parent not in index_by_name:
            parent = (
                cmds.listRelatives(parent, parent=True, fullPath=True)
                or [None]
            )[0]

        if parent in index_by_name:
            segments.append((index_by_name[parent], child_index))

    return segments
```

从每个关节向上找最近的 joint 父级，这样中间隔 group 也能建段；根关节没有父级，自然不建段。

### 6.5 调试：打印最近骨段

先不写权重，只验证“最近段”和 `t` 是否合理：

```python
def inspect_nearest(points, positions, segments):
    """打印几个顶点的最近骨段与 t，仅用于调试。"""

    for vertex_index in (0, len(points) // 2, len(points) - 1):
        point = points[vertex_index]

        best_distance = None
        best_segment = None
        best_t = 0.0

        for segment_index, (parent_index, child_index) in enumerate(segments):
            distance, t = _distance_to_segment(
                point[None, :],
                positions[parent_index],
                positions[child_index],
            )
            distance = float(distance[0])
            t = float(t[0])

            if best_distance is None or distance < best_distance:
                best_distance = distance
                best_segment = segment_index
                best_t = t

        print(
            vertex_index,
            "segment", best_segment,
            "t", round(best_t, 3),
            "distance", round(best_distance, 3),
        )
```

调用：

```python
segments = chain_skin_utils.build_segments(joints)
chain_skin_utils.inspect_nearest(points, positions, segments)
```

### 6.6 预期

对于圆柱：

- 底部顶点：最近段 0，`t` 接近 0；
- 骨段中点（例如 `y=-2.5`）：`t` 接近 0.5；
- 关节处（例如 `y=0`）：最近段可能是 0 或 1，`t` 接近 1 或 0；
- 顶部顶点：最近段 1，`t` 接近 1。

关键不是具体数字，而是：

- `t` 必须在 0~1；
- 关节附近的顶点会落在两段之间；
- 中点顶点的 `t` 不会异常。

### 6.7 常见错误

| 现象 | 原因 |
|---|---|
| `t` 全是 0 或 1 | 骨段长度为 0，或方向向量反了 |
| 距离为负 | 用的是有符号距离，应该用 `np.linalg.norm` |
| 最近段总是 0 | `segments` 只建了一段，检查父子关系 |

### 6.8 本课验收

- [ ] `segments` 长度是 2（root→mid、mid→tip）；
- [ ] 打印的 `t` 都在 0~1；
- [ ] 圆柱中点顶点落在骨段中点附近。

---

## 7. 第 4 课：生成权重矩阵

### 7.1 目标

输出一个 `(顶点数, 关节数)` 的矩阵，每一行满足：

- 权重和 = 1；
- 只有 1~2 个非零；
- 骨段中段几乎 100% 属于父关节；
- 关节附近平滑过渡到子关节。

### 7.2 核心思路

**先找最近骨段，再在骨段内部混合。**

不是“算每个关节到顶点的距离再归一化”，那样骨段中点会得到父子各 50%，整根骨头都会变软。

### 7.3 混合公式

```text
s = smoothstep( clamp( (t - blend_start) / (1 - blend_start), 0, 1 ) )
w_parent = 1 - s
w_child  = s
```

`smoothstep(x) = x²(3 - 2x)`。

`blend_start = 0.5` 时：

| t | 0.0 | 0.5 | 0.75 | 1.0 |
|---|---|---|---|---|
| w_parent | 1 | 1 | 0.5 | 0 |
| w_child | 0 | 0 | 0.5 | 1 |

### 7.4 代码

```python
def compute_chain_weights(points, joint_positions, segments, blend_start=0.5):
    """按最近骨段 + 参数混合生成权重矩阵。"""

    vertex_count = len(points)
    joint_count = len(joint_positions)
    weights = np.zeros((vertex_count, joint_count), dtype=np.float64)

    if not segments:
        weights[:, 0] = 1.0
        return weights

    best_distance = np.full(vertex_count, np.inf)
    best_segment = np.full(vertex_count, -1, dtype=np.int32)
    best_t = np.zeros(vertex_count)

    # 1. 每个顶点找最近骨段
    for segment_index, (parent_index, child_index) in enumerate(segments):
        distance, t = _distance_to_segment(
            points,
            joint_positions[parent_index],
            joint_positions[child_index],
        )

        closer = distance < best_distance
        best_distance[closer] = distance[closer]
        best_segment[closer] = segment_index
        best_t[closer] = t[closer]

    # 2. 在骨段内部做参数混合
    for segment_index, (parent_index, child_index) in enumerate(segments):
        mask = best_segment == segment_index
        if not np.any(mask):
            continue

        t = best_t[mask]
        blend = np.clip(
            (t - blend_start) / max(1e-8, 1.0 - blend_start),
            0.0,
            1.0,
        )
        blend = blend * blend * (3.0 - 2.0 * blend)

        weights[mask, parent_index] = 1.0 - blend
        weights[mask, child_index] = blend

    # 3. 兜底：没有命中任何骨段的顶点，绑到最近关节
    missing = np.where(best_segment < 0)[0]
    if len(missing):
        distances = np.linalg.norm(
            points[missing][:, None, :] - joint_positions[None, :, :],
            axis=2,
        )
        weights[missing, distances.argmin(axis=1)] = 1.0

    return weights


def normalize_weights(weights):
    result = weights.copy()
    sums = result.sum(axis=1, keepdims=True)
    result /= np.where(sums < 1e-8, 1.0, sums)
    return result
```

### 7.5 验证

```python
weights = chain_skin_utils.compute_chain_weights(
    points,
    positions,
    chain_skin_utils.build_segments(joints),
    blend_start=0.5,
)

print("shape:", weights.shape)
print("row sums:", weights.sum(axis=1)[:5])
print("max influences:", (weights > 1e-6).sum(axis=1).max())
print("nonzero per row:", (weights > 1e-6).sum(axis=1)[:10])
```

预期：

```text
shape: (N, 3)
row sums: [1. 1. 1. 1. 1.]
max influences: 2
```

如果某一行和不是 1，先检查是否 `normalize_weights` 之前就打印了。

### 7.6 为什么中段是刚性的

顶点在骨段中点时，`t≈0.5`，`blend_start=0.5` 使 `blend=0`，所以 `w_parent=1`。

只有 `t > 0.5` 之后才开始过渡到子关节。这样上臂中段不会跟着肘关节走。

### 7.7 常见错误

| 现象 | 原因 |
|---|---|
| 每行和不为 1 | 没做归一化，或某个顶点没命中任何段 |
| 中段父子各 50% | `blend_start` 设成了 0 |
| 所有顶点都绑到根关节 | `best_segment` 没有正确更新 |
| 关节处出现硬边 | `blend_start` 太大，或没做平滑 |

### 7.8 本课验收

- [ ] 矩阵形状是 `(顶点数, 关节数)`；
- [ ] 每行和 ≈ 1；
- [ ] 每行非零数 ≤ 2；
- [ ] 中段顶点的父关节权重接近 1。

---

## 8. 第 5 课：写进 skinCluster

### 8.1 目标

创建 `skinCluster`，把我们算好的矩阵写进 `weightList`。

### 8.2 关键概念

`skinCluster` 的权重存储是：

```text
weightList[顶点索引].weights[影响索引]
```

影响索引的顺序来自 `MFnSkinCluster.influenceObjects()`，不一定等于你传入的关节顺序。所以写回时必须重新对列。

先把节点关系看清楚，后面写权重才不会迷路：

```text
meshShape.outMesh ───────────────► skinCluster.input[0].inputGeometry

joint1.worldMatrix[0] ───────────► skinCluster.matrix[0]
joint2.worldMatrix[0] ───────────► skinCluster.matrix[1]
...                                │
dagPose.worldMatrix[0..n] ───────► skinCluster.bindPose (message)
                                    └─ bindPreMatrix[i] = inverse(bind pose)

skinCluster.outputGeometry[0] ───► meshShape.inMesh

skinCluster.weightList[v].weights[i]   ← 你的工具写这里
```

| 节点 / 属性 | 作用 |
|---|---|
| `mesh` | 提供 `outMesh` 和顶点坐标 |
| `joint` | 提供 `worldMatrix`，即每帧的骨骼变换 |
| `dagPose` | 保存 bind pose |
| `skinCluster` | 保存权重，执行 LBS / DQ 变形 |
| `weightList` | 权重数据，绑定时写入，之后不随关节变化 |
| `matrix[i]` | 影响 i 的当前世界矩阵 |
| `bindPreMatrix[i]` | 影响 i 的逆绑定矩阵 |
| `geomBind` | 测地体素权重的管理器（可选） |

一句话：**`skinCluster` 是执行者，权重是数据。** 关节动的时候，`weightList` 不会变；变的是 `matrix[i]`。所以链式算法只在绑定时跑一次，不需要每帧计算。

### 8.3 创建 skinCluster

```python
def create_skin_cluster(mesh, joints, max_influences=4, name=None, replace=True):
    existing = find_skin_cluster(mesh)

    if existing:
        if not replace:
            raise RuntimeError("网格已有 SkinCluster：{}".format(existing))
        cmds.delete(existing)

    kwargs = {}
    if name:
        kwargs["name"] = name

    return cmds.skinCluster(
        *(joints + [mesh]),
        toSelectedBones=True,
        bindMethod=0,
        normalizeWeights=2,
        maximumInfluences=max_influences,
        obeyMaxInfluences=True,
        **kwargs
    )[0]
```

说明：

- `bindMethod=0`：先用最近距离建一个骨架，初值稍后会被我们覆盖；
- `normalizeWeights=2`：Post 归一化；
- `maximumInfluences=4`：限制最大影响数；
- `obeyMaxInfluences=True`：后续编辑继续遵守；
- `replace=True`：已有蒙皮时删除重建。

### 8.4 批量写权重

```python
def write_weights(skin_cluster, dag, weights, joints):
    skin_fn = oma.MFnSkinCluster(_as_node(skin_cluster))
    influence_paths = skin_fn.influenceObjects()
    influence_count = len(influence_paths)

    column_by_joint = {
        path.fullPathName(): column
        for column, path in enumerate(influence_paths)
    }

    ordered = np.zeros(
        (weights.shape[0], influence_count),
        dtype=np.float64,
    )

    for joint_index, joint in enumerate(joints):
        column = column_by_joint.get(joint)
        if column is None:
            raise RuntimeError("SkinCluster 缺少影响：{}".format(joint))
        ordered[:, column] = weights[:, joint_index]

    component_fn = om.MFnSingleIndexedComponent()
    component = component_fn.create(om.MFn.kMeshVertComponent)
    component_fn.addElements(list(range(weights.shape[0])))

    skin_fn.setWeights(
        dag,
        component,
        om.MIntArray(list(range(influence_count))),
        om.MDoubleArray(ordered.ravel().tolist()),
        normalize=False,
    )
```

为什么 `normalize=False`？

- 我们已经在 Python 里归一化了；
- 让 Maya 再归一化一次，可能和锁定权重、Hold Weights 打架；
- 写入的矩阵行和已经是 1。

### 8.5 最小可运行版本

先不接平滑，直接算完写：

```python
def bind_chain_skin_minimal(mesh, root_joint, max_influences=4):
    dag = get_shape_dag_path(mesh)
    joints = collect_chain_joints(root_joint)

    points = get_mesh_points(dag)
    positions = get_joint_positions(joints)

    skin = create_skin_cluster(
        mesh, joints, max_influences=max_influences
    )

    weights = compute_chain_weights(
        points,
        positions,
        build_segments(joints),
    )
    weights = normalize_weights(weights)

    write_weights(skin, dag, weights, joints)
    return skin
```

把这段追加到 `chain_skin_utils.py`，然后在 Maya 里调用。

在 Maya 里：

```python
import importlib
importlib.reload(chain_skin_utils)

skin = chain_skin_utils.bind_chain_skin_minimal("body", "root")
print(skin)
```

> 这个最小版本为了讲清楚主流程，暂时没有处理旧蒙皮和 Undo。正式版用第 7 课的 `bind_chain_skin()`。

然后：

```python
cmds.setAttr("mid.rotateZ", 30)
```

圆柱应该在中段平滑弯曲，而不是整根跟着转，也不是关节处裂开。

### 8.6 检查权重

```python
skin = "skinCluster1"

print(cmds.getAttr(skin + ".weightList[0].weights"))
print(cmds.skinCluster(skin, q=True, influence=True))
```

你应该看到类似：

```text
[1.0, 0.0, 0.0]
```

或者关节附近：

```text
[0.5, 0.5, 0.0]
```

### 8.7 常见错误

| 现象 | 原因 |
|---|---|
| 网格完全不动 | 没有创建 skinCluster，或 dag 传错 |
| 权重写到了错误的关节 | influence 顺序没有对齐 |
| 一弯就炸 | 权重行和不为 1，或绑定姿势不对 |
| `setWeights` 报长度错误 | 权重数组长度不是 `顶点数 × 影响数` |
| 写入后权重没变 | 写到了旧的 skinCluster，或没有刷新 |

### 8.8 本课验收

- [ ] 圆柱在弯 `mid` 时平滑变形；
- [ ] `weightList` 里的行和 ≈ 1；
- [ ] 一次 `Ctrl+Z` 能撤销绑定（如果外层有 Undo Chunk）。

---

## 9. 第 6 课：平滑、限制与收尾

### 9.1 目标

在写回之前做三步：

1. 平滑：去掉最近骨段切换产生的轻微硬边；
2. 限制：每行最多 4 个非零；
3. 兜底与归一化：保证没有零行。

### 9.2 顺序

```text
计算初值
  → 平滑
  → 限制影响数
  → 未加权兜底
  → 归一化
  → 写回
```

不要反过来：

- 先限制再平滑，会把剪掉的影响又扩散回来；
- 先归一化再限制，行和会再次被破坏；
- 兜底必须放在限制之后，否则补出来的权重可能超过 4 个影响。

### 9.3 平滑

```python
def build_vertex_neighbors(dag):
    neighbors = []
    iterator = om.MItMeshVertex(dag)

    while not iterator.isDone():
        neighbors.append(list(iterator.getConnectedVertices()))
        iterator.next()

    return neighbors


def smooth_weights(weights, neighbors, strength=0.5, iterations=1):
    result = weights.copy()

    for _ in range(iterations):
        average = np.zeros_like(result)
        has_neighbor = np.zeros(len(result), dtype=bool)

        for index, adjacent in enumerate(neighbors):
            if not adjacent:
                continue
            average[index] = result[adjacent].mean(axis=0)
            has_neighbor[index] = True

        result[has_neighbor] = (
            (1.0 - strength) * result[has_neighbor]
            + strength * average[has_neighbor]
        )
        result = normalize_weights(result)

    return result
```

这是拉普拉斯平滑：每个顶点向邻居的平均权重靠拢。

- `strength=0.5`、`iterations=1` 是温和的默认值；
- 迭代次数多了会把关节“化开”，体积感消失；
- 只平滑选中区域的高级版本，需要额外的 mask，这里先不做。

### 9.4 限制影响数

```python
def limit_influences(weights, max_influences=4, threshold=1e-4):
    result = weights.copy()

    for row in result:
        if row.max() <= 0:
            continue

        keep_count = min(max_influences, len(row))
        keep = np.argpartition(row, -keep_count)[-keep_count:]

        mask = np.ones(len(row), dtype=bool)
        mask[keep] = False
        row[mask] = 0.0
        row[row < threshold] = 0.0

        total = row.sum()
        if total > 1e-8:
            row /= total

    return result
```

### 9.5 未加权兜底

```python
def fix_unweighted(weights, points, joint_positions):
    result = weights.copy()
    missing = np.where(result.sum(axis=1) < 1e-8)[0]

    if len(missing):
        distances = np.linalg.norm(
            points[missing][:, None, :] - joint_positions[None, :, :],
            axis=2,
        )
        result[missing, distances.argmin(axis=1)] = 1.0

    return result
```

没有这一步，某些顶点会因为权重全被剪掉而塌到原点。

### 9.6 验证

```python
weights = chain_skin_utils.smooth_weights(
    weights,
    chain_skin_utils.build_vertex_neighbors(dag),
    strength=0.5,
    iterations=1,
)
weights = chain_skin_utils.limit_influences(weights, max_influences=4)
weights = chain_skin_utils.fix_unweighted(weights, points, positions)
weights = chain_skin_utils.normalize_weights(weights)
```

检查：

```python
print("max influences:", (weights > 1e-6).sum(axis=1).max())
print("min row sum:", weights.sum(axis=1).min())
print("max row sum:", weights.sum(axis=1).max())
```

预期：

```text
max influences: 4
min row sum: 1.0
max row sum: 1.0
```

### 9.7 常见错误

| 现象 | 原因 |
|---|---|
| 最大影响数还是超过 4 | 限制之后又做了平滑 |
| 关节变得很软 | 平滑次数太多，或 `strength` 太高 |
| 有顶点塌到原点 | 没有做 `fix_unweighted` |
| 行和不为 1 | 限制后没有重新归一化 |

### 9.8 本课验收

- [ ] 最大影响数 ≤ 4；
- [ ] 最小行和 ≈ 1；
- [ ] 没有未加权顶点；
- [ ] 弯关节时没有明显硬边。

---

## 10. 第 7 课：封装一键入口

### 10.1 目标

把前面所有步骤收进一个函数，并满足：

- 一次调用完成；
- 一个 Undo Chunk；
- 支持替换已有蒙皮；
- 返回统计信息。

### 10.2 先处理已有蒙皮

替换蒙皮时，必须在**读取顶点之前**删除旧蒙皮，否则读到的是被旧蒙皮变形后的顶点。

正确顺序：

```text
验证网格和关节
  → 打开 Undo Chunk
  → 如果有旧蒙皮且允许替换：删除
  → 读取顶点坐标
  → 创建新 skinCluster
  → 算权重
  → 后处理
  → 写回
  → 关闭 Undo Chunk
```

### 10.3 代码

```python
def bind_chain_skin(
    mesh,
    root_joint,
    smooth_iterations=1,
    smooth_strength=0.5,
    max_influences=4,
    blend_start=0.5,
    name=None,
    replace=True,
):
    dag = get_shape_dag_path(mesh)
    joints = collect_chain_joints(root_joint)

    if not joints:
        raise RuntimeError("没有可用关节。")

    existing = find_skin_cluster(mesh)

    if existing and not replace:
        raise RuntimeError("网格已有 SkinCluster：{}".format(existing))

    cmds.undoInfo(openChunk=True, chunkName="MuziChainSkin")

    try:
        if existing:
            cmds.delete(existing)

        points = get_mesh_points(dag)
        positions = get_joint_positions(joints)

        skin = create_skin_cluster(
            mesh,
            joints,
            max_influences=max_influences,
            name=name,
            replace=False,
        )

        weights = compute_chain_weights(
            points,
            positions,
            build_segments(joints),
            blend_start=blend_start,
        )

        if smooth_iterations > 0:
            weights = smooth_weights(
                weights,
                build_vertex_neighbors(dag),
                strength=smooth_strength,
                iterations=smooth_iterations,
            )

        weights = limit_influences(weights, max_influences)
        weights = fix_unweighted(weights, points, positions)
        weights = normalize_weights(weights)

        write_weights(skin, dag, weights, joints)

    finally:
        cmds.undoInfo(closeChunk=True)

    nonzero = (weights > 1e-6).sum(axis=1)

    return {
        "skin_cluster": skin,
        "joints": joints,
        "vertex_count": int(weights.shape[0]),
        "average_influences": float(nonzero.mean()),
        "max_influences": int(nonzero.max()),
        "unweighted_vertices": int((weights.sum(axis=1) < 1e-8).sum()),
    }
```

### 10.4 选择辅助

```python
def get_selection_mesh_and_root():
    selection = cmds.ls(selection=True, long=True) or []

    meshes = []
    joints = []

    for node in selection:
        if cmds.nodeType(node) == "joint":
            joints.append(node)
            continue

        if cmds.nodeType(node) == "mesh":
            meshes.append(node)
            continue

        shapes = cmds.listRelatives(
            node,
            shapes=True,
            noIntermediate=True,
            fullPath=True,
        ) or []

        if shapes:
            meshes.append(node)

    if len(meshes) != 1 or not joints:
        raise RuntimeError("请选择一个网格和至少一个关节。")

    root = min(joints, key=lambda joint: joint.count("|"))

    for joint in joints:
        if joint == root:
            continue
        if not joint.startswith(root + "|"):
            raise RuntimeError("选中的关节不在同一条链上。")

    return meshes[0], root
```

### 10.5 Geodesic Voxel 模式

```python
def bind_chain_geodesic(
    mesh,
    root_joint,
    max_influences=4,
    falloff=0.5,
    replace=True,
):
    joints = collect_chain_joints(root_joint)

    if not joints:
        raise RuntimeError("没有可用关节。")

    existing = find_skin_cluster(mesh)

    if existing and not replace:
        raise RuntimeError("网格已有 SkinCluster：{}".format(existing))

    cmds.undoInfo(openChunk=True, chunkName="MuziChainSkinGeodesic")

    try:
        if existing:
            cmds.delete(existing)

        skin = cmds.skinCluster(
            *(joints + [mesh]),
            toSelectedBones=True,
            bindMethod=3,
            normalizeWeights=2,
            maximumInfluences=max_influences,
        )[0]

        cmds.geomBind(
            skin,
            bindMethod=3,
            falloff=falloff,
            maxInfluences=max_influences,
        )

    finally:
        cmds.undoInfo(closeChunk=True)

    return skin
```

注意：

- `bindMethod=3` 只是创建骨架；
- 真正的权重由 `geomBind` 计算；
- `geomBind` 走 GPU，**batch 模式不支持**；
- 在无头环境里要做 fallback，捕获异常后回退到距离法。

### 10.6 验证

选中网格和根关节：

```python
from muziRigTool.core.deformation import chain_skin_utils

mesh, root = chain_skin_utils.get_selection_mesh_and_root()
result = chain_skin_utils.bind_chain_skin(mesh, root)

print(result)
```

预期：

```text
{'skin_cluster': 'skinCluster1', 'joints': [...], 'vertex_count': ..., 'average_influences': 2.0, 'max_influences': 4, 'unweighted_vertices': 0}
```

然后：

```python
cmds.setAttr("mid.rotateZ", 30)
```

检查形变，再 `Ctrl+Z` 撤销一次，确认蒙皮消失。

### 10.7 本课验收

- [ ] 一次调用完成绑定；
- [ ] 返回统计字典；
- [ ] 一次 Undo 完整回退；
- [ ] 替换旧蒙皮时没有读到变形后的顶点；
- [ ] 不选网格或根关节时报错清晰。

---

## 11. 第 8 课：UI 面板

### 11.1 目标

做一个常驻面板，让用户不用记 Python 命令。

### 11.2 代码

写入 `tools/skin/chain_skin_tool.py`：

```python
# coding=utf-8
"""Chain Skin Tool：一键链式蒙皮面板。"""

from __future__ import print_function

import maya.cmds as cmds

try:
    from PySide2.QtWidgets import (
        QCheckBox,
        QComboBox,
        QDoubleSpinBox,
        QGridLayout,
        QLabel,
        QPushButton,
        QSpinBox,
        QVBoxLayout,
        QWidget,
    )
except ImportError:
    from PySide6.QtWidgets import (
        QCheckBox,
        QComboBox,
        QDoubleSpinBox,
        QGridLayout,
        QLabel,
        QPushButton,
        QSpinBox,
        QVBoxLayout,
        QWidget,
    )

from ...core.deformation import chain_skin_utils
from ...ui import theme
from ...ui import window_utils


class ChainSkinTool(QWidget):
    """链式蒙皮工具窗口。"""

    def __init__(self, parent=None):
        super(ChainSkinTool, self).__init__(parent)

        self.create_widgets()
        self.create_layouts()
        self.create_connections()

        theme.style_window(
            self,
            title=u"Chain Skin Tool",
            minimum_width=440,
        )
        self.resize(480, 380)

    def create_widgets(self):
        self.title_label = theme.make_title(u"Chain Skin Tool")
        self.subtitle_label = theme.make_subtitle(
            u"选择网格和根关节，一键生成链式蒙皮。"
        )

        self.method_combo = QComboBox()
        self.method_combo.addItem(u"距离权重（快速 / 兼容）", "distance")
        self.method_combo.addItem(u"Geodesic Voxel（质量）", "geodesic")

        self.smooth_spin = QSpinBox()
        self.smooth_spin.setRange(0, 10)
        self.smooth_spin.setValue(1)

        self.max_influence_spin = QSpinBox()
        self.max_influence_spin.setRange(1, 8)
        self.max_influence_spin.setValue(4)

        self.blend_spin = QDoubleSpinBox()
        self.blend_spin.setRange(0.0, 0.95)
        self.blend_spin.setSingleStep(0.05)
        self.blend_spin.setValue(0.5)

        self.replace_check = QCheckBox(u"替换已有蒙皮")
        self.replace_check.setChecked(True)

        self.run_button = QPushButton(u"一键链式蒙皮")
        theme.style_primary(self.run_button)

        self.status_label = QLabel(u"请选择网格和根关节。")
        theme.set_role(self.status_label, "muted")

    def create_layouts(self):
        main_layout = QVBoxLayout(self)
        main_layout.setContentsMargins(16, 16, 16, 16)
        main_layout.setSpacing(12)

        main_layout.addWidget(self.title_label)
        main_layout.addWidget(self.subtitle_label)

        card, card_layout = theme.make_card(self)
        card_layout.addWidget(theme.make_section_title(u"选项"))

        grid = QGridLayout()
        grid.setHorizontalSpacing(8)
        grid.setVerticalSpacing(8)

        grid.addWidget(QLabel(u"模式"), 0, 0)
        grid.addWidget(self.method_combo, 0, 1)
        grid.addWidget(QLabel(u"平滑次数"), 1, 0)
        grid.addWidget(self.smooth_spin, 1, 1)
        grid.addWidget(QLabel(u"最大影响数"), 2, 0)
        grid.addWidget(self.max_influence_spin, 2, 1)
        grid.addWidget(QLabel(u"混合起点"), 3, 0)
        grid.addWidget(self.blend_spin, 3, 1)

        card_layout.addLayout(grid)
        card_layout.addWidget(self.replace_check)
        card_layout.addWidget(self.run_button)

        main_layout.addWidget(card)
        main_layout.addWidget(self.status_label)
        main_layout.addStretch(1)

    def create_connections(self):
        self.run_button.clicked.connect(self.run)

    def run(self):
        try:
            mesh, root = chain_skin_utils.get_selection_mesh_and_root()
            replace = self.replace_check.isChecked()

            if self.method_combo.currentData() == "geodesic":
                chain_skin_utils.bind_chain_geodesic(
                    mesh,
                    root,
                    max_influences=self.max_influence_spin.value(),
                    replace=replace,
                )
                self.status_label.setText(
                    u"已完成测地体素绑定：{}".format(mesh)
                )
                return

            result = chain_skin_utils.bind_chain_skin(
                mesh,
                root,
                smooth_iterations=self.smooth_spin.value(),
                max_influences=self.max_influence_spin.value(),
                blend_start=self.blend_spin.value(),
                replace=replace,
            )

            self.status_label.setText(
                u"完成：{} 个关节，平均影响 {:.2f}，未加权 {} 个顶点".format(
                    len(result["joints"]),
                    result["average_influences"],
                    result["unweighted_vertices"],
                )
            )
        except Exception as error:
            cmds.warning(str(error))
            self.status_label.setText(u"失败：{}".format(error))


def main():
    return window_utils.show_window(
        "tools.skin.chain_skin_tool",
        ChainSkinTool,
    )


__all__ = [
    "ChainSkinTool",
    "main",
]
```

### 11.3 注册显示名

工具会被 `tools/__init__.py` 自动发现，不需要改注册表；但 `app/toolbox_catalog.py` 里没有显示名时，工具箱会显示模块名。

打开 `app/toolbox_catalog.py`，在 `tool_display_names` 和 `tool_descriptions` 里各加一行：

```python
tool_display_names["chain_skin_tool"] = u"链式蒙皮"
```

```python
tool_descriptions["chain_skin_tool"] = (
    u"选中网格与根关节，一键生成链式蒙皮权重。"
)
```

### 11.4 打开工具

```python
from muziRigTool.tools.skin import chain_skin_tool

window = chain_skin_tool.main()
```

或者直接：

```python
import muziRigTool
muziRigTool.show()
```

然后在主工具箱的“蒙皮工具”分类里找到“链式蒙皮”。

### 11.5 本课验收

- [ ] 面板能打开，只有单实例；
- [ ] 选中网格和根关节后，点按钮能完成绑定；
- [ ] 状态栏显示关节数、平均影响、未加权点数；
- [ ] 选错对象时显示清晰错误，不崩溃；
- [ ] Geodesic 模式能跑通（GPU 环境）。

---

## 12. 第 9 课：测试与验收

### 12.1 目标

用自动化测试锁住三件事：

1. 每行权重和 = 1；
2. 每行非零数 ≤ 4；
3. 没有未加权顶点；
4. 一次 Undo 能移除蒙皮。

### 12.2 Maya smoke test

写入 `tests/chain_skin_maya_smoke_test.py`：

```python
# coding=utf-8
"""Chain Skin Maya Smoke Test"""

from __future__ import print_function

import numpy as np
import maya.cmds as cmds
from maya.api import OpenMaya as om
from maya.api import OpenMayaAnim as oma

from muziRigTool.core.deformation import chain_skin_utils


def _as_node(name):
    selection = om.MSelectionList()
    selection.add(name)
    return selection.getDependNode(0)


def read_weights(skin_cluster, mesh):
    selection = om.MSelectionList()
    selection.add(mesh)
    dag = selection.getDagPath(0)

    if dag.node().apiType() == om.MFn.kTransform:
        dag.extendToShape()

    skin_fn = oma.MFnSkinCluster(_as_node(skin_cluster))

    component_fn = om.MFnSingleIndexedComponent()
    component = component_fn.create(om.MFn.kMeshVertComponent)
    component_fn.addElements(
        list(range(om.MFnMesh(dag).numVertices))
    )

    weights, influence_count = skin_fn.getWeights(dag, component)
    return np.array(list(weights), dtype=np.float64).reshape(
        -1, influence_count
    )


def build_scene():
    cmds.file(new=True, force=True)

    cmds.polyCylinder(
        r=1, h=10,
        sx=20, sy=20, sz=5,
        name="body",
    )

    cmds.select(clear=True)
    cmds.joint(p=(0, -5, 0), name="root")
    cmds.joint(p=(0, 0, 0), name="mid")
    cmds.joint(p=(0, 5, 0), name="tip")


def run():
    build_scene()

    result = chain_skin_utils.bind_chain_skin("body", "root")
    weights = read_weights(result["skin_cluster"], "body")

    row_sums = weights.sum(axis=1)

    if np.abs(row_sums - 1.0).max() > 1e-6:
        raise AssertionError("权重行和不为 1")

    nonzero = (weights > 1e-6).sum(axis=1)

    if nonzero.max() > 4:
        raise AssertionError("最大影响数超过 4")

    if result["unweighted_vertices"] != 0:
        raise AssertionError("存在未加权顶点")

    skin = result["skin_cluster"]

    cmds.undo()

    if cmds.objExists(skin):
        raise AssertionError("Undo 没有移除 SkinCluster")

    print("Chain Skin Maya Smoke Test: PASS")


if __name__ == "__main__":
    run()
```

运行：

```python
import sys
sys.path.append(r"C:\Users\X\Documents\maya\scripts")

from muziRigTool.tests import chain_skin_maya_smoke_test

chain_skin_maya_smoke_test.run()
```

预期：

```text
Chain Skin Maya Smoke Test: PASS
```

### 12.3 仓库静态门禁

这个项目的 CI 会检查：

- `tools / systems / ui` 里不能直接调用 `cmds.undoInfo`；
- `tools / systems / ui` 里不能重新实现 `validate_node`、`get_long_name` 这类通用 Helper；
- `core` 不能反向 import 上层。

所以：

- Undo 放在 core 的 `bind_chain_skin()` 里；
- UI 不写 `cmds.undoInfo`；
- UI 不复制 core 的算法。

### 12.4 可选：把纯数学拆出来

如果你想让算法在普通 Python 里也能测，可以把下面这些函数拆到 `core/deformation/chain_skin_math.py`：

- `_distance_to_segment`
- `compute_chain_weights`
- `normalize_weights`
- `limit_influences`
- `smooth_weights`

它们不 import Maya，只用 NumPy。这样 CI 不启动 Maya 也能跑单元测试。

### 12.5 本课验收

- [ ] smoke test 输出 PASS；
- [ ] 手动改坏一处（例如去掉归一化），测试能失败；
- [ ] 静态门禁没有新增违规。

---

## 13. 第 10 课：排错、性能与生产化

### 13.1 常见问题速查

| 现象 | 优先检查 |
|---|---|
| 绑定后网格完全不动 | `skinCluster` 是否创建成功；`dag` 是否是 mesh shape |
| 弯关节时整根骨头一起转 | 中段权重是否被错误地分给了子关节；检查 `blend_start` |
| 关节处裂开 | 平滑是否执行；`blend_start` 是否太大；顶点是否命中不同骨段 |
| 跨肢体吸权重 | 距离法的固有局限；改用 Geodesic Voxel |
| 权重写错关节 | `influenceObjects()` 顺序与传入关节顺序是否对齐 |
| 最大影响数超过 4 | 限制之后是否又做了平滑 |
| 有顶点塌到原点 | 是否执行 `fix_unweighted` |
| `geomBind` 报错 | 是否在 batch 模式；是否没有 GPU |
| Undo 只回退一半 | Undo Chunk 是否成对打开/关闭 |
| 绑定后模型变成绑定姿势 | 绑定前链条不在 rest pose |
| 改了代码但 Maya 没反应 | 没有 `importlib.reload(chain_skin_utils)` |

### 13.2 关于 Bind Pose

`cmds.skinCluster` 用**当前 pose** 作为 bind pose。

所以绑定前要确保：

- 链条在 T-pose / A-pose / rest pose；
- 没有临时 pose 残留；
- 如果刚从动画帧回来，先把关节归零或回到 rest。

否则后面摆 pose 时，模型会“带着绑定姿势”跑。

### 13.3 性能

这份实现的时间复杂度是：

```text
O(顶点数 × 骨段数)
```

对几万顶点、几十根关节，NumPy 通常够快。真正慢的地方往往是：

- 逐顶点 `cmds.skinPercent`；
- 逐顶点 `setAttr`；
- 每次滑杆都重读整个网格；
- 在 Python 循环里做百万级运算。

优化顺序：

1. 读写都用 `MFnSkinCluster` 批量接口；
2. 权重矩阵用 NumPy；
3. 只重算脏区域；
4. 批量操作时 `cmds.refresh(suspend=True)`；
5. 长操作加 `cmds.progressWindow`；
6. 不要在 `QThread` 里调用 Maya API。

### 13.4 多 shape、实例、Reference

| 情况 | 处理 |
|---|---|
| 一个 transform 下有多个 mesh shape | 逐个 shape 绑定，或先拆分 |
| 实例化 mesh | 共享 shape，改权重影响所有实例 |
| Referenced 节点 | 不能直接编辑，先检查 `referenceQuery` |
| 已有蒙皮 | 默认删除重建；生产环境建议先备份权重 |
| 有 BlendShape | 检查 deformer 顺序，skin 通常在 blendShape 之后 |

### 13.5 生产化清单

- [ ] 绑定前保存场景；
- [ ] 绑定前确认 rest pose；
- [ ] 已有蒙皮先备份；
- [ ] 绑定后检查未加权点；
- [ ] 检查最大影响数符合引擎限制；
- [ ] 检查左右对称（如果角色对称）；
- [ ] 用极限 pose 测试肩、肘、膝、胯；
- [ ] 确认一次 Undo 能回退；
- [ ] 确认保存重开后权重还在。

---

## 附录 A：完整 Core 代码

把下面完整内容保存为 `core/deformation/chain_skin_utils.py`。

```python
# coding=utf-8
"""chain_skin_utils：一键链式蒙皮。"""

from __future__ import print_function

import numpy as np
import maya.cmds as cmds
from maya.api import OpenMaya as om
from maya.api import OpenMayaAnim as oma

from ..common import hierarchy_utils
from ..common import scene_utils


# ---------------------------------------------------------------------------
# 基础
# ---------------------------------------------------------------------------

def _as_node(name):
    selection = om.MSelectionList()
    selection.add(name)
    return selection.getDependNode(0)


def _as_dag_path(name):
    selection = om.MSelectionList()
    selection.add(name)
    return selection.getDagPath(0)


def get_shape_dag_path(mesh):
    dag = _as_dag_path(mesh)

    if dag.node().apiType() == om.MFn.kTransform:
        dag.extendToShape()

    if dag.node().apiType() != om.MFn.kMesh:
        raise RuntimeError("不是 Polygon Mesh：{}".format(mesh))

    return dag


def find_skin_cluster(mesh):
    shapes = cmds.listRelatives(
        mesh,
        shapes=True,
        noIntermediate=True,
        fullPath=True,
    ) or []

    targets = shapes or [mesh]

    for shape in targets:
        for node in cmds.listHistory(shape) or []:
            if cmds.nodeType(node) == "skinCluster":
                return node

    return None


# ---------------------------------------------------------------------------
# 关节链
# ---------------------------------------------------------------------------

def collect_chain_joints(root_joint):
    scene_utils.validate_node(root_joint, u"根关节")
    root_joint = scene_utils.get_long_name(root_joint)

    if cmds.nodeType(root_joint) != "joint":
        raise RuntimeError("不是关节：{}".format(root_joint))

    return hierarchy_utils.get_child_object(root_joint, "joint")


def build_segments(joints):
    index_by_name = {
        name: index for index, name in enumerate(joints)
    }
    segments = []

    for child_index, child in enumerate(joints):
        parent = (
            cmds.listRelatives(child, parent=True, fullPath=True)
            or [None]
        )[0]

        while parent and parent not in index_by_name:
            parent = (
                cmds.listRelatives(parent, parent=True, fullPath=True)
                or [None]
            )[0]

        if parent in index_by_name:
            segments.append((index_by_name[parent], child_index))

    return segments


# ---------------------------------------------------------------------------
# 坐标
# ---------------------------------------------------------------------------

def get_joint_positions(joints):
    return np.array(
        [
            cmds.xform(joint, q=True, ws=True, t=True)
            for joint in joints
        ],
        dtype=np.float64,
    )


def get_mesh_points(dag):
    points = om.MFnMesh(dag).getPoints(om.MSpace.kWorld)
    return np.array(
        [[point.x, point.y, point.z] for point in points],
        dtype=np.float64,
    )


# ---------------------------------------------------------------------------
# 数学
# ---------------------------------------------------------------------------

def _distance_to_segment(points, start, end):
    direction = end - start
    length_sq = float(np.dot(direction, direction))

    if length_sq < 1e-12:
        return (
            np.linalg.norm(points - start, axis=1),
            np.zeros(len(points)),
        )

    t = np.clip(
        ((points - start) @ direction) / length_sq,
        0.0,
        1.0,
    )
    closest = start + t[:, None] * direction
    return np.linalg.norm(points - closest, axis=1), t


def compute_chain_weights(points, joint_positions, segments, blend_start=0.5):
    vertex_count = len(points)
    joint_count = len(joint_positions)
    weights = np.zeros((vertex_count, joint_count), dtype=np.float64)

    if not segments:
        weights[:, 0] = 1.0
        return weights

    best_distance = np.full(vertex_count, np.inf)
    best_segment = np.full(vertex_count, -1, dtype=np.int32)
    best_t = np.zeros(vertex_count)

    for segment_index, (parent_index, child_index) in enumerate(segments):
        distance, t = _distance_to_segment(
            points,
            joint_positions[parent_index],
            joint_positions[child_index],
        )

        closer = distance < best_distance
        best_distance[closer] = distance[closer]
        best_segment[closer] = segment_index
        best_t[closer] = t[closer]

    for segment_index, (parent_index, child_index) in enumerate(segments):
        mask = best_segment == segment_index
        if not np.any(mask):
            continue

        t = best_t[mask]
        blend = np.clip(
            (t - blend_start) / max(1e-8, 1.0 - blend_start),
            0.0,
            1.0,
        )
        blend = blend * blend * (3.0 - 2.0 * blend)

        weights[mask, parent_index] = 1.0 - blend
        weights[mask, child_index] = blend

    missing = np.where(best_segment < 0)[0]

    if len(missing):
        distances = np.linalg.norm(
            points[missing][:, None, :] - joint_positions[None, :, :],
            axis=2,
        )
        weights[missing, distances.argmin(axis=1)] = 1.0

    return weights


def normalize_weights(weights):
    result = weights.copy()
    sums = result.sum(axis=1, keepdims=True)
    result /= np.where(sums < 1e-8, 1.0, sums)
    return result


def limit_influences(weights, max_influences=4, threshold=1e-4):
    result = weights.copy()

    for row in result:
        if row.max() <= 0:
            continue

        keep_count = min(max_influences, len(row))
        keep = np.argpartition(row, -keep_count)[-keep_count:]

        mask = np.ones(len(row), dtype=bool)
        mask[keep] = False
        row[mask] = 0.0
        row[row < threshold] = 0.0

        total = row.sum()

        if total > 1e-8:
            row /= total

    return result


def build_vertex_neighbors(dag):
    neighbors = []
    iterator = om.MItMeshVertex(dag)

    while not iterator.isDone():
        neighbors.append(list(iterator.getConnectedVertices()))
        iterator.next()

    return neighbors


def smooth_weights(weights, neighbors, strength=0.5, iterations=1):
    result = weights.copy()

    for _ in range(iterations):
        average = np.zeros_like(result)
        has_neighbor = np.zeros(len(result), dtype=bool)

        for index, adjacent in enumerate(neighbors):
            if not adjacent:
                continue
            average[index] = result[adjacent].mean(axis=0)
            has_neighbor[index] = True

        result[has_neighbor] = (
            (1.0 - strength) * result[has_neighbor]
            + strength * average[has_neighbor]
        )
        result = normalize_weights(result)

    return result


def fix_unweighted(weights, points, joint_positions):
    result = weights.copy()
    missing = np.where(result.sum(axis=1) < 1e-8)[0]

    if len(missing):
        distances = np.linalg.norm(
            points[missing][:, None, :] - joint_positions[None, :, :],
            axis=2,
        )
        result[missing, distances.argmin(axis=1)] = 1.0

    return result


# ---------------------------------------------------------------------------
# skinCluster
# ---------------------------------------------------------------------------

def create_skin_cluster(mesh, joints, max_influences=4, name=None, replace=True):
    existing = find_skin_cluster(mesh)

    if existing:
        if not replace:
            raise RuntimeError("网格已有 SkinCluster：{}".format(existing))
        cmds.delete(existing)

    kwargs = {}

    if name:
        kwargs["name"] = name

    return cmds.skinCluster(
        *(joints + [mesh]),
        toSelectedBones=True,
        bindMethod=0,
        normalizeWeights=2,
        maximumInfluences=max_influences,
        obeyMaxInfluences=True,
        **kwargs
    )[0]


def write_weights(skin_cluster, dag, weights, joints):
    skin_fn = oma.MFnSkinCluster(_as_node(skin_cluster))
    influence_paths = skin_fn.influenceObjects()
    influence_count = len(influence_paths)

    column_by_joint = {
        path.fullPathName(): column
        for column, path in enumerate(influence_paths)
    }

    ordered = np.zeros(
        (weights.shape[0], influence_count),
        dtype=np.float64,
    )

    for joint_index, joint in enumerate(joints):
        column = column_by_joint.get(joint)

        if column is None:
            raise RuntimeError("SkinCluster 缺少影响：{}".format(joint))

        ordered[:, column] = weights[:, joint_index]

    component_fn = om.MFnSingleIndexedComponent()
    component = component_fn.create(om.MFn.kMeshVertComponent)
    component_fn.addElements(list(range(weights.shape[0])))

    skin_fn.setWeights(
        dag,
        component,
        om.MIntArray(list(range(influence_count))),
        om.MDoubleArray(ordered.ravel().tolist()),
        normalize=False,
    )


# ---------------------------------------------------------------------------
# 入口
# ---------------------------------------------------------------------------

def bind_chain_skin(
    mesh,
    root_joint,
    smooth_iterations=1,
    smooth_strength=0.5,
    max_influences=4,
    blend_start=0.5,
    name=None,
    replace=True,
):
    dag = get_shape_dag_path(mesh)
    joints = collect_chain_joints(root_joint)

    if not joints:
        raise RuntimeError("没有可用关节。")

    existing = find_skin_cluster(mesh)

    if existing and not replace:
        raise RuntimeError("网格已有 SkinCluster：{}".format(existing))

    cmds.undoInfo(openChunk=True, chunkName="MuziChainSkin")

    try:
        if existing:
            cmds.delete(existing)

        points = get_mesh_points(dag)
        positions = get_joint_positions(joints)

        skin = create_skin_cluster(
            mesh,
            joints,
            max_influences=max_influences,
            name=name,
            replace=False,
        )

        weights = compute_chain_weights(
            points,
            positions,
            build_segments(joints),
            blend_start=blend_start,
        )

        if smooth_iterations > 0:
            weights = smooth_weights(
                weights,
                build_vertex_neighbors(dag),
                strength=smooth_strength,
                iterations=smooth_iterations,
            )

        weights = limit_influences(weights, max_influences)
        weights = fix_unweighted(weights, points, positions)
        weights = normalize_weights(weights)

        write_weights(skin, dag, weights, joints)

    finally:
        cmds.undoInfo(closeChunk=True)

    nonzero = (weights > 1e-6).sum(axis=1)

    return {
        "skin_cluster": skin,
        "joints": joints,
        "vertex_count": int(weights.shape[0]),
        "average_influences": float(nonzero.mean()),
        "max_influences": int(nonzero.max()),
        "unweighted_vertices": int(
            (weights.sum(axis=1) < 1e-8).sum()
        ),
    }


def bind_chain_geodesic(
    mesh,
    root_joint,
    max_influences=4,
    falloff=0.5,
    replace=True,
):
    joints = collect_chain_joints(root_joint)

    if not joints:
        raise RuntimeError("没有可用关节。")

    existing = find_skin_cluster(mesh)

    if existing and not replace:
        raise RuntimeError("网格已有 SkinCluster：{}".format(existing))

    cmds.undoInfo(openChunk=True, chunkName="MuziChainSkinGeodesic")

    try:
        if existing:
            cmds.delete(existing)

        skin = cmds.skinCluster(
            *(joints + [mesh]),
            toSelectedBones=True,
            bindMethod=3,
            normalizeWeights=2,
            maximumInfluences=max_influences,
        )[0]

        cmds.geomBind(
            skin,
            bindMethod=3,
            falloff=falloff,
            maxInfluences=max_influences,
        )

    finally:
        cmds.undoInfo(closeChunk=True)

    return skin


def get_selection_mesh_and_root():
    selection = cmds.ls(selection=True, long=True) or []

    meshes = []
    joints = []

    for node in selection:
        if cmds.nodeType(node) == "joint":
            joints.append(node)
            continue

        if cmds.nodeType(node) == "mesh":
            meshes.append(node)
            continue

        shapes = cmds.listRelatives(
            node,
            shapes=True,
            noIntermediate=True,
            fullPath=True,
        ) or []

        if shapes:
            meshes.append(node)

    if len(meshes) != 1 or not joints:
        raise RuntimeError("请选择一个网格和至少一个关节。")

    root = min(joints, key=lambda joint: joint.count("|"))

    for joint in joints:
        if joint == root:
            continue
        if not joint.startswith(root + "|"):
            raise RuntimeError("选中的关节不在同一条链上。")

    return meshes[0], root


__all__ = [
    "bind_chain_geodesic",
    "bind_chain_skin",
    "build_segments",
    "build_vertex_neighbors",
    "collect_chain_joints",
    "compute_chain_weights",
    "create_skin_cluster",
    "find_skin_cluster",
    "fix_unweighted",
    "get_joint_positions",
    "get_mesh_points",
    "get_selection_mesh_and_root",
    "get_shape_dag_path",
    "limit_influences",
    "normalize_weights",
    "smooth_weights",
    "write_weights",
]
```

---

## 附录 B：API 速查

### B.1 常用命令

| 命令 | 用途 |
|---|---|
| `cmds.skinCluster(joints, mesh, bindMethod=0, ...)` | 创建蒙皮 |
| `cmds.geomBind(skin, bindMethod=3, falloff=0.5, maxInfluences=4)` | 测地体素权重 |
| `cmds.listRelatives(joint, children=True, type="joint", fullPath=True)` | 取子关节 |
| `cmds.xform(joint, q=True, ws=True, t=True)` | 关节世界坐标 |
| `cmds.listHistory(shape)` | 查 skinCluster |
| `cmds.skinCluster(skin, q=True, influence=True)` | 查询影响列表 |
| `cmds.getAttr(skin + ".weightList[0].weights")` | 查询某顶点权重 |

### B.2 skinCluster 关键属性

| 属性 | 含义 |
|---|---|
| `weightList[v].weights[i]` | 顶点 v、影响 i 的权重 |
| `matrix[i]` | 影响 i 的当前世界矩阵 |
| `bindPreMatrix[i]` | 影响 i 的逆绑定矩阵 |
| `bindMethod` | 0 最近距离 / 1 层级最近距离 / 2 Heat Map |
| `normalizeWeights` | None / Interactive / Post |
| `maxInfluences` | 最大影响数 |
| `maintainMaxInfluences` | 编辑时持续强制 |
| `skinningMethod` | 0 LBS / 1 DQ / 2 混合 |
| `geomBind` | 指向 geomBind 节点（测地体素） |

### B.3 MFnSkinCluster

| 方法 | 用途 |
|---|---|
| `influenceObjects()` | 影响列表，顺序就是列顺序 |
| `getWeights(dag, components)` | 返回 `(MDoubleArray, 影响数)` |
| `getWeights(dag, components, influence)` | 单个影响的权重 |
| `setWeights(dag, components, influences, weights, normalize=False)` | 批量写 |
| `setWeights(dag, components, influence, value, normalize=True)` | 单影响写（滑杆） |
| `indexForInfluenceObject(obj)` | 查影响索引 |

### B.4 坐标与组件

| 类型 | 用途 |
|---|---|
| `MFnMesh.getPoints(om.MSpace.kWorld)` | 世界坐标顶点 |
| `MItMeshVertex.getConnectedVertices()` | 邻接顶点 |
| `MFnSingleIndexedComponent` | 构造顶点组件 |
| `MIntArray` / `MDoubleArray` | 传给 `setWeights` 的数组 |

---

## 附录 C：参考资料

### 官方文档

- [Maya skinCluster 命令](https://help.autodesk.com/cloudhelp/2023/CHS/Maya-Tech-Docs/CommandsPython/skinCluster.html)
- [Maya skinCluster 节点](https://help.autodesk.com/cloudhelp/2023/ENU/Maya-Tech-Docs/Nodes/skinCluster.html)
- [MFnSkinCluster API 2.0](https://help.autodesk.com/cloudhelp/2026/JPN/MAYA-API-REF/py_ref/class_open_maya_anim_1_1_m_fn_skin_cluster.html)
- [Maya geomBind 命令](https://help.autodesk.com/cloudhelp/2023/CHS/Maya-Tech-Docs/CommandsPython/geomBind.html)
- [Maya skinPercent 命令](https://help.autodesk.com/cloudhelp/2023/CHS/Maya-Tech-Docs/CommandsPython/skinPercent.html)
- [Maya copySkinWeights 命令](https://help.autodesk.com/cloudhelp/2023/CHS/Maya-Tech-Docs/CommandsPython/copySkinWeights.html)
- [Maya softSelect 命令](https://help.autodesk.com/cloudhelp/JPN/MayaCRE-Tech-Docs/CommandsPython/softSelect.html)

### 原理

- [Geodesic Voxel Binding 论文](https://dl.acm.org/doi/10.1145/2485895.2485919)
- [Lesterbanks 的测地体素介绍](https://lesterbanks.com/2014/06/geodesic-voxel-binding-maya/)
- [Bone Heat / Pinocchio 论文](https://people.csail.mit.edu/ibaran/papers/2007-SIGGRAPH-Pinocchio-Penalty.pdf)
- [Bounded Biharmonic Weights](https://www.cs.toronto.edu/~jacobson/weblog/1784.html)

### 开源项目

- [SkinPowerTool](https://github.com/Ryumo0205/SkinPowerTool)
- [Max Skinning Weight Tool](https://github.com/pgpreeth/max-skinning-weight-tool)
- [SIWeightEditor](https://github.com/ShikouYamaue/SIWeightEditor)
- [SkinPlusPlus](https://github.com/munkybutt/SkinPlusPlus)
- [Chad Vernon 的 cmt](https://github.com/chadmv/cmt)
- [mGear skin 模块](https://mgear4.readthedocs.io/en/dev-2-sphinx-auto-doc-setup/mgear/mgear.core.skin.html)
- [ngSkinTools API 文档](https://www.ngskintools.com/documentation/v2/api/set_weights/)

### 视频

- [Set Skin Weights Tool 原视频](https://www.bilibili.com/video/BV1V4411W7F9/)
- [实时分权重功能演示](https://www.bilibili.com/video/BV1RBGE6GEBt/)
- [批量自动匹配骨骼及权重](https://www.bilibili.com/video/BV1Se4y1N7no/)
- [ngSkinTools 中文教程](https://www.bilibili.com/video/BV1qHHkz9EXb/)
- [Chad Vernon 的 YouTube](https://www.youtube.com/user/chadmv)

---

## 附录 D：下一步可以加什么

按优先级：

1. **权重滑杆**：选中顶点，对当前 influence 做 replace / add / scale；
2. **权重表**：每个顶点的权重列表，支持排序和过滤；
3. **拷贝 / 粘贴 / 平均**：快照式 copy/paste；
4. **镜像**：`copySkinWeights` + `mirrorMode`；
5. **软选择临时绑定**：把权重场变成可见形变；
6. **权重颜色显示**：用顶点色或 `MPxDrawOverride`；
7. **对称与命名**：按 `lf/rt` 自动映射；
8. **性能优化**：纯数学模块 + NumPy 向量化 + 分块刷新。

---

*文档结束。*
