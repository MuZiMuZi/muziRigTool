# RBF 姿态驱动修型工具

> 独立工具：与方向门控版 `pose_driver` 并存，互不影响。
> 原理与旧库拆解见 [RBF_RESEARCH.md](RBF_RESEARCH.md)。

## 1. 定位

方向门控版按单轴角度判断方向，斜轴、父级带动、IK 都容易出错；
RBF 版把「关节姿态」当成多维输入，每个修型属性是一个样本点，
姿态靠近哪个样本，对应权重就接近 1，多关节天然联动。

适用于：裙子、躯干这类多关节联动的修型。

## 2. 组结构

```text
grp_rbf_all_pose_001          总组
├─ grp_rbf_arm_pose_001
├─ grp_rbf_spine_pose_001
├─ grp_rbf_leg_pose_001
└─ grp_rbf_finger_pose_001
```

## 3. 输入

每个部位固定读 ADV 关节的 **local rotate**（`rotateX/Y/Z`）：

| 部位 | 关节 |
|---|---|
| 肩 | `Shoulder_L/R` |
| 髋 | `Hip_L/R` |
| 肘 | `Elbow_L/R` |
| 膝 | `Knee_L/R` |
| 腕 | `Wrist_L/R` |
| 踝 | `Ankle_L/R` |
| 锁骨 | `Clavicle_L/R` |
| 脊柱 | `Spine1_M` / `Chest_M` |

为什么读 local rotate：ADV 约束驱动会改变形关节的 local rotate，
父级旋转不会串进来（手肘动时手腕 local 不变，已实测验证），
比世界矩阵、控制器都稳。

## 4. 样本（按属性自动生成）

每个修型属性对应一个样本向量，生成时自动铺好。例如：

```text
肩 U90   →  Shoulder rotateY = -90
肩 B70   →  Shoulder rotateZ = -70
肘 F90   →  Elbow rotateZ = 90
腕 TwsP179 → Wrist rotateX = 179
脊柱 F45 →  Spine1_M rotateX = 45
```

属性名沿用 `<side>_<part>_<方向><角度>`，与 `pose_driver` 一致，方便对照。

## 5. 权重计算

1. 样本中心 = 中立（0） + 每个属性一个目标向量；
2. 高斯核矩阵 `K`，距离用原始角度（scale=1）；
3. 解 `K · w = T`（Gauss-Jordan）得到系数；
4. 系数编译成 MEL 表达式常量，每个部位一个 expression 节点；
5. 表达式运行时算权重：`Σ 系数 × 核值`，clamp 到 0~1。

核宽默认 45°（`rbf_sigma`），样本点为严格插值（样本点上权重 = 1）。

## 6. 使用

```python
from tools.rig import rbf_pose_driver_tool

rbf_pose_driver_tool.show()
```

窗口里：

- 自动检测场景中的 ADV 关节；
- 「生成全部」：给所有支持的部位建驱动；
- 「删除全部」：清掉属性和节点，组保留。

也可以直接调接口：

```python
from core.deformation import rbf_pose_driver_utils

results, errors = rbf_pose_driver_utils.build_all_supported()
rbf_pose_driver_utils.delete_all_rbf_parts()
rbf_pose_driver_utils.read_weights("lf_shoulder")
```

## 7. 实现文件

| 文件 | 作用 |
|---|---|
| `core/deformation/rbf_weight_math.py` | 纯数学：距离、高斯核、精确插值求解 |
| `core/deformation/rbf_pose_driver_utils.py` | 部位样本表、expression 编译、组属性、删除 |
| `tools/rig/rbf_pose_driver_tool.py` | 窗口 |
| `tests/test_rbf_weight_math.py` | 纯数学单测（12 个） |
| `tests/rbf_pose_driver_maya_smoke_test.py` | Maya 真机冒烟（5 项） |

验证：

- `unittest discover`：72 个全过；
- mayapy 冒烟：总组/四组、11 部位生成、样本点权重 1、中立 0、删除全部。

## 8. 与方向门控版的对比

| | `pose_driver` | RBF 版 |
|---|---|---|
| 方向判断 | 逐轴 smoothstep 门 | 姿态距离 |
| 多关节联动 | 需要拆多个门 | 天然支持 |
| IK/FK | 部分部位依赖读法 | 读关节 local rotate |
| 输出组 | `grp_md_*_pose_001` | `grp_rbf_*_pose_001` |
| 曲线 | driven key 曲线可调 | 表达式内算，属性可再驱动 |

## 9. 已知限制

- 手指暂未纳入（需要 3 节 × 3 轴 = 9 维输入，后续扩展）；
- 样本按属性自动生成，暂不支持手动补录/覆盖；
- 核宽 45° 是统一值，不同部位可能想调（后续可暴露参数）。
