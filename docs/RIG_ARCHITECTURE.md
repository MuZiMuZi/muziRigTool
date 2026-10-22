# 绑定系统架构参考

记录当前绑定部分的类结构、继承关系、数据流和设计决策。

---

## 一、整体分层

```text
muziRigTool/
├─ app/           入口：工具箱
├─ ui/            公共控件：主题、颜色选择器、大小选择器
├─ tools/         工具：每个工具一个窗口，只做界面编排
├─ systems/       绑定系统：模块、定位器
│   └─ rig/
│       ├─ guide.py
│       └─ module/
├─ core/          原子能力：关节、控制器、约束、命名、场景
├─ resources/     资源：控制器形状、定位器模板
└─ tests/
```

依赖方向单向向下：

```text
app → tools → systems → core
              ui  ← tools
```

`core` 不知道 `systems`，`systems` 不知道 `tools`。

---

## 二、绑定模块继承图

```text
RigModule                      base.py
│   生命周期 + 通用构件
│
├─ FkChain                     chain.py
│  纯 FK 链：Guide → 关节链 + 控制器链
│
└─ LimbIkFk                    ikfk.py
    IK/FK 三链：deform / bp / ik / fk + Switch
   │
   ├─ Arm                      arm.py
   │  手臂：三链 + 手部挂接点（预留）
   │
   └─ Leg                      leg.py
      腿：三链 + 脚部挂接点（预留）
```

### 各类职责

| 类 | 文件 | 行数 | 负责 |
|---|---|---:|---|
| `RigModule` | base.py | 300 | 生命周期、Guide 校验、建关节/控制器、串链、删节点 |
| `FkChain` | chain.py | 187 | 一条纯 FK 链的命名与连接 |
| `LimbIkFk` | ikfk.py | 563 | 三链结构、ikHandle、Switch 驱动、IK/FK 切换 |
| `Arm` | arm.py | 32 | 默认外观配置 |
| `Leg` | leg.py | 33 | 默认外观配置 |

---

## 三、生命周期

### build_rig

```text
build_rig()
├─ delete_rig()          清掉上一次的输出（支持重复构建）
├─ get_guides()          校验 Guide、生成全部固定名称
├─ create_joints()       建关节
├─ create_ctrls()        建控制器
└─ setup_hierarchy()     建总组、串链
```

### connect_rig

子类实现，只建立驱动关系，不建结构。

`LimbIkFk` 的顺序：

```text
connect_rig()
├─ create_fk_drivers()        FK 控制器 → fk 关节
├─ create_ik_handle()         ikHandle + 极向量约束
├─ create_blend_constraints() ik/fk 关节 → deform 关节
└─ setup_switch()             Switch 属性 + 驱动关键帧
```

### delete_rig

反向清理：

```text
delete_rig()
├─ 子类：删约束、ikHandle
└─ RigModule：删 ctrl 组、jnt 组
```

先删 ctrl 组再删 jnt 组——控制器可能约束着关节，反过来删会报错。

---

## 四、LimbIkFk 的四套关节

```text
deform   蒙皮用，可见        jnt_lf_arm_bind_001~003
bp       定位用，隐藏        jnt_lf_arm_bp_001~003
ik       ikHandle 驱动，隐藏  jnt_lf_arm_ik_001~003
fk       FK 控制器驱动，隐藏  jnt_lf_arm_fk_001~003
```

驱动关系：

```text
FK 控制器 ──parentConstraint──→ fk 关节
ikHandle  ──────────────────→ ik 关节

ik 关节 ─┐
         ├─parentConstraint（权重由 Switch 驱动）→ deform 关节
fk 关节 ─┘
```

### 为什么是三套关节而不是一套

`ikHandle` 直接改写关节旋转，如果再叠 `parentConstraint`，两套驱动会互相覆盖。
拆成独立的三套，各自计算，最后只混合权重，互不干扰。

### Switch

```text
Switch = 0    IK 生效：约束 w0=1、w1=0，显示 IK + 极向量控制器
Switch = 1    FK 生效：约束 w0=0、w1=1，显示 FK 控制器链
```

用 `setDrivenKeyframe` 驱动权重和控制器组可见性。

---

## 五、数据流

```text
resources/module_guide/body_guide.ma
        │
        │  Guide("body").import_template()
        ▼
场景中的定位关节（lf / rt / md）
        │
        │  guide.get_body_limb("lf", "arm")
        ▼
4 个节点：[根, 中, 末端, 极向量]
        │
        │  Arm(side="lf", guides=chain).build_rig()
        ▼
grp_lf_arm_jnt_001 + grp_lf_arm_ctrl_001
        │
        │  connect_rig()
        ▼
约束 + ikHandle + Switch
```

---

## 六、命名规则

五段式：`[type]_[side]_[part]_[function]_[index]`

