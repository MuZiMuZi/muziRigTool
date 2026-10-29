# 姿态驱动修型工具：ADV 版设计与原理

> 状态：ADV 版结构完成（2026-10-29）。
> 定位：Maya 2023，按 ADV 固定骨架名一键生成姿势驱动属性。
> 参考：ADV 左肩八方向 Pose Driver V5（二维 smoothstep 门控 + 方向隔离）。

---

## 快速使用

```python
from muziRigTool import launch
launch.launch()
```

打开「绑定工具」分类，双击「姿态驱动修型」。

工具会：

1. 按 ADV 固定关节名扫描场景；
2. 找到 `Shoulder_L/R`、`Hip_L/R` 后，在对应汇总组上建分隔属性 + 8 个方向属性；
3. 每个方向属性由一条 driven key 曲线驱动，曲线默认三点 auto 切线（0→0、0.5→0.25、1→1，前段平缓后段上升），可以在 Graph Editor 里自己调；
4. 关节旁建一个 `ind_<side>_<part>_001` 指示器，随关节转动显示当前方向；
5. 关节一转，属性值实时变化。

界面只有三块参数：A/B 轴（默认 rotateY / rotateZ）、阈值角度（默认 45°）、后摆角度（默认 70°）、8 个方向勾选。按钮两个：「生成全部」「删除全部」。

脚本入口：

```python
from muziRigTool.core.deformation import pose_driver_utils

# 一键生成场景里所有 Shoulder / Hip
results, errors = pose_driver_utils.build_all_supported()

# 只生成一个部位
result = pose_driver_utils.build_network(
    "Shoulder_L",
    axes=("rotateY", "rotateZ"),
    angle=45.0,
    directions=("up", "front_up"),
)

# result["group"]       grp_md_arm_pose_001
# result["part_key"]    lf_shoulder
# result["attributes"]  {"up": "lf_shoulder_U90", ...}

pose_driver_utils.read_weights(result)
pose_driver_utils.delete_all_parts()
```

---

## 1. ADV 固定名单

工具内置 ADV 标准骨架名，不靠解析猜：

| ADV 关节 | side | part | 汇总组 | 本轮八方向 |
|---|---|---|---|---|
| `Shoulder_L` / `Shoulder_R` | lf / rt | shoulder | `grp_md_arm_pose_001` | ✅ |
| `Clavicle_L` / `Clavicle_R` | lf / rt | clavicle | `grp_md_arm_pose_001` | ✅ F45 / U45 / D45 |
| `Hip_L` / `Hip_R` | lf / rt | hip | `grp_md_leg_pose_001` | ✅ |
| `Elbow_L` / `Elbow_R` | lf / rt | elbow | arm | ✅ 单轴多角度 F45 / F90 / F120 |
| `Wrist_L` / `Wrist_R` | lf / rt | wrist | arm | ✅ 四方向 + 双向扭转 |
| `Hand_L` / `Hand_R` | lf / rt | hand | arm | 跳过 |
| `Knee_L` / `Knee_R` | lf / rt | knee | leg | ✅ 单轴多角度 F45 / F90 / F120 |
| `Ankle_L` / `Ankle_R` | lf / rt | ankle | leg | ✅ 四方向 + 双向扭转 |
| `Toe_L` / `Toe_R` | lf / rt | toe | leg | 跳过 |
| `Spine1_M` / `Chest_M` | md | spine1 / chest | `grp_md_spine_pose_001` | ✅ F45 / B45 / L45 / R45 / 双向扭转（读 `*_M` 变形关节世界矩阵） |
| `ThumbFinger/IndexFinger/MiddleFinger/RingFinger/PinkyFinger 1~4_L/R` | lf / rt | 手指 | `grp_md_finger_pose_001` | ✅ 整指：1/2/3 节 + 融合 |

八方向只给两轴大范围摆动的上臂与大腿。

### 1.2 手指

入口是每指的 `Finger1` 关节（`IndexFinger1_L`、`ThumbFinger1_L` 等），一次生成整根手指：

