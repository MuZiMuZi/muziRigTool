# 编码与命名约定

> 本文件只记录**已确认**的约定。未确认的事项统一列在文末「待定清单」，不要在代码里先行实现。
> 约定一旦定版，按「闭包原则」只增不改；确需修改时先改本文件，再改代码。

---

## 1. 节点命名

### 1.1 五段式

```text
[type]_[side]_[part]_[function]_[index]
```

| 段 | 含义 | 取值 |
|---|---|---|
| `type` | 节点类型 | 开放，见 1.2 |
| `side` | 方向 | `lf` / `rt` / `md` |
| `part` | 部位 | 全小写，允许内部下划线，如 `upper_lid` |
| `function` | 用途 | 绑定类型 `fk` / `ik` / `ikfk`；节点角色 `bind` / `main` / `aim` / `sub`；组用途 `rig` / `geo` / `jnt` / `ctrl` / `crv` / `pos` / `world` |
| `index` | 序号 | 1 ~ 999，输出固定三位 |

**`function` 段是混合语义**：既装绑定类型，也装节点角色，还装组用途（见 1.7）。它回答的是「这个节点干什么用」，不区分这几类含义。

`function` 不设白名单，但**新增取值必须先写进本节再进代码**。当前已定版：绑定类型 `fk` / `ik` / `ikfk`；节点角色 `bind` / `main` / `aim` / `sub`；组用途 `rig` / `geo` / `jnt` / `ctrl` / `crv` / `pos` / `world`（`geo` 于 2026-11-16 加入）。

### 1.2 type 取值

不设白名单，只要求「单个 Token、非空、不含下划线」。常用值：

```text
绑定节点      bpjnt  jnt  ctrl  grp  crv  loc  geo
控制器层级    zero  driven  space  connect  offset  subctrl  output
```

控制器中间的动画控制层直接用 `ctrl`，所以 `ctrl` 同时出现在「绑定节点」和「控制器层级」里。

### 1.3 标准示例

```text
jnt_lf_hand_bind_001        蒙皮关节
bpjnt_lf_hand_fk_001        定位关节（FK）
ctrl_lf_hand_fk_001         FK 控制器
grp_lf_hand_fk_001          FK 控制器组
zero_lf_hand_fk_001         空间定位层（不做任何控制）
output_lf_hand_fk_001       输出层（放子物体）
```

### 1.4 反例

```text
jntLF_hand_001              驼峰混入
jnt_lf_handFK_001           类型与部位连写（旧文档写法，已废弃）
jnt_lf__bind_001            part 为空，出现双下划线
jnt_lf_hand_bind_1          index 未补零
jnt_lf_upper__lid_bind_001  part 内连续下划线
```

第一条 `jnt_lf_handFK_001` 是旧命名文档的写法。新项目统一改为分段，旧写法**不再兼容**。

### 1.5 复合部位

`part` 允许包含下划线，用于表达复合部位：

```text
upper_lid
mouth_corner
nose_center
```

禁止：

- 首尾下划线（`_lid`、`lid_`）
- 连续下划线（`upper__lid`）
- 空字符串

解析时 `part` 由「首段之后、倒数第二段之前」的所有段拼成，因此含下划线不会破坏解析。

### 1.6 左右镜像

```text
lf ↔ rt
md 不变
```

镜像只改 `side`，其余字段保持不变。

`side` 的输入接受 `lf` / `rt` / `md`，也接受 `left` / `right` / `middle` / `center`，内部统一归一化为 `lf` / `rt` / `md` 后再使用。**输出永远是三个短值之一。**

### 1.7 组与模型

`grp` 的 `function` 段表示「这个组里装什么」：

```text
grp_md_body_rig_001        这套 rig 的总根
grp_md_body_geo_001        模型组
grp_md_body_jnt_001        骨骼组
grp_md_body_ctrl_001       控制器组
```

角色层级固定为：

```text
grp_md_body_rig_001
├─ grp_md_body_geo_001
│   └─ geo_md_body_main_001
├─ grp_md_body_jnt_001
└─ grp_md_body_ctrl_001
```

- 总根的 `part` 用对象本身（`body` / `face` / `hair`），不用 `char` 这类笼统词。
- 脸、头发等单独拆分时各自有 `grp_md_face_rig_001`、`grp_md_hair_rig_001`。
- `geo` 既是模型节点的 `type`，也是模型组的 `function`（组里装的就是 geo），位置不同，不冲突。

承载权重的模型（蒙皮网格）按权重层级分成两类：

```text
geo_md_jeans_main_001      身体权重模型（权重刷给身体骨骼）
geo_md_jeans_sub_001       次级权重模型（权重刷给次级控制器）
```

| 段 | 取值 |
|---|---|
| `type` | `geo` |
| `side` | 整体用 `md`；左右分体才用 `lf` / `rt` |
| `part` | 部位本身，如 `body` / `face` / `jeans` / `hair` |
| `function` | `main` 身体权重，`sub` 次级权重；同一部位两块模型并存，不是二选一 |
| `index` | 同层级多块模型时递增，不用于表示左右 |

