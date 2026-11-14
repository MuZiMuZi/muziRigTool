# 面部绑定系统 · 设计稿（v0.2）

> 依据：`E:\BaiduNetdiskDownload\坐标绑定\笔记` 的 16 章 25 份笔记，
> 以及课程源文件 `素材类\axis_files\016_卡通面部绑定\` 里的原始脚本
> （`attach_joint_on_curve.py`、`connect_facial_joint.py`、`zip_lip.py` 等）。
> 本文先定结构和验收标准，代码按本文实现；改动先改本文。

---

## 一、目标与边界

**目标**：卡通角色面部，**关节为主 + 修型（BS）补充**。

**分工（重要）**：

| 谁做 | 做什么 |
|---|---|
| **脚本** | 关节、控制器、约束、曲线驱动、变形器、节点网络（remap / clamp / 相加）、属性驱动 |
| **脚本（初始值）** | 驱动曲线的 CV 权重：按区域整段分配，先给一套能用的初值 |
| **人（你）** | 角色模型准备、**模型顶点**蒙皮权重、BS 修正形状的雕刻 |

脚本**不碰模型顶点权重**：`skinCluster` 只负责建出来并留给手刷；
驱动曲线的 CV 权重由脚本给初值，后面想改可以随时在权重编辑器里手调。

**这里的「权重」分三种，别混**：

- **模型顶点权重**：脸、眼皮、嘴唇的顶点跟着哪些关节走 → 手刷，脚本不做。
- **曲线 CV 权重**：驱动曲线的每个 CV 归哪个曲线关节 → 脚本给初值
  （demo 里是 2 / 1 / 2 的硬分组，见 `core/brow_region_math.py`），可手改。
- **节点权重**：约束权重、`remapValue` 的 0-1 映射、拉链嘴的 `1/N` 权重 → 绑定逻辑，脚本建。

**本轮范围**（16 章，有笔记的部分）：

| 模块 | 笔记 | 状态 |
|---|---|---|
| 基础控制器（根 / 眼球 / 鼻子 / 口鼻） | 16-03 | 待做 |
| 下巴（旋转补位移） | 16-04 | 待做 |
| 眉毛（曲线驱动 + 三段控制器） | 16-06～09 | 待做 |
| 眼皮（曲线 + wire + 眨眼 + 跟随眼球） | 16-11～13、15 | 待做 |
| 嘴唇（三曲线驱动 + 嘴角） | 16-16、17 | 待做 |
| 拉链嘴（zip 0-1） | 16-26～29 | 待做 |
| 控制器联动（remap 网络） | 16-25 | 待做 |
| 面片区效果（脸颊 / 颈阔肌 / 脖子）**用 BS** | 16-21～24 | 待做（原 NURBS 面片方案降为备选） |
| 牙齿 / 舌头 | 16-30 | 待做 |

**暂不做**：写实 FACS（15 章）、Corrective 自动生成。

**口径调整（2026-11-14）**：脸颊、颈阔肌、脖子这些**面积型**形变改用
blend shape 目标体 + 驱动，不再用「NURBS 面片 + follicle 关节」那套
（笔记里的面片方案保留为备选，见 4.8）。关节继续负责基础形变。

---

## 二、分层

```text
Guide 层      resources/module_guide/face_guide.ma
              定位器 + 曲线，按 arm/leg 模板格式（zero 组包 locator）
                    │  Guide("face").import_template()
                    ▼
模块层        systems/rig/module/face/
              ├─ base.py        FaceModule：控制器风格 + locator 对 + 曲线工具
              ├─ jaw.py         下巴
              ├─ eye.py         眼球
              ├─ brow.py        眉毛（点曲线驱动）
              ├─ lid.py         眼皮（wire + 眨眼 + 跟随）
              ├─ lip.py         嘴唇（三曲线）
              ├─ zip.py         拉链嘴（zip 权重网络）
              ├─ soft_bs.py     面片区 BS：脸颊 / 颈阔肌 / 脖子（目标体 + 驱动）
              ├─ weight_init.py 权重初值：按距离铺底 + 左右镜像（可选）
              ├─ linkage.py     控制器联动（remap / mult / add / clamp）
              └─ corrective.py  修型 BS 的驱动接口
                    │  build_rig() / connect_rig()
                    ▼