| 属性 | 含义 |
|---|---|
| `lf_index1_F90` / `lf_index2_F90` / `lf_index3_F90` | 第 1 / 2 / 3 节单独修型 |
| `lf_index12_F90` | 1+2 两节融合 |
| `lf_index23_F90` | 2+3 两节融合 |
| `lf_index123_F90` | 1+2+3 三节融合 |

- 每节驱动直接读控制器 `FK<Finger>Finger<节>_L/R` 的 `rotateY`（手指是纯 FK，没有 IK 顾虑，比骨骼链夹角更直观）；
- 构建时记录控制器 neutral 值，转到 90° 时门满；
- 融合属性 = 对应各节门的乘积，所以各节都到 90° 时融合才到 1；
- 单节修型与融合独立叠加；
- 拇指按同一套做，第一节也参与融合；
- 第 4 节只作为向量末端，不做单独修型。

### 1.3 四肢的两种模式

| 模式 | 部位 | 属性 | 算法 |
|---|---|---|---|
| 单轴多角度 | elbow / knee | `lf_elbow_F45` / `_F90` / `_F120` | rotateX 前弯，每个角度一个门，独立叠加 |
| 四方向 + 扭转 | wrist / ankle | 腕：`lf_wrist_U90` / `_D90` / `_L70` / `_R70` / `_TwsP179` / `_TwsN179`；踝：`lf_ankle_F70` / `_U70` / `_B70` / `_D70` / 扭转 | Y/Z 摆动门，rotateX 双向扭转门，独立叠加 |

- 肘弯曲轴 `rotateZ`、膝 `rotateX`，都是正向；转到 45° 时 F45 满，转到 90° 时 F90 满（F45 仍在），120° 时 F120 满；
- 腕直接读 `FKWrist_L/R` 控制器通道（IK 下手腕仍由手腕控制器驱动）；上下（屈伸）`rotateY` 90°、左右（尺桡偏）`rotateZ` 70°、扭转 `rotateX` 179°；
- 腕的扭转只驱动 `TwsP179` / `TwsN179`，不会串到上下左右；
- 踝的轴分配：前后/上下用 `rotateY` + `rotateZ`，各 70°，扭转 `rotateX` 179°；
- 扭转正向 `TwsP179`、负向 `TwsN179`；
- 全部独立叠加，不归一化。

---

## 2. 输出结构

### 2.1 组结构

```text
grp_md_all_pose_001          总组
├─ grp_md_arm_pose_001
├─ grp_md_spine_pose_001
├─ grp_md_leg_pose_001
├─ grp_md_finger_pose_001
└─ grp_md_skirt_pose_001      裙子组
```

四个汇总组和裙子组都收进总组；组上的默认 transform 属性（translate / rotate / scale / visibility）
已隐藏，Channel Box 只显示方向属性。

### 2.2 裙子组

- `leg_follow`：double（0~1），控制裙子是否跟随腿部运动；
- 腿组每个部位属性都会镜像到裙子组，名字加 `skirt_` 前缀，如 `skirt_lf_hip_F90`，与腿组自己的 `lf_hip_F90` 明确区分；
- 连接方式：`腿组属性 × leg_follow → multDoubleLinear → skirt_<属性>`（`mult_<side>_<part>_<后缀>LegFollow_001`）；
- 裙子组属性只作为未来裙子修型的驱动源，不直接手 K；
- 一键生成全部时自动建立连接；删除全部时清掉镜像属性与节点，保留组和 `leg_follow`。

### 2.2 组内属性

```text
grp_md_arm_pose_001
  sep_lf_shoulder     0.0   ← double、锁定、Channel Box 显示，只作分隔
  lf_shoulder_U90     0.0
  lf_shoulder_D45     0.0
  lf_shoulder_F90     0.0
  lf_shoulder_B70     0.0
  lf_shoulder_F45U45  0.0
  lf_shoulder_F45D45  0.0
  lf_shoulder_B45U45  0.0
  lf_shoulder_B45D45  0.0
  sep_rt_shoulder     0.0   ← 右肩
  ...
```

方向后缀固定：上抬/下压/前摆 90、后摆 70、对角 45，与阈值参数解耦。

