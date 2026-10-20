# 系统架构

> 本文件描述**目标结构**。标 ✅ 的是已确认，标 ❓ 的是尚未定、实现前需要先确认。

---

## 1. 分层

```text
app                    Maya 入口、主窗口、Bind_Tool_main
 │
 ├──→ tools            绑定师直接使用的小工具
 │
 └──→ systems          绑定系统（本文件重点）
         │
         └──→ core     Maya 原语：命名、attr、jnt、ctrl、约束
```

`ui/` 是横切的公共界面层，被 `app / tools / systems` 使用。

依赖方向固定向下，禁止反向 import。

---

## 2. 系统目录 ✅

```text
systems/rig/
├─ bpjnt/               定位关节模板
│   ├─ hand_fk.ma
│   ├─ hand_fk.json     模板声明（包含哪些关节、序号范围、左右侧）
│   └─ ...
├─ module/              绑定模块（继承链 + 部位特化）
│   ├─ bone.py          Bone        契约层
│   ├─ base.py          Base        基础实现（Jnt + Ctrl）
│   ├─ chain.py         Chain       链式绑定
│   ├─ chain_fk.py      ChainFK     纯 FK
│   ├─ chain_ik.py      ChainIK     IK + pole vector
│   ├─ chain_ikfk.py    ChainIKFK   FK + IK + switch
│   ├─ arm.py           Arm         ← ChainIKFK
│   ├─ leg.py           Leg         ← ChainIKFK
│   ├─ spine.py         Spine       ← ChainIKFK
│   ├─ hand.py          Hand        ← ChainFK（内部持有 Finger）
│   ├─ finger.py        Finger      ← ChainFK
│   ├─ neck.py          Neck        ← ChainFK
│   ├─ head.py          Head        ← Base
│   └─ ...
├─ config/              模块配置（dict 数据）
└─ ui/                  绑定库窗口
    ├─ icon/
    ├─ setup/           .ui 文件
    └─ widget/          读取 .ui 的 Python
```

三个结构性决定：

- **没有 `chain_ep.py`** ✅「按曲线长度布点」是 `Chain` 的参数，不是子类：

  ```python
  Chain(..., distribution="even" | "curve")
  ```

- **没有 `limb_fk.py` / `limb_ik.py` / `limb_ikfk.py`** ✅ 部位只选一种拓扑继承，不做「拓扑 × 部位」的笛卡尔积。手臂要完整版，就是 `Arm(ChainIKFK)`，不存在「只有 FK 的手臂」。

- **没有 `subject/` 目录** ✅ 复合部位（如 `Hand`）本身就是模块，内部持有子模块。装配关系存在于模块内部，而不是额外一层目录。

模块数超过 15 个之后，再把 `module/` 按 `body/` `face/` 分组，不影响现在的结构。

---

## 3. 对象模型 ✅

```text
Bone            契约：定义生命周期与必须实现的方法
  ↓
Base            基础实现：定位 → 关节 → 控制器 → 约束
  ↓
Chain           链式：一组 bpjnt → 一组 jnt → 一组 ctrl
  ├── ChainFK   纯 FK 层级 + 约束
  ├── ChainIK   IK handle + pole vector
  └── ChainIKFK FK + IK + blend，附带 switch
        ↓
   Arm / Leg / Spine             ← 继承 ChainIKFK
   Hand / Finger / Neck          ← 继承 ChainFK
   Head / Brow / Cheek / Nose    ← 继承 Base
```

三条规则：

1. **拓扑层（`Chain*`）不含任何部位知识**，只负责「把 N 个定位关节变成一条链」。
2. **部位层只选一种拓扑继承**。不做 `ArmFK` / `ArmIK` 的派生。
3. **需要第二种拓扑时用组合**，不要再造子类。

继承深度 4 层（`Bone → Base → Chain → ChainIKFK → Arm`），与参考系统一致。

### 3.1 参考：生产验证的继承结构

一个已投产的 21 模块绑定系统（Python + OOP）的继承关系：

```text
Base Rig                     只放命名约定与连接方法
├─ Master Rig
├─ Vertebrae Rig
├─ FK Rig ──→ Spine Rig ──→ {Neck Rig, Torso Rig}
├─ Limb Rig ──→ Arm Rig ──→ {Bird Wing Rig, Bat Wing Rig}
│             └─ Leg Rig ──→ Hind Leg Rig
├─ Paw Rig ──→ Hand Rig ──→ Bird Tail Rig
├─ Mouth Rig
├─ Eye Rig ──→ Cartoon Eye Rig
├─ Cheek Rig
└─ Nose Rig
```

三条可借鉴的原则：

1. **根节点极小**。`Base Rig` 只有命名约定和连接方法，不承担任何绑定逻辑。这与我们「`Bone` 只管契约」的分工一致。
2. **中间层按拓扑分，叶子按部位分**。`FK` / `Limb` / `Paw` 是结构类型，`Arm` / `Leg` / `Hand` / `Neck` 是具体部位。部位才允许有特化逻辑。
3. **继承深度控制在 3~4 层**。`Base → Limb → Arm → Bird Wing`，再深就难维护。