连接层        控制器 → locator driver → locator driven → 关节
              （课程 connect_facial_joint.py 的做法）
                    ▼
蒙皮层        模块只建 skinCluster；顶点权重手刷
                    ▼
修型层        关节旋转 → BS 权重（driven key / RBF）
```

依赖方向：`face/* → module/base → core/*`；`face` 不 import `tools`。

---

## 三、命名方案

沿用五段式 `[type]_[side]_[part]_[function]_[index]`。

| 对象 | 名字 | 说明 |
|---|---|---|
| 根关节 | `jnt_md_face_root_001` | 建在 `ctrl_md_face_move_001` 位置 |
| 下颌关节 | `jnt_md_jaw_bind_001` | 枢轴 = `loc_md_jaw_start_bind_001` |
| 下巴尖 | `jnt_md_jaw_tip_001` | 末端 = `loc_md_jaw_end_bind_001` |
| 下巴控制 | `ctrl_md_jaw_main_001` | |
| 眼球关节 / 控制 | `jnt_lf_eye_bind_001` / `ctrl_lf_eye_main_001` | 都在 `loc_*_eye_ball_001` |
| 视线目标 | `loc_lf_eye_gaze_001` | 复制 `loc_lf_eye_aim_001` 位置，挂在控制器下 |
| 眉毛形变关节 | `jnt_lf_brow_bind_001~00N` | 蒙脸，同时挂曲线 |
| 眉毛控制 | `ctrl_lf_brow_in/mid/out_001` | 内 / 中 / 外 |
| 眉毛曲线 CV 定位器 | `loc_lf_brow_crv_001~00N` / `loc_lf_brow_aim_001~00N` | 生成驱动 / 目标曲线 |
| **曲线关节** | `jnt_lf_brow_crv_001~003` | 蒙驱动曲线；控制器经 zero_crv 驱动它 |
| 驱动 / 目标定位器 | `loc_lf_brow_drive_00N` / `loc_lf_brow_aim_00N` | 两条曲线上的位置 |
| 眼皮关节 | `jnt_lf_lidup_bind_001~00N` / `jnt_lf_lidlow_bind_001~00N` | 旋转轴心在眼球中心 |
| 眼皮曲线 CV 定位器 | `loc_lf_lidup_crv_001~00N` / `loc_lf_lidlow_crv_001~00N` | 生成上下驱动曲线 |
| 眼皮曲线 | `crv_lf_lidup_drive_001` / `crv_lf_lidlow_drive_001` | wire 驱动原始稠密曲线 |
| 眼皮控制 | `ctrl_lf_lidup_in/mid/out_001`、`ctrl_lf_lidlow_...`、`ctrl_lf_lid_corner_001` | 下排控制器旋转 180° |
| 嘴唇关节 | `jnt_md_lip_upper_bind_001~00N` / `..._lower_...` | 嘴角从中间编号 000 |
| 嘴唇曲线 | `crv_md_lip_upper_drive/face/up_001`、`crv_md_lip_lower_...` | 三曲线：位置 / 前向 / 向上 |
| 嘴唇控制 | `ctrl_md_lip_corner_lf_001` / `ctrl_md_lip_corner_rt_001` | 嘴角，带 zip 属性 |
| 拉链定位器 | `loc_md_lip_zip_001~00N` | 上下唇关节之间 50/50 |
| 拉链节点 | `remap_md_lip_zip_001`、`add_md_lip_zip_001`、`clamp_md_lip_zip_001` | |
| 面片区 BS 目标体 | `bs_lf_cheek_puff_001`、`bs_md_neck_platysma_001` | 目标体由人雕 |
| 面片区 BS 控制 | `ctrl_lf_cheek_puff_001`（0-1） | 驱动目标体权重 |
| 控制器连接 | `loc_lf_<part>_driver/driven_001` | locator 对 |
| 联动节点 | `mult_<drv>_<part>_001`、`add_<drv>_<part>_001`、`remap_<drv>_<part>_001` | 命名体现「谁驱动谁」 |

术语对照（避免和「控制器」混淆）：

| 术语 | 作用 | 是否蒙脸 |
|---|---|---|
| 控制器 ctrl | 动画师拖的东西 | 否 |
| 曲线关节 crv | 变形驱动曲线 | 否 |
| 形变关节 bind | 产生面部形变 | **是** |

---

## 四、模块规格

### 4.1 base.py · FaceModule

- `create_face_ctrl()`：小尺寸控制器，默认不继承目标旋转。
- `connect_ctrl_to_joint()`：控制器 → 关节，中间走 locator 对。
- `nearest_parameter()` / `point_on_curve()`：曲线查询，临时节点算完即删。
- `create_curve_from_locators()`：按定位器世界坐标生成 degree 3 曲线（眉毛 / 眼皮的曲线来源）。
- `add_float()`：驱动属性（下巴系数、zipHeight、blink 等）。
- `attach_joints_on_curve()`：课程脚本的等价实现，支持 `aim_type=object|curve`。

### 4.2 jaw.py

- Guide：`[根定位器, 下巴枢轴]`，2 个。
- 核心：`ctrl.rotateX × jawDropY / jawDropZ → connect 组 translateY / Z`。
- 系数挂控制器（默认 0.03 / -0.04）；取局部旋转、不用约束（会 cycle）。
- 下巴另加 `muscle joint`（16-21/24）：目标约束控 XYZ 缩放，`volume = (a'/a)^n`，
  短则胖、长则瘦。缩放网络 `mult` + `distanceBetween` 由脚本建，系数给属性。

### 4.3 eye.py

- Guide：`[眼球中心, up 参考点]`，2 个。
- 核心：`aimConstraint(ctrl, joint, aim=(1,0,0), up=(0,1,0), worldUpType=objectrotation, worldUpObject=up)`。
- **控制器默认放在眼球中心正前方 +6 单位**（`forward` 参数可调）：
  放在球心和关节重合时，目标约束的方向会退化。
- 控制器上有 `blink`(0-1) 与 `link`(0-1)：给眼皮模块用。

### 4.4 brow.py

- Guide：`[N 个眉毛形变关节]` + **驱动曲线定位器** + **目标曲线定位器** + up 物体。
- 两条曲线不再要求手画，**由定位器模板生成**：
  ```text
  loc_lf_brow_crv_001~00N   →  cmds.curve(degree=3) → crv_lf_brow_drive_001
  loc_lf_brow_aim_001~00N   →  cmds.curve(degree=3) → crv_lf_brow_aim_001
  ```
  CV 位置直接读定位器世界坐标，生成后曲线挂进模块的 nodes 组；
  想调形状就挪定位器再重建，或直接拖 CV（互为初值，不互相锁定）。
- 结构：

  ```text
  控制器（内 / 中 / 外）→ zero_crv → jnt_*_brow_crv_001~003
        → skinCluster 驱动曲线 → pointOnCurveInfo → jnt_*_brow_bind_001~00N → 脸
  ```

- 形变关节朝向：zero 组 `parentConstraint` 到驱动 attach；驱动 attach 用
  `aimConstraint` 盯住目标曲线上的 aim attach（`objectrotation` + up 定位器）；
  关节只匹配旋转后 `makeIdentity`，位置偏移保留。
- 曲线蒙皮权重：脚本给初值，按区域整段分配（demo 实测 5 CV → 2/1/2 的硬分组，
  见 `core/brow_region_math.discrete_region_weights`），之后可手调；模型顶点权重不碰。
- 验收：拖控制器→关节平滑跟随；X 轴始终指向目标曲线，无横向翻滚。

### 4.5 lid.py

- Guide：上下眼睑的**稠密曲线**（从模型边转换，degree 1，作为 wire 的变形目标）
  + 上下眼睑的**驱动曲线定位器**（模板给）+ 眼球关节 + up 物体。
- 驱动曲线同样由定位器生成：
  ```text
  loc_lf_lidup_crv_001~00N  →  cmds.curve(degree=3) → crv_lf_lidup_drive_001
  loc_lf_lidlow_crv_001~00N →  cmds.curve(degree=3) → crv_lf_lidlow_drive_001
  ```
  生成后若要「每区 4 段」，用 `rebuildCurve(spansPerSpan=…)` 或直接按定位器数量画。
- 朝向：眼皮不需要 aim 曲线，直接 `objectrotation` 盯**眼球关节**——
  轴心天然落在眼球中心（16-11 的核心）。
- 结构：
  ```text
  模型边曲线（degree 1，密集）──wire deformer←── 简化驱动曲线（degree 3）
                                                    ▲ skinCluster
                                          曲线关节（内 / 中 / 外）
  ```
  - 每个 CV 一个关节，旋转轴心统一在眼球中心（目标约束到眼球）。
  - 眼球转动 → 眼皮跟随：父子约束加权，上 0.46～0.6、下 0.28，**打断旋转通道**。
- 眨眼：复制上眼皮驱动曲线 → `blendShape` 混合 → `blink`(0-1) 驱动；
  `link/height`(0-1) 经 `reverse` 控制贴近上还是下眼皮。BS 必须排在 wire 之后。
- 下排控制器旋转 180°，禁用 Z 位移。
- 驱动曲线的 CV 权重同样由脚本给初值（整段分组），**眼皮顶点权重手刷**。
- 验收：`blink=1` 完全闭合、`link=0.8` 时贴上眼皮；眼球转 20°，眼皮跟随约 9°/5.6°。

### 4.6 lip.py

- Guide：嘴唇 5 个控制点（中 1、两侧各 1、嘴角各 1）+ 三条曲线（位置 / 前向 / 向上）。
- 核心：`attach_joints_on_curve(..., aim_type='curve')`，`worldUpType='object'`，
  上方向取第三条曲线上的对应点（下巴转动时各点旋转量不同，单曲线不够）。
- 上下唇分开建，关节列表从左到右；嘴角从中间编号 000。
- 验收：下巴转动时嘴唇随动、不穿插；关节不脱离曲线（距离 < 0.01）。

### 4.7 zip.py

- 输入：上唇关节列表、下唇关节列表、两个嘴角控制器、下巴控制器。
- 节点：
  ```text
  zip(0-1) → remapValue（每关节一条，左右镜像公式）
            → addDoubleLinear → clamp 0-1 → 约束权重
  下巴 zipHeight(默认 0.5) → reverse → 中间 locator 的高度权重
  ```
  左：`max(0, zipWeight*(i - falloff))`；右：`max(0, zipWeight*(N-i+1 - falloff))`；
  `zipWeight = 1/N`，`falloff` 默认 3。
- 每个关节：中间 locator（50/50 双目标约束）+ offset 组，offset 组挂到关节上层组。
- 验收：`zip=0` 完全张开、`zip=1` 完全闭合、`zip=0.5` 半闭合且从嘴角向中间推进。

### 4.8 soft_bs.py · 面片区 BS（脸颊 / 颈阔肌 / 脖子）

- 定位：这三块是**面积型**形变（鼓气是中间高、四周递减；颈纹是上下牵拉），
  关节做不顺，改成 **blend shape 目标体**。
- 脚本负责的只有「驱动」：
  ```text
  控制器属性（如 0-1）── driven key / remap ──▸ blendshape.targetWeights[i]
  关节旋转（如下巴抬头）── driven key ──▸ 下巴褶皱 BS
  ```
- 命名：
  - 目标体：`bs_lf_cheek_puff_001`、`bs_md_neck_platysma_001`
  - 控制器：`ctrl_lf_cheek_puff_001`（0-1，keyable）
  - BS 节点：`bsn_md_face_001`（已有则追加目标，不新建）
- 校验：同一目标体被多处驱动时，权重用 `addDoubleLinear` + `clamp 0-1` 合并，
  避免叠加越界（和 16-25 的联动同一套节点）。
- 备选方案（笔记原做法，先不做）：NURBS 面片蒙到关节 + `follicle` 布点，
  用 `remapValue`/`blendColors` 改 UV 的 V 值。
- 验收：`ctrl=0` 时原始形态、`ctrl=1` 时目标形态；两个控制器同时拉满不越界。

### 4.9 linkage.py · 控制器联动

- 一套可复用的节点组：
  ```text
  控制器 output/connect → remapValue(0-1) → mult(系数) → addDoubleLinear → clamp → 目标
  ```
- 支持：单向驱动（鼻翼 0.15）、多向叠加（法令纹 X3.5/Y-0.5 + 脸部 X1.5/Y0.5）、
  双边相乘（两个嘴角都收 → 中间凸 0.35）、condition 比例跟随（内 50% / 外 100%）。
- 命名：`mult_<drv>_<part>_001`、`remap_<drv>_<part>_001`，如 `mult_lipCornerOut_nasolabial_001`。
- 验收：主控制器拉到极限，被驱动部位按系数复现，不出现越界或抖动。

### 4.10 corrective.py · 修型接口

```text
add_driven_corrective(control, blendshape, target,
                      drive_attr="rotateX", start=0.0, full=30.0)
```

- 关节/控制器到 `start` 权重 0，到 `full` 权重 1；复杂情况走项目已有 RBF。
- **BS 目标体由人雕**，脚本只连驱动。

### 4.11 weight_init.py · 权重初值（可选）

蒙皮是面部最耗人的一步，这里只做「铺底 + 镜像」，最终形态仍由人决定：

```text
顶点 → 到各关节的距离 → 倒数距离权重（取最近 N 个）→ 归一化 → skinPercent
左半边 → copySkinWeights / mirror 到右半边
```

- 纯数学部分在 `core/face_weight_math.py`（不 import maya，可单测）：
  `inverse_distance_weights(position, joint_positions, power=2.0, max_influences=4)`。
- 影响数默认 4，符合多数引擎/项目规范；`power` 越大过渡越硬。
- 验收：每个顶点权重和 = 1、影响数 ≤ 4、最近关节权重最大。
- 不做：权重平滑、笔刷模拟、wrap 替代方案（后续再说）。

---

## 五、Guide 模板

按 `arm_guide.ma` 格式新增 `resources/module_guide/face_guide.ma`：

```text
grp_md_face_guide_001
├─ zero_md_face_guide_001
│   ├─ loc_md_face_root_guide_001          根
│   ├─ loc_md_face_jaw_guide_001           下巴枢轴
│   ├─ loc_lf_face_eye_guide_001           左眼球
│   ├─ loc_lf_face_eyeup_guide_001         左眼 up
│   ├─ loc_lf_brow_bind_001~009            左眉形变关节
│   ├─ loc_lf_brow_crv_001~007             左眉驱动曲线的 CV
│   ├─ loc_lf_brow_aim_001~007             左眉目标曲线的 CV
│   ├─ loc_lf_lidup_crv_001~009            左上眼皮驱动曲线的 CV
│   ├─ loc_lf_lidlow_crv_001~009           左下眼皮驱动曲线的 CV
│   └─ loc_rt_...（镜像）
└─ 眼、眉、眼皮各一套
```

**曲线全部由定位器生成**（`face/base.py · create_curve_from_locators()`）：

```text
loc_*_brow_crv_001~00N   → cmds.curve(degree=3) → crv_lf_brow_drive_001
loc_*_brow_aim_001~00N   → cmds.curve(degree=3) → crv_lf_brow_aim_001
loc_*_lidup_crv_001~00N  → cmds.curve(degree=3) → crv_lf_lidup_drive_001
```

定位器只提供 CV 位置（世界坐标），曲线建在模块自己的 nodes 组下；
想改形状就挪定位器重建，或者直接拖 CV——两者互为初值，不互相锁定。

模板只给**起点位置**，导入后把定位器贴到模型上再建绑定——和 arm/leg 用法一致。
嘴唇、脸颊、颈阔肌的曲线/面片是跟着模型走的，直接从场景选，不进模板。

---

## 六、必须补的底层工具（core）

| 工具 | 用途 | 现有情况 |
|---|---|---|
| `remapValue` / `clamp` / `addDoubleLinear` 封装 | 联动、拉链嘴 | 无，需新增 `core/remap_utils.py` |
| `wire` 变形器封装 | 眼皮曲线 | 无 |
| `follicle` 布点 | 睫毛 / 毛发（可选） | 无 |
| `blendShape` 权重驱动封装 | 眨眼、修型 | 无 |
| 曲线权重（按 CV 位置） | 眉毛/眼皮驱动曲线 | 已有 `brow_region_math` 思路，可复用 |

---

## 七、构建顺序

```text
M1  base + jaw + eye               （不依赖曲线）
M2  brow                           （点曲线 + 三段控制器）
M3  lid                            （wire + 眨眼 + 跟随）
M4  lip                            （三曲线）
M5  zip                            （remap 权重网络）
M6  linkage                        （remap 复用）
M7  soft_bs                        （脸颊 / 颈阔肌 / 脖子的 BS 驱动）
M8  weight_init                    （权重初值 + 镜像）
M9  corrective                     （修型 BS 驱动）
M10 face_tool                      （界面）
```

每个里程碑单独提交，配 mayapy 冒烟测试。

---

## 八、验收清单（Maya 2023 / mayapy）

- [ ] jaw：转控制器，关节 Y/Z 位移 = 角度 × 系数（误差 < 1e-4）。
- [ ] eye：移动控制器，眼球 X 轴指向控制器（夹角 < 1°）。
- [ ] brow：形变关节到驱动曲线 < 0.01；抬眉时 X 轴不翻滚。
- [ ] lid：`blink=1` 时上下眼皮闭合；眼球转动时眼皮按权重跟随。
- [ ] lip：下巴转动时嘴唇随动，关节不脱离曲线。
- [ ] zip：`zip=0/0.5/1` 三档闭合形态正确，左右镜像对称。
- [ ] linkage：极限值下被驱动部位复现系数，clamp 不越界。
- [ ] weight_init：每顶点权重和 = 1、影响数 ≤ 4、最近关节权重最大。
- [ ] 所有模块 `delete_rig()` 后，场景无本模块残留节点。
- [ ] 纯 Python 测试（无 Maya）：区域权重和 = 1、zip 权重公式边界正确、权重初值归一化。

---

## 九、还缺的笔记

| 缺什么 | 影响 | 是否需要 |
|---|---|---|
| 16-18 嘴唇_003_连接控制器 | 嘴唇控制器怎么连、组怎么分 | **需要** |
| 16-20 颧骨和法令纹 | 颧骨/法令纹控制器的做法 | 需要 |
| 16-10 眉毛_006_权重、16-14 眼皮_004_权重、16-19 嘴唇_004_权重 | 全是顶点权重 | **不需要**（手刷） |
| 15 章 FACS 全套 | 写实脸 | 本轮不做 |

---

## 十、模板与坐标（课程版 face_guide）

`face_guide.ma` 已替换成课程版（`face_layer_demo` 同款）：

```text
grp_md_face_guide_001
└─ ctrl_md_face_move_001                整体位移控制器（模板自带）
   ├─ grp_md_brow_guide_001             loc_*_brow_main_bind_001 + loc_*_brow_bind_001~005 + crv_*_brow_guide_001
   ├─ grp_md_ear_guide_001              loc_*_ear_bind_001~003
   ├─ grp_md_eye_guide_001
   │   ├─ grp_md_eye_bags_guide_001     眼袋曲线 + 定位器
   │   ├─ grp_md_eye_ball_guide_001     loc_*_eye_ball_001 → iris → aim
   │   └─ grp_md_eye_lid_guide_001      上/下眼皮曲线 + 定位器
   ├─ grp_md_jaw_guide_001              loc_md_jaw_start_bind_001 → jaw_end
   ├─ grp_md_lip_guide_001              上/下唇曲线 + 嘴角 / 唇部定位器
   ├─ grp_md_nose_guide_001             口鼻 / 鼻子定位器
   ├─ grp_md_teeth_guide_001            上/下牙
   ├─ grp_md_tongue_guide_001           舌头 5 节
   └─ grp_md_zygoma_guide_001           颧骨 3 点
```

几件事：

1. **朝向**：从 `loc_*_eye_ball_001` 到 `loc_*_eye_aim_001` 的方向就是脸朝前（当前模板是 +Z），
   上方向 +Y。模块**不写死朝向**，全部按定位器的世界位置建，所以模板怎么摆都行。
2. **位置/尺度**：模板坐标由使用者调整，脚本只读定位器名，不依赖绝对坐标。
3. **面部各部位全部在 `ctrl_md_face_move_001` 下**：移动这个控制器能整体挪脸；
   建绑定后各模块的 jnt / ctrl 组默认独立，后续可以挂到它下面。
4. 模板里 `crv_*_guide_001` 是 degree 1 的引导曲线，模块生成驱动曲线时**不直接用它**，
   只用它的 CV 位置当参考（或按定位器重建 degree 3 曲线）。

---

## 十一、待确认

1. **嘴唇曲线来源**：从模型边转换（16-16 的做法），还是手画？
2. **BS 目标体**：已定由你雕，脚本只连驱动——确认一下就行。
