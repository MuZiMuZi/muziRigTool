# 调研：旧库工具普查 + Zoo Tools 绑定模块

调研日期：2026-10-22

结论先说：

1. 旧库 20 个工具里，**11 个值得移植**，但都要重写依赖，不能直接搬。
2. Zoo 绑定系统的核心不是工具，是**分层 + ID 映射 + 子系统**这套架构，
   以及 IK/FK 切换那套矩阵算法。

---

## 一、Zoo Tools 绑定模块

安装位置：

```
C:\Users\X\Documents\maya\2023\scripts\zootoolspro\install\packages\
```

绑定相关的代码分布：

```
zoo_maya\...\zoo\libs\maya\cmds\rig\     底层命令（controls 2925 行、splines 1719 行）
zoo_hive\...\library\components\         绑定组件（arm / vchain / fk / finger / godnode）
zoo_hive\...\library\tools\commands\rig\ 操作命令（ikfkswitch、buildrigs 等）
```

### 1.1 六层结构

每个绑定组件都有六个层，这是 Zoo 最核心的设计：

| 层 | 作用 | 我们的对应概念 |
|---|---|---|
| guideLayer | 引导层，只存关节位置，可反复重建 | 我们的骨骼模板/定位 |
| deformLayer | 变形关节，真正蒙皮的那套 | Jnt |
| rigLayer | 控制器层，动画师操作的对象 | Ctrl |
| inputLayer | 输入层，接收父组件传递的变换 | 暂无 |
| outputLayer | 输出层，把结果传给子组件 | 暂无 |
| controlPanel | 控制面板，ikfk / stretch 等属性 | 暂无 |

关键点：**deformLayer 和 rigLayer 是两套独立的关节/控制器**。
绑定时 deform 层负责变形，rig 层负责驱动，中间用约束或矩阵连接。
这样重建控制器不会破坏蒙皮权重。

### 1.2 ID 映射

每个组件声明一份映射表，把同一个 ID 在四层里的节点对应起来：

```python
def idMapping(self):
    deformIds = {"upr": "upr", "mid": "mid", "end": "end"}
    inputIds = {"upr": "upr", "end": "end", "upVec": "upVec"}
    outputIds = {"upr": "upr", "mid": "mid", "end": "end"}
    rigLayerIds = {"upVec": "upVec"}
    return {
        DEFORM_LAYER_TYPE: deformIds,
        INPUT_LAYER_TYPE: inputIds,
        OUTPUT_LAYER_TYPE: outputIds,
        RIG_LAYER_TYPE: rigLayerIds,
    }
```

好处：组件拼装时，父组件的 output 可以直接对应到子组件的 input，
不需要知道对方的节点名。

### 1.3 IK/FK 切换的数学

这是最值得学的部分。Zoo 没有用「复制位置」这种粗暴做法。

**切到 IK**（`switchToIk`）：

```python
# 保存过一次初始偏移 constant_ikfkEndOffset
originalOffset = constants.constant_ikfkEndOffset.value()

# 从变形关节反算 IK 控制器位置
endMatrix = (originalOffset.inverse()
             * deformJoints[2].worldMatrix()
             * endik.parentInverseMatrix())
endik.setMatrix(endMatrix)

# 极向量位置用几何算
pvPosition = skeletonutils.poleVectorPosition(
    deformJoints[0].translation(),
    deformJoints[1].translation(),
    deformJoints[2].translation(),
    distance=...
)
upVec.setTranslation(pvPosition, space=kWorldSpace)
```

**切到 FK**（`switchToFk`）：

```python
# 直接把变形关节的世界矩阵给 FK 控制器，但清掉缩放
for jnt, ctrl in zip(deformJnts, controls):
    mat = jnt.worldMatrix()
    mat.setScale((1, 1, 1), kWorldSpace)
    ctrl.setWorldMatrix(mat)
```

**混叠**（`_blendTriNodes`）：

不切换状态，而是用 `blendMatrix` 在 IK 和 FK 之间插值：

```python
blendMat = createDG("blendMatrix")
ik.worldMatrix[0] -> blendMat.inputMatrix
fk.worldMatrix[0] -> blendMat.target[0].child(0)
ikfk_attr       -> blendMat.target[0].child(2)   # 权重

blendMat.outputMatrix -> multMatrix -> blendOutput.offsetParentMatrix
```

`ikfk` 属性 0~1 直接控制混合比例，动画师可以拉出中间状态。

### 1.4 可见性切换

```python
revNode = createReverse(inputs=[ikfk], outputs=[])
# ikfk = 1（FK）时 reverse = 0，IK 控制器隐藏
revNode.outputX.connect(ikRootCtrl.visibility)
revNode.outputX.connect(each_ik_ctrl_shape.visibility)
# FK 控制器跟随 ikfk 显示
ikfk.connect(each_fk_ctrl_shape.visibility)
```

一个 reverse 节点解决两套控制器的互斥显示。

### 1.5 子系统

`ArmComponent` 继承 `VChainComponent`，额外挂两个子系统：

```python
def createSubSystems(self):
    systems["twists"] = TwistSubSystem(...)   # 扭转关节
    systems["bendy"] = BendySubSystem(...)    # 弯曲控制器
    return systems
```

子系统是可选功能，由 guideSetting 开关控制：

```python
hasTwists = guideSettings["hasTwists"].value
hasBendy = guideSettings["hasBendy"].value
```

每个子系统有自己的 `setupGuide` / `setupRig` / `mirror` 钩子，
主组件在对应阶段遍历调用。