与参考系统的差异：它把 `Arm Rig` 当作「完整手臂」（IK/FK 是内部开关），我们保留 `ChainFK/IK/IKFK` 作为可复用的算法层，部位层再选一种继承。这样 `ChainIK` 的实现能同时服务手臂和腿，不必写两遍。

同一系统的肢体模块功能清单（可作为 `Arm` / `Leg` 的能力验收表）：

```text
IK / FK 开关
IK 控制自动拉伸
软 IK
弯头偏移 / 锁定
肢体挤压与拉伸（squash & stretch）
局部缩放（local scale）
IK 控制的旋转空间开关
FK 控制的旋转空间开关
FK / IK 模式下调整肢体长度
Bendy 控制
```

规模参考：完整系统 21 个模块。我们不必追求同样数量，但可以此预估 `module/` 的目录规模。

---

## 4. 生命周期 ✅

对外只暴露三个方法：

```python
module.build_setup()    创建定位（bpjnt）
module.build_rig()      根据定位创建绑定（jnt / ctrl / constraint）
module.delete_rig()     删除本次构建产生的节点
```

`build_setup`

```text
create_namespace
    _create_base_namespace()    所有组件共用
    _create_extra_namespace()   本组件特有
create_bpjnt
    _create_base_bpjnt()
    _create_extra_bpjnt()
```

`build_rig`

```text
create_namespace
    _create_base_namespace() / _create_extra_namespace()
create_joint
    _create_base_joint() / _create_extra_joint()
create_ctrl
    _create_base_ctrl() / _create_extra_ctrl()
create_constraint
    _create_base_constraint() / _create_extra_constraint()
```

模式：**基类定流程，子类只填 `extra` 钩子**。`base` 部分保证所有组件一致，`extra` 部分处理部位差异。

Rebuild 语义：`create_joint` / `create_ctrl` 在发现已有输出时，先记录位置与形态，删除后再重建。

---

## 5. 模板契约 ✅

每个定位模板由两个文件组成：

```text
hand_fk.ma        关节与 Locator 的实际位置
hand_fk.json      声明：包含哪些 bpjnt、序号范围、支持哪些侧
```

声明示例：

```json
{
  "joints": ["bpjnt_lf_hand_fk_001", "bpjnt_lf_hand_fk_002"],
  "sides": ["lf", "rt"],
  "index_range": [1, 2]
}
```

导入后先校验「数量、名称、侧」是否与声明一致，不一致立即报错，不带病进入 build。

理由：`.ma` 是不可见契约，改名后代码会静默找不到；声明文件把它变成可校验的数据。

---

## 6. 复合部位 ✅

复合部位本身就是模块，通过**内部持有**组合子模块，不额外占一层目录：

```python
class Hand(ChainFK):
    u"""手掌 + 五指。"""

    def __init__(self, side):
        super(Hand, self).__init__(...)
        self.fingers = [Finger(side, index=i) for i in range(1, 6)]

    def build_rig(self):
        super(Hand, self).build_rig()      # 先建手掌
        for finger in self.fingers:
            finger.build_rig()             # 再建五指
```

对外仍然是 `build_setup / build_rig / delete_rig`，调用方不需要知道内部组合了几个子模块。

规则：

- 复合部位**继承**自己的主拓扑，**持有**子模块。
- 子模块与父模块使用同一套生命周期，父模块负责按顺序调用。
- `delete_rig()` 必须覆盖全部子模块，不允许只删一半。

---

## 7. 数据组织 ✅

模块的配置、名称表、参数统一放 `config/`，用 `dict` 表达：

```python
module_config = {
    "arm": {"guide_count": 3, "ctrl_shape": "circle", "axis": "X+"},
}
```

增删组件只改数据，不改代码结构。

---

## 8. UI ✅

```text
ui/
├─ icon/        图标
├─ setup/       .ui 文件（Qt Designer）
└─ widget/      读取 .ui 的 Python 类
```

入口 `bind_tool_main` 负责：

- 导入模块
- 创建并显示主窗口
- 不承载任何绑定逻辑

---

## 9. 与旧库的关系 ✅

`muziRigTool` 是重写版本，不继承 `muziToolset` 的代码。

旧库保留作为参考，但新代码不 import 它。两者可以同时安装在 Maya 的 scripts 目录下。

---

## 10. 当前进度

| 模块 | 状态 |
|---|---|
| 仓库基建（CI / LICENSE / 测试入口） | ✅ 完成 |
| `core/common/name_utils.py` 命名系统 | 🚧 进行中（校验待补充） |
| `module/bone.py`、`module/base.py` | ❌ 未开始 |
| `module/chain*.py` | ❌ 未开始 |
| `module/` 部位模块 | ❌ 未开始 |
| `bpjnt/` 模板与声明 | ❌ 未开始 |
| `ui/` | ❌ 未开始 |

---

## 待确认

1. `Bone` 与 `Base` 的分工：`Bone` 是否只放契约（抽象方法），所有实现都在 `Base`？
2. `ChainIKFK` 的三条链中，哪一条是最终蒙皮关节？
3. 模块数超过 15 个之后，`module/` 是否按 `body/` `face/` 分组？