| 方向 | 后缀 | 方向 | 后缀 |
|---|---|---|---|
| up | U90 | front_up | F45U45 |
| down | D90（手臂下压为 D45） | front_down | F45D45 |
| front | F90 | back_up | B45U45 |
| back | B70 | back_down | B45D45 |

### 2.3 配置

组上的 `poseDriverConfig` 是 JSON 字符串：

```json
{
  "lf_shoulder": {
    "joint": "Shoulder_L",
    "axes": ["rotateY", "rotateZ"],
    "angle": 45.0,
    "angle_map": {"back": 70.0, "up": 45.0, "...": 45.0},
    "directions": ["up", "front_up"],
    "neutral": {"rotateY": 0.0, "rotateZ": 0.0},
    "separator": "sep_lf_shoulder",
    "attributes": {"up": "lf_shoulder_U90", "front_up": "lf_shoulder_F45U45"},
    "indicator": "ind_lf_shoulder_001",
    "nodes": ["lf_shoulder_deltaA", "..."]
  }
}
```

删除、重建、场景恢复都靠它。

---

## 3. 门控原理

### 3.1 驱动源：世界矩阵 + 四元数

ADV 的 FK 控制器通过约束驱动关节，关节自己的 rotate 通道不变，所以不能读局部 rotate。
工具读关节的 `worldMatrix`，构建时记录 neutral 世界矩阵的逆：

```text
R = neutral⁻¹ × current worldMatrix
```

把 R 分解成四元数，绕轴角度用：

```text
angleX = 2 * atan2(qx, qw)
angleY = 2 * atan2(qy, qw)
angleZ = 2 * atan2(qz, qw)
```

四元数 q 与 -q 表示同一旋转，先统一到 `w ≥ 0`，否则 -120° 会被算成 +240°。
这样超过 90°、接近 180° 都不会像欧拉分解那样跳变。

实现上是一段 MEL expression（`expr_<side>_<part>_<role>_001`），
输入是 decomposeMatrix 的 quat 分量，输出三个轴的角度。

**肘 / 膝例外：用骨骼链向量夹角。** 关节的世界旋转轴是一条斜轴
（实测 `Elbow_L` 弯 85.8° 时轴是 (-0.50, -0.87, 0)），单轴分量还原不出角度；
而膝/肘在 IK 模式下控制器也不可靠。所以改用骨骼链夹角：

```text
elbow: angle( Shoulder→Elbow , Elbow→Wrist )
knee:  angle( Hip→Knee , Knee→Ankle )
```

- IK / FK / 拉伸都有效，量的是骨骼实际朝向；
- 不依赖 jointOrient，不存在斜轴问题；
- 伸直约 0°，弯 90° 就是 90°。

多角度按「45 交棒、90 之后保留」：

| 角度区间 | 生效属性 |
|---|---|
| 0 → 45° | F45 从 0 升到 1 |
| 45 → 90° | F45 降、F90 升 |
| 90 → 120° | F90 保持 1、F120 升 |

45° 时只有 F45=1；90° 时 F45 交棒、F90=1；120° 时 F90 与 F120 同时为 1。

### 3.2 方向门

```text
gate(delta, sign, angle) = smoothstep( clamp( sign · delta / angle, 0, 1 ) )
smoothstep(t) = t²(3 − 2t)
```

- `sign · delta` 把反方向压成负数，clamp 后归零 → 同轴两方向互斥；
- clamp 到 1 → 超过阈值角度后保持 1；
- smoothstep 两端导数为 0 → 权重进出没有拐折。

阈值可以按方向单独覆盖：默认所有方向 45°，**后摆方向（back）用 70°**，
也就是 `Shoulder_L` / `Hip_L` 往后 70° 才满门，45° 时只到一半。

- `angle` 是全局默认；
- `angle_map` 是每方向覆盖，例如 `{"back": 70.0}`；
- 配置里两者都存，重建时原样恢复。

### 3.3 八个方向

```text
up    = gate(deltaA, −1, angle)
down  = gate(deltaA, +1, angle)
front = gate(deltaB, +1, angle)
back  = gate(deltaB, −1, angle)

armUp     = up    · (1 − front − back)
armFront  = front · (1 − up − down)
frontUp   = front · up
...
```

结构自带的性质：中立全零、纯单轴不激活双轴、超限保持 1、权重不为负。

