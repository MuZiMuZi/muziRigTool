# RBF 修型驱动资料整理

> 本文整理 RBF（Radial Basis Function，径向基函数）修型的原理、旧库 `muziToolset` 的实现拆解，
> 以及 `muziRigTool` 新版 RBF 修型工具的设计方案。
> 旧库源码位置：`C:\Users\X\Documents\maya\scripts\muziToolset\legacy_reference\pose_driver_rbf_backup_20261009\systems\rbf\`

## 1. 背景与目标

姿态驱动修型要解决的问题：关节摆到某个姿态时，自动补出对应修型（体积保持、挤压、褶皱）。

常见做法有两类：

- **方向门控**（当前 `pose_driver` 工具）：按单轴角度阈值开一个 smoothstep 门，门输出再驱动属性。
  优点是结构简单、可解释；缺点是每个方向都要单独定轴，斜轴、父级带动、IK 都会让方向判断出错。
- **RBF 插值**（本文）：把「关节姿态」当成多维输入空间里的点，每个修型目标是空间里的一个样本点，
  姿态靠近哪个样本，对应权重就接近 1。多关节天然一起算，不需要逐轴判方向。

RBF 版工具定位为**独立工具**，与现有 `pose_driver` 并存，供裙子、躯干这类多关节联动的修型使用。

## 2. RBF 原理

### 2.1 基本模型

每个修型样本有一个输入向量 `c_i`（样本中心）和一个目标值 `t_i`（一般是 one-hot：第 i 个输出为 1，其余 0）。

求解一组系数 `w`，使插值函数在样本点上等于目标值：

```text
f(x) = Σ w_j · φ(||x − c_j||)
```

其中 `φ` 是核函数。最常用高斯核：

```text
φ(d) = exp(-d² / (2 · radius²))
```

`radius` 越大曲线越平滑、样本之间过渡越宽；越小则样本之间越「各自为政」。

### 2.2 求解

要满足 `f(c_i) = t_i`，需要解线性方程组：

```text
K · w = T
K[i][j] = φ(||c_i − c_j||)   （i == j 时加正则项）
```

`K` 是样本数 × 样本数的核矩阵，`T` 是样本数 × 输出数的目标矩阵。
样本数少时直接高斯消元（部分主元），不需要 NumPy。

### 2.3 距离归一化

不同输入的单位不同（旋转角度、位移距离），直接算欧氏距离会让大数值的输入主导。
所以每个输入配一个 `scale`，距离按 `(delta / scale)²` 累加。

角度输入可能跨 0/360 绕回，用周期 `period` 把直线距离换成圆上弦长：

```text
delta = period / π · sin(π · delta / period)
```

### 2.4 输出后处理

- `clamp`：输出夹到 0~1，避免插值过冲出负数或大于 1；
- `normalize`：如果多个输出总和大于 1，按总量缩放，保证叠加不超上限。

## 3. 旧库实现拆解

### 3.1 数据模型 `RbfModel`

| 字段 | 含义 |
|---|---|
| `inputs` | 输入属性路径列表，如 `Elbow_L.rotateZ` |
| `scales` | 每个输入的尺度，默认 90 |
| `periods` | 每个输入的周期，角度可用 360，0 表示连续值 |
| `poses` | 样本列表，每项 `{name, values, neutral}`，**第一项必须是中立姿态** |
| `radius` | 高斯核宽度（归一化空间） |
| `regularization` | 训练矩阵对角线正则项，0 表示精确插值 |
| `clamp` / `normalize` | 输出夹取 / 归一化开关 |
| `solver_type` | `rbf`（高斯插值）或 `smoothstep`（旧方向门） |
| `side` / `part` / `index` | 节点命名用的侧别、部位、序号 |

中立姿态不产生输出，其余每个样本产生一个同名输出。
样本名必须是字母开头的 token，且不能占用 `inputN` / `weightN` 等保留属性名。

配置可整体序列化为 JSON（`to_dict` / `from_dict`），便于保存和迁移。

### 3.2 求解器 `RbfSolver`

- `kernel`：按 scale / period 归一化后的高斯核；
- `train`：构造核矩阵、检查重复样本（距离 < 1e-14 直接报错）、
  高斯消元求系数；
- `evaluate`：对当前输入向量求各输出权重，再 clamp / normalize；
- `require_trained`：样本或核参数变化后拒绝使用旧系数。

### 3.3 自动采样 `sampling.py`

旧库的做法很实用：

1. 读取 ADV FK 控制器（`FKShoulder` / `FKHip` / `FKWrist`）；
2. 依次摆出 11 个姿态：中立、上、下、前、后、四个对角、正负扭转；
3. 每个姿态**读最终关节值**（不是控制器值），保证采样的是绑定后的真实姿态；
4. 采样完成必须恢复控制器原值，并关闭自动关键帧。

这样样本是「摆出来的真实姿态」，比手动填数字稳。

### 3.4 表达式编译 `expression.py`

训练完把系数编译成一段纯 MEL 数值表达式：

```text
float $x0 = network.input0;
float $x1 = network.input1;
float $d0_0 = ($x0 - 0.0) / 90.0;
...
float $k0 = exp(-0.5 * (...) / radius²);
...
float $w0 = (系数 * $k0) + ...;
network.weight0 = clamp(0.0, 1.0, $w0);
```

- 输入是 network 节点上的 `inputN` 属性（连接关节通道）；
- 输出是 `weightN` 属性（alias 成姿态名）；
- 表达式 `alwaysEvaluate=False`，避免无谓刷新。

好处是运行时只有 DG 节点，不依赖 Python 回调，也不会因为切换角色失效。

### 3.5 输出映射 `output_driver.py`

`weightN` 是 0~1 的权重，旧库用 driven 曲线把权重线性映射到两个端点：

```text
权重 0 → 目标属性 neutral 值
权重 1 → 目标属性 full 值
```

曲线类型按目标属性类型选（`animCurveUA` 角度 / `animCurveUL` 距离 / `animCurveUU` 浮点），
区间外保持端点值（`constant` 无穷）。

这样同一个权重既能驱动辅助骨旋转，也能驱动 blendShape 权重或任意标量属性。

### 3.6 场景恢复与重建

- network 节点上存 `muziRbfData`（JSON）和 `ownedNodes`（message 多属性，记录所属节点）；
- 打开场景时 `list_drivers` 找带 `muziRbfData` 的 network，`from_scene` 恢复并修正已重命名的输入连接；
- 重建时先在暂存名下建新网络、迁移同名输出连接、再删旧网络，失败时回滚。

## 4. `muziRigTool` RBF 版设计

### 4.1 输入（已定）

输入固定为 ADV 默认关节的 **local rotate**，按部位分组：

| 部位 | 输入 |
|---|---|
| 肩 | `Shoulder_L/R` 的 rotateX/Y/Z |
| 髋 | `Hip_L/R` 的 rotateX/Y/Z |
| 肘 | `Elbow_L/R` 的 rotateX/Y/Z |
| 膝 | `Knee_L/R` 的 rotateX/Y/Z |
| 腕 | `Wrist_L/R` 的 rotateX/Y/Z |
| 踝 | `Ankle_L/R` 的 rotateX/Y/Z |
| 锁骨 | `Clavicle_L/R` 的 rotateX/Y/Z |
| 脊柱 | `Spine1_M` / `Chest_M` 的 rotateX/Y/Z |
| 手指 | 每指 3 节 × rotateX/Y/Z |

为什么读 local rotate：ADV 约束驱动会改变形关节的 local rotate，
手肘动时手腕 local 不会跟着变（已实测验证），比世界矩阵、控制器都稳。

### 4.2 样本（已定：按属性自动生成）

每个修型属性对应一个样本向量，生成时自动铺好。例如：

```text
肩 U90  →  Shoulder rotateY = -90
肩 B70  →  Shoulder rotateX = +70
腕 TwsP179 → Wrist rotateX = +179
肘 F90  →  Elbow rotateZ = +90
```

各部位的属性清单与角度沿用 `pose_driver` 的规格（`eight_direction_parts`、
`multi_angle_parts`、`four_twist_parts`、`spine_parts`、`finger_defs` 等），
保证两套工具输出一致、可对照。

### 4.3 权重计算

两种实现可选：

- **归一化核**（简单）：`w_i = φ(x, c_i) / Σ φ(x, c_j)`，不需要解方程；
- **精确插值**（旧库做法）：解 `K·w = T`，样本点上严格 one-hot，过渡更可控。

建议先用归一化核快速跑通，再切精确插值。核宽 `radius` 默认 45（度），可调。

### 4.4 输出

- 属性挂在新的汇总组上（与 `pose_driver` 的组分开，避免冲突）：
  - `grp_rbf_all_pose_001`
  - `grp_rbf_arm_pose_001` / `grp_rbf_spine_pose_001` / `grp_rbf_leg_pose_001` / `grp_rbf_finger_pose_001`
- 属性名沿用 `<side>_<part>_<方向><角度>`；
- 每个权重再经 driven 曲线（默认三点平滑）驱动属性，便于手感调整。

### 4.5 与现有 `pose_driver` 的分工

| | `pose_driver`（方向门控） | RBF 版 |
|---|---|---|
| 适用 | 单关节、单轴为主 | 多关节联动、躯干、裙子 |
| 方向判断 | 逐轴门控 | 姿态距离 |
| IK/FK | 部分部位依赖读法 | 读关节 local rotate，天然支持 |
| 输出组 | `grp_md_*_pose_001` | `grp_rbf_*_pose_001` |

## 5. 实现计划

1. `core/deformation/rbf_weight_math.py` — 纯数学：距离、高斯核、归一化权重（已完成，9 个单测）
2. `core/deformation/rbf_pose_driver_utils.py` — 部位样本表、节点构建、表达式编译
3. `tools/rig/rbf_pose_driver_tool.py` — 一键生成 / 删除
4. `tests/rbf_pose_driver_maya_smoke_test.py` — Maya 真机测试
5. `docs/RBF_POSE_DRIVER_TOOL.md` — 使用文档

## 6. 测试要点

- 纯数学：距离、核、归一化、样本点主导、维度校验；
- Maya 真机：
  - 生成后属性与样本数量一致；
  - 摆到样本姿态时对应属性接近 1；
  - 中立姿态时所有属性接近 0；
  - 相邻姿态之间平滑过渡（没有突变）；
  - IK / FK 切换后仍有效；
  - 删除干净，不留孤立节点。

## 7. 参考

- 旧库实现：`muziToolset/legacy_reference/pose_driver_rbf_backup_20261009/systems/rbf/`
  - `model.py`（数据模型）、`solver.py`（求解）、`sampling.py`（自动采样）、
  - `expression.py`（MEL 编译）、`expression.py`、`output_driver.py`（输出映射）、
  - `driver.py`（构建/恢复/重建）、`rbf_corrective_tool.py`（UI）
- 相关文档：[POSE_DRIVER_TOOL.md](POSE_DRIVER_TOOL.md)