### 1.6 对 muziRigTool 的启发

按优先级排：

**高价值，建议吸收**

1. **deform / rig 分层**。我们现在的 `module/bone.py` 已经有
   `build_setup` / `build_rig` 两段，但关节只在 rig 阶段创建。
   如果后面要重绑控制器，没有独立的蒙皮关节层会很痛苦。

2. **IK/FK 切换用 offset 矩阵**，不要用位置拷贝。
   `constant_ikfkEndOffset` 这个思路可以直接用。

3. **blendMatrix 混叠**，比布尔切换更专业，也不难实现。

4. **ID 映射表**。组件拼装时靠 ID 而不是节点名，这是可组装 rig 的前提。

**中价值，看情况**

5. 空间切换（space switch）的 UI 数据结构（driven/drivers 列表）。
6. 可见性 reverse 节点。

**低价值，暂时不碰**

7. 拉伸系统（stretch）——节点图很重，需要 graph registry 支撑。
8. 子系统（twist / bendy）——依赖前面的分层，先有骨架再说。

---

## 二、旧库 muziToolset 工具普查

20 个工具，按「移植价值 × 成本」分类。

### 2.1 已经处理

| 工具 | 行数 | 状态 |
|---|---:|---|
| basic/rename_tool | 383 | ✅ 已移植（core/common/rename_utils.py） |
| controller/create_ctrl_tool | 898 | ✅ 已重写（工具 + ctrl_utils） |

### 2.2 值得移植

| 工具 | 行数 | 说明 | 建议 |
|---|---:|---|---|
| basic/attr_tool | 578 | 属性批量编辑、锁定、隐藏 | 移植，删掉旧主题依赖 |
| basic/connections_tool | 892 | 连接/断开、矩阵连接 | 移植，但砍掉一半功能 |
| basic/constraint_tool | 549 | 约束创建与管理 | 移植，正好支撑 IK/FK |
| basic/snap_tool | 74 | 吸附 | 直接移植，最小 |
| jnt/jnt_tool | 1052 | 关节编辑 | 移植核心（朝向、镜像、半径） |
| rig/rig_tool | 1352 | 绑定组装 | 只取思路，不移植代码 |
| clean/hierarchy_cleaner | 391 | 层级清理 | 直接移植 |
| clean/model_checker | 534 | 模型检查 | 移植，规则可扩展 |
| skin/skin_tool | 466 | 蒙皮辅助 | 移植 |
| controller/control_shape_tool | 903 | 改形状/颜色/大小 | 移植，新库已有 Ctrl 能力 |
| controller/create_fk_ctrl_tool | 167 | 批量建 FK 控制器 | 移植，逻辑简单 |

### 2.3 需要重写

| 工具 | 行数 | 原因 |
|---|---:|---|
| rig/rig_tool | 1352 | 和旧 scene_utils / 旧模块体系绑太死 |
| rig/modular_rig_tool | 35 | 只是入口壳，逻辑在别处 |
| rig/skirt_ctrl_tool | 293 | 裙子专用，依赖旧曲线系统 |

### 2.4 暂缓

| 工具 | 行数 | 原因 |
|---|---:|---|
| blendshape/add_blendshape_tool | 453 | 面部方向，等绑定主线做完 |
| blendshape/invert_shape_tool | 251 | 同上 |
| face/face_rig_tool | 35 | 占位壳 |
| face/face_select_key_tool | 609 | 面部选键，专用流程 |

### 2.5 移植成本在哪

旧工具普遍依赖这些 core 模块，新库都没有：

```
core/common/scene_utils.py       undo_chunk、场景清理、选择
core/common/hierarchy_utils.py   DAG 深度、子孙查询
core/common/transform_utils.py   矩阵、匹配变换
core/rigging/constraint_utils.py 约束创建
core/rigging/snap_utils.py       吸附
```

其中 `undo_chunk`、`DAG 深度`、`子孙查询` 这次已经内联进 `rename_utils` 了，
说明这些基础件可以按需内联，不必先建一个大而全的 core。

**结论：移植顺序应该是「基础件 → 小工具 → 大工具」。**

```
第一批   snap_tool（74 行）→ 验证流程
第二批   hierarchy_cleaner（391）→ model_checker（534）
第三批   attr_tool（578）→ constraint_tool（549）
第四批   skin_tool → control_shape_tool → jnt_tool
第五批   rig_tool 按 Zoo 的分层思路重写，不移植
```

---

## 三、下一步建议

两条线可以并行，但不要同时开太多：

**线 A：补基础件**

从 `snap_tool`、`hierarchy_cleaner` 开始，把 `scene_utils` / `hierarchy_utils`
里真正需要的函数陆续内联到 `core/common/`。
每移植一个工具，就补一两个基础函数。

**线 B：绑定主线**

按 Zoo 的分层思路，先把 `systems/rig/module/` 的关节层和控制器层分开：

```
deform 关节（蒙皮用）
rig 控制器（动画用）
两者用约束或矩阵连接
```

这是后面做 IK/FK 的地基。建议在移植完 `snap_tool` 和 `constraint_tool` 之后
再动这条线，因为约束能力是必需的。

---

## 附：Zoo 值得单独精读的文件

```
vchaincomponent.py       716 行  IK/FK 全流程
armcomponent.py          227 行  子系统挂载方式
ikfkswitch.py            243 行  切换命令 + 撤销 + 烘焙
controls.py             2925 行  控制器系统（后面再看）
splines.py              1719 行  样条（脊柱/尾巴用）
```