- 模型名只描述几何和权重层级，不写驱动它的控制器类型。
- `sub` 在两种 `type` 上都读作「次级」：`ctrl_..._sub_001` 是链式次级控制器，`geo_..._sub_001` 是次级权重模型，靠 `type` 段区分。
- `skinCluster` 名把 `type` 段换成 `skin`，其余四段照抄：`skin_md_jeans_sub_001`。
- 一旦选了 `main` / `sub` 区分，就不要再靠拆 `part`（如 `jeans_hip`、`jeans_knee`）来表达同一件事。

Maya 自动生成的 shape 后缀（`Shape`）不参与校验。

---

## 2. Python 编码规范

### 2.1 文件与模块

**全部小写**，snake_case，不允许任何大写字母：

```text
name_utils.py
chain_fk.py
eye_lid.py
bind_tool_main.py
```

目录名同样全小写：

```text
bpjnt/  module/  body/  face/  config/  ui/
```

资源文件一并适用：

```text
hand_fk.ma
hand_fk.json
hand_fk.ui
```

不出现 `chainFK.py`、`eyeLid.py`、`Bind_Tool_main.py` 这类混写。

理由：Windows / macOS 文件系统不区分大小写，Linux CI 区分。全小写可以避免「本地能跑、CI 报 ModuleNotFoundError」。

### 2.2 类

唯一保留大写的场合，PascalCase：

```text
Name
ChainFK
LimbIKFK
```

保持大写是为了和模块名（`chain_fk`）、函数调用（`chain_fk(...)`）区分开——读者一眼能看出「这是类型」还是「这是数值」。

### 2.3 函数与变量

```text
snake_case
compose_name
create_bpjnt
guide_count
```

不用 `type` 作参数名或属性名，避免遮蔽内置函数；命名场合统一用 `node_type`。

### 2.4 常量与配置

**全部用小写 snake_case**，不区分「常量」和「变量」——除类名外，标识符一律小写。

```python
label_side = {"md": 0, "lf": 1, "rt": 2}
side_list = ("lf", "rt", "md")
index_min = 1
index_max = 999
```

**优先放在使用它的类里，作为类属性。** 这样外部 import 一个类就能拿到全部配置和校验入口：

```python
class Name(object):
    side_list = ("lf", "rt", "md")
    index_min = 1
    index_max = 999
```

```python
Name.side_list
Name.check_side("left")
```

类属性同样小写——类名已经提供了命名空间，`Name.side_list` 读作「Name 的合法方向列表」，不需要再靠大写强调。

### 2.5 私有

内部实现加单下划线前缀：

```python
def _create_extra_bpjnt(self): ...
def _get_or_create_jnt(self): ...
```

---

## 3. Docstring

- 模块、类、公开函数必须有 docstring。
- 写「是什么、为什么、怎么用」，不写「这段代码在干嘛」。
- **禁止自动生成的模板句**，例如：

  ```text
  Args:
      type (object):
          当前方法执行 Maya / Rig 操作时使用的 type 数据。
  ```

  这句话没有信息量，属于噪音，宁可留空。

- 参数说明只在含义不明显时写。`index (int): 序号` 这种不需要解释的不写。

---

## 4. Import

顺序固定：

```text
标准库
第三方库（PySide2 等）
Maya（maya.cmds / maya.api）
本项目（相对 import）
```

分组之间空一行。

约束：

```text
core       不得 import systems / tools / app / ui
systems    不得 import app / tools
tools      不得 import app（window_manager 等能力应下沉到 ui）
```

---

## 5. 错误处理

| 场景 | 异常 | 消息要求 |
|---|---|---|
| 参数非法 | `ValueError` | 带字段名 + 实际收到的值 |
| 场景状态不满足（节点不存在、数量不对） | `RuntimeError` | 说清楚缺什么、期望多少 |
| 不应发生的内部矛盾 | 直接抛出，不吞 | — |

规则：

- 不写 `except Exception: pass`。
- 捕获后要转换异常时用 `from None`，避免日志里堆无意义的异常链。
- 错误消息用中文，格式统一为「什么问题，收到：实际值」。

---

## 6. 数据组织

模块的配置、名称表、参数表统一用 `dict` 存放，不写死成一堆同名成员函数。

```python
module_config = {
    "arm": {"guide_count": 3, "ctrl_shape": "circle", "axis": "X+"},
    "leg": {"guide_count": 3, "ctrl_shape": "circle", "axis": "X+"},
}
```

理由：增删条目只改数据，不改代码结构。

---

## 7. 开发原则

1. **闭包原则**：基础模块定版后只增加功能，不删改已有功能。
2. **结构调整先讨论**：涉及继承关系、目录结构、公开接口的改动，先确认再动手。
3. **文档跟随代码**：改行为的同时改文档，不允许文档长期领先或落后于实现。
4. **上层不复制下层**：`systems` 不重写 `core` 已有的能力。

---

## 待定清单

以下事项尚未确认，实现前需要先定：

1. `grpSpace` 在五段式全小写下的写法（`grpspace`？改名为 `spacegrp`？）。
2. 控制器 9 层结构是否全部保留（`zero` / `driven` / `space` / `connect` / `offset` / `ctrl` / `subctrl` / `output` / `grpSpace`）。
3. `index` 是否需要多段序号（如 `001_002` 表示两级）。
