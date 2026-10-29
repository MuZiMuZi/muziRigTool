# 变形器权重转蒙皮

> 位置：`core/deformation/deformer_weight_utils.py`（算法）、`tools/skin/deformer_weight_tool.py`（窗口）
> 关系：这是「转换」，不是「复制」。跨模型或变形器之间的权重复制不在本工具范围内。

---

## 1. 它做什么

把变形器上已经画好的 per-vertex 权重，写进 `skinCluster` 里指定骨骼的权重列：

```text
变形器 weightList[v]  ->  skinCluster.weightList[v].weights[joint 列]
```

典型流程：

1. 用 `cluster` 在模型上刷出一块局部修型区域；
2. 想让这块区域改由某根骨骼驱动；
3. 把 cluster 的权重搬到那根骨骼上，归一化后删掉 cluster。

---

## 2. 在 Maya 里怎么用

```python
from muziRigTool import launch
launch.launch()
```

打开「蒙皮工具」分类，双击「变形器权重转蒙皮」。

界面填三项：

| 字段 | 说明 |
|---|---|
| 模型 | 必须已经绑好 `skinCluster` |
| 变形器 | 权重来源，可逗号分隔多个 |
| 目标骨骼 | 接收权重的关节，与变形器按顺序一一对应 |

点「从选择自动识别」会按节点类型自动拆分当前选择（关节 / 网格 / 变形器），不用手动填。

也可以在脚本里直接调：

```python
from muziRigTool.core.deformation import deformer_weight_utils

result = deformer_weight_utils.apply_deformer_weights(
    "mesh_body",
    "cluster1",
    "jnt_lf_hand_bind_001",
    mode="replace",
    normalize=True,
)
```

---

## 3. 三种混合模式

| 模式 | 计算 | 用途 |
|---|---|---|
| `replace` | `新值 = 变形器权重 × 强度` | 整列替换，把某根骨骼改成变形器的形状 |
| `add` | `新值 = 原值 + 变形器权重 × 强度` | 在现有权重上叠加一块影响 |
| `multiply` | `新值 = 原值 × 变形器权重 × 强度` | 用变形器权重当作遮罩，削弱某根骨骼 |

`强度` 只是写入前的缩放系数，不改变模式语义。

---

## 4. 权重从哪读

| 变形器类型 | 读取的属性 |
|---|---|
| `blendShape` | `inputTarget[g].inputTargetGroup[t].targetWeights` |
| 其它变形器 | `weightList[g].weights` |

`targetWeights` 的 `t` 由界面的 `BlendShape Target` 决定，默认 0。

---

## 5. 边界与已知限制

- **`lattice` 不支持**。它的 `weightList` 按控制点存，长度和 mesh 顶点数对不上，会被长度校验拦下并报错。
- **0 权重会被 Maya 丢掉**。写入 0 的顶点，Maya 会把该影响从 `weightList[v]` 里剔除，所以 `getAttr("weightList[v].weights")` 的行长度是可变的。读回要用 `MFnSkinCluster.getWeights`（工具内部就是这么读的）。
- **不归一化时行和可能超过 1**。`normalize=False` 且原权重接近 1 时，Maya 会在脚本编辑器刷「权重总计可能会超出 1.0」的警告。这是提示，不是写入失败。
- **变形器与蒙皮的顺序不校验**。工具只搬权重，不保证删除变形器后形变完全一致：变形器在 `skinCluster` 下游时，删掉它会把形状交还给蒙皮。
- **一个变形器只对应一根骨骼**。多个变形器请用批量接口，数量必须与关节数一致，否则直接报错。

---

## 6. 测试

纯算法（不依赖 Maya，CI 可跑）：

```powershell
python -m unittest discover -s tests -v
```

真机冒烟（需要 Maya 2023）：

```powershell
& "C:\Program Files\Autodesk\Maya2023\bin\mayapy.exe" `
    "tests\deformer_weight_maya_smoke.py"
```

覆盖：读取权重、覆盖写入、归一化、自动添加影响、批量配对、删除变形器、错误输入。

---

## 7. 相关文件

- `core/deformation/weight_math.py`：纯数组运算（切行、混合、归一化、配对校验），无 Maya 依赖。
- `core/deformation/deformer_weight_utils.py`：Maya 读写与主流程。
- `tools/skin/deformer_weight_tool.py`：界面，放进 `tools/skin/` 后由工具箱自动注册。
- `tests/test_weight_math.py`：纯 Python 单测。
- `tests/deformer_weight_maya_smoke.py`：mayapy 冒烟测试。