```text
jnt_lf_arm_bind_001
ctrl_lf_arm_fk_001
cons_lf_arm_blend_001
ikHandle_lf_arm_main_001
grp_lf_arm_jnt_001
```

由 `core/common/name_utils.py` 的 `Name` 类负责校验和拼接。

---

## 七、定位器模板

```text
resources/module_guide/
├─ body_guide.ma      身体完整骨架（lf / rt / md）
├─ arm_guide.ma       四肢模板（含极向量 locator）
└─ leg_guide.ma
```

### body_guide 结构

```text
grp_md_body_guide_001
├─ md 脊柱 5 节 → 锁骨 / 脖子 / 头
├─ lf 锁骨 → 肩胛 → 手臂 → 5 根手指
├─ rt 同上（由 lf 镜像驱动）
├─ lf / rt 腿链
├─ 4 个极向量关节（节点网络自动跟随）
└─ 4 条显示曲线（template 模式，不可选）
```

### 三个内建机制

**① 极向量自动跟随**

节点网络实时计算：极向量 = mid + normalize(mid 到链的垂线) × 距离。
保证极向量始终和三个关节共面。

**② 左右镜像驱动**

rt 关节由 lf 关节经「镜像矩阵 + locator + parentConstraint」驱动。
编辑 lf 时 rt 自动同步，不需要重新镜像。

**③ 显示曲线**

从中间关节到极向量的直线，`overrideDisplayType = 1`（template），
视口可见但点不到。

---

## 八、当前状态

### 已完成

```text
core        命名、关节、控制器、约束、吸附、曲线、蒙皮、场景清理
systems     绑定模块基类 + FK 链 + IK/FK 三链 + Arm/Leg
guide       模板导入、取链、镜像驱动、极向量自动跟随
tools       10 个工具（含四肢绑定）
resources   4 套控制器形状约 23 个、3 个定位器模板
```

### 未完成

```text
spine / neck 模块     body_guide 里有 5 节脊柱，但没有对应绑定模块
手指 / 手掌模块        手部关节已有，缺绑定
脚部模块              腿链已有 ankle/ball/toe，缺脚部控制器
蒙皮流程               skin_utils 独立，还没和模块串起来
约束管理               space switch、约束批量管理
绑定模板保存/加载      目前的模板只有定位器，没有完整绑定
```

---

## 九、开发建议

### 优先级

**第一优先：spine 模块**

理由：body_guide 里已经有 5 节脊柱，但没有任何绑定模块能接。
脊柱是躯干的基础，手臂和腿都挂在它下面。

结构可复用 `FkChain` 的模式：

```text
Spine(RigModule)
    create_joints()    5 个关节
    create_ctrls()     5 个控制器 + 一个总控
    connect_rig()      控制器约束关节
```

差异点：脊柱通常需要额外的「整体控制器」（root / hips / chest），
以及末端的 head 连接。

**第二优先：hand 模块**

手部关节在模板里已经有了（5 根手指 × 4~5 节），但手部绑定比较特殊：

```text
每根手指一条独立链
手掌可能需要一个整体的 controller
手指通常不做 IK，纯 FK
```

可以先做一个简单的 `hand` 模块：每根手指一条 `FkChain`，挂到手腕控制器下。

**第三优先：foot 模块**

腿链已有 ankle / ball / toe。脚部绑定常见做法：

```text
foot 控制器控制脚踝
toe 控制器控制脚尖
可能加 reverse foot（脚跟枢轴）
```

可以先做基础版，reverse foot 以后再加。

### 不建议现在做的

```text
IK 拉伸（stretch）      Zoo 那套节点图很重，等基础模块齐了再说
扭曲骨骼（twist）        需要先有蒙皮流程
面部绑定                 独立体系，和身体不共用模块
模板保存/加载             现在的 guide 模板够用，绑定还不稳定
```

### 一个需要注意的点

现在 `Arm` / `Leg` 是空壳，只覆盖默认配置。

加 hand / foot 时，**不要**直接往 `LimbIkFk` 里塞逻辑——
应该在 `Arm` / `Leg` 里覆盖：

```python
class Arm(LimbIkFk):
    def create_ctrls(self):
        super().create_ctrls()
        self.create_hand_ctrls()    # 手臂特有
```

这样 `LimbIkFk` 保持通用，其他部位（比如尾巴、翅膀）还能复用。

---

## 十、测试

### 已有测试

```text
tests/test_smoke.py       纯 Python 冒烟测试
```

### 建议补充

Maya 环境测试（不跑在 CI，本地验证）：

```text
模块构建     四条链 build + connect + delete
镜像驱动     lf 移动后 rt 同步
极向量跟随   移动关节后极向量共面
重复构建     连续 build 两次不撞名
```

这些目前是临时脚本，可以考虑整理成 `tests/maya/` 下的固定脚本。