总权重是 `U + F − U·F`，只有单轴或双轴满时才等于 1；中间态小于 1，这是 V5 的原始语义。

---

## 4. 驱动关键帧与指示器（已实现）

### 4.1 驱动关键帧

```text
方向门输出（driver，0 → 1）
      ↓ driven key 曲线（默认三点 auto，可手动调）
组属性（driven，0 → 1）
```

- 曲线节点按 `<part_key>_<direction>Curve` 命名，例如 `lf_shoulder_upCurve`；
- 两个端点：driver 0 → 值 0，driver 1 → 值 1；
- 默认三点 auto 切线（0→0、0.5→0.25、1→1，前段平缓后段上升），绑定师可以在 Graph Editor 里改成 ease / 自定义曲线；
- 曲线替换了原来的直接连接，所以数值默认一致，但过渡手感可调。

### 4.2 姿态方向指示器

- 每个部位在关节旁建一个 locator：`ind_<side>_<part>_001`；
- parent 到驱动关节，随关节转动，直观显示当前姿态方向；
- 不参与任何驱动计算，只作视觉提示；
- 删除部位时随节点一起清掉。

---

## 5. v2 修型需求

| 部位 | 修型姿态 |
|---|---|
| shoulder | F45 / U45 / D45 |
| arm | F90 / U90 / B70 / F45U90 |
| elbow | F45 / F90 / F120 |
| wrist | U90 / D90 / B70 / F70 / Tws179 |
| thigh（大腿） | F90 / U90 / B70 / F45U90 |
| knee | F45 / F90 / F120 |
| ankle | F70 / U70 / B70 / D70 / Tws179 |
| spine1（腰） | F45 / B45 / L45 / R45 / Tws45 |
| chest（胸） | 同 spine1 |
| 手指 | 每指节单独 90° + 两节/三节融合（已实现） |

语义约定：

- **同方向多角度独立叠加**：elbow / knee 的 F45 / F90 / F120 各自独立累加，不接管、不归一化；
- **tws 是横向旋转**（扭转轴）；双四元数蒙皮暂不涉及；
- **spine1 / chest 需要 L / R 侧弯**，需要扩展成「每部位自定义方向列表 + 轴映射」；
- **手指是多关节组合驱动**：先给每根手指的每个指节单独 90° 修型，再叠加相邻两节融合、三节融合；拇指第一节也参与融合；食指 / 拇指 / 中指 / 无名指 / 小指都按同一套做；
- 手指属性命名待定：单节用 `lf_index_F90_001` 这种带序号；融合属性另起命名（例如 `lf_index_F90_12` / `_123`），实现时确认。

---

## 6. 代码拆解

```text
tools/rig/pose_driver_tool.py          只收集参数、显示状态
        ↓
core/deformation/pose_driver_utils.py  固定名单、建组、建属性、建网络、清理
        ↓
core/deformation/pose_gate_math.py     纯数学，不 import Maya
```

| 文件 | 职责 |
|---|---|
| `pose_gate_math.py` | clamp / smoothstep / 方向门 / 8 方向权重，可脱离 Maya 单测 |
| `pose_driver_utils.py` | ADV 名单、四组管理、属性与分隔、DG 网络、driven key 曲线、指示器、配置 JSON、删除/重建/镜像 |
| `pose_driver_tool.py` | PySide2 窗口：生成全部 / 删除全部 |
| `tests/test_pose_gate_math.py` | 26 个纯数学用例 |
| `tests/test_pose_driver_tool_registry.py` | 注册表与公开入口契约 |
| `tests/pose_driver_maya_smoke_test.py` | mayapy 真机冒烟 11 项 |

关键函数：

```python
adv_joint_map                    # ADV 固定关节名 → (side, part, category)
eight_direction_parts            # 八方向只开放 shoulder / arm / hip / thigh
multi_angle_parts                # 肘/膝单轴多角度
four_twist_parts                 # 腕/踝四方向 + 双向扭转
find_supported_joints()          # 按固定名单扫描场景
build_all_supported()            # 一键生成全部
build_network(...)               # 建一个部位
delete_part(group, part_key)     # 删一个部位
delete_all_parts()               # 删全部部位
rebuild_network(network)         # 按配置重建
mirror_config(config, target)    # 生成镜像侧配置
read_group_config(group)         # 读组上 JSON
read_weights(network)            # 读当前部位权重
```

### 6.1 节点命名

全部按五段式 `[type]_[side]_[part]_[function]_[index]`，类型用简写：

```text
grp_md_arm_pose_001                汇总组
plus_lf_shoulder_deltaA_001        plusMinusAverage
mult_lf_shoulder_upScale_001       multDoubleLinear
clamp_lf_shoulder_upClamp_001      clamp
add_lf_shoulder_upOffset_001       addDoubleLinear
reverse_lf_shoulder_aFree_001      reverse
anim_lf_shoulder_U90_001           animCurve 驱动曲线
loc_lf_shoulder_pos_001            locator 姿态指示器
```

简写对照：`plusMinusAverage → plus`、`multDoubleLinear → mult`、`addDoubleLinear → add`、`animCurve → anim`、`locator → loc`。

---

## 7. 边界与未决

已实现：

- ADV 固定名单扫描，支持 Shoulder / Hip（八方向）、Clavicle（F45/U45/D45）、Elbow / Knee（单轴多角度）、Wrist / Ankle（四方向 + 双向扭转）、Spine1 / Chest（前后左右 + 扭转）、手指（整指 1/2/3 节 + 融合）；
- 驱动源读关节世界矩阵，矩阵差 + 四元数算角度，支持约束驱动的 ADV FK；
- 四个汇总组收进总组 `grp_md_all_pose_001`，默认 transform 属性隐藏；
- 部位分隔属性、方向属性命名、driven key 曲线、姿态指示器；
- 一键生成全部 / 删除全部；
- 重复生成同一部位会先清理旧属性与节点；
- 删除部位时先解锁分隔属性，再断开连接、删属性、删节点；
- 组有所有权标记，同名但不是本工具创建的组会拒绝复用。

已知限制 / 未决：

1. **八方向只给 Shoulder / Hip**；Elbow / Knee 用单轴多角度，Wrist / Ankle 用四方向 + 扭转，手指用整指 1/2/3 节 + 融合；Spine / Chest / Hand / Toe 仍待 v2；
2. 辅助骨 / 修型目标的映射（方向属性再去驱动辅助骨 rotate 0→30°）未实现，本轮只到属性与曲线；
3. 镜像只做名字替换，通道符号是否同号需在真实绑定上验证；
4. 独立 JSON 导入导出未做；
5. 手指属性序号含义待定；
6. 扭转轴、L/R 侧弯的方向与轴映射待设计。

---

## 8. 测试

```powershell
python -m compileall -q .
python -m unittest discover -s tests -v

& "C:\Program Files\Autodesk\Maya2023\bin\mayapy.exe" `
    "tests\pose_driver_maya_smoke_test.py"
```

冒烟覆盖：ADV 固定名单扫描、解析归类、总组与四组层级、默认属性隐藏、属性名与分隔属性、driven key 曲线与端点、姿态指示器、单轴/半程/超限/对角/中立（含 -120° 四元数不跳变）、后摆 70° 阈值、四肢（肘/膝多角度、腕控制器四方向+双向扭转、踝四方向）、锁骨（F45/U45/D45）、脊柱（前后左右 + 双向扭转）、手指（单节 + 两节融合）、一个组多部位、按部位删除、重建恢复、一键生成全部（11 个部位）、删除全部、错误输入。

---

## 9. 想继续学的话

```text
1. core/deformation/weight_math.py           先看纯算法怎么拆出来
2. core/deformation/deformer_weight_utils.py 再看 Maya 层怎么组织流程
3. tools/skin/deformer_weight_tool.py        最后看 UI 怎么只做收参数
4. core/deformation/pose_gate_math.py        同样的三层结构，数学先行
5. tests/test_pose_gate_math.py              数学层怎么被验证
6. core/deformation/pose_driver_utils.py     固定名单、组管理、属性与清理
7. tests/pose_driver_maya_smoke_test.py      真机验证怎么写
8. tools/rig/pose_driver_tool.py             UI 只收参数
```
