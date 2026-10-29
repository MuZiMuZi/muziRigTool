# Jntbas 基准关节工具：原理与实现

> 所属工具：`tools/rig/jntbas_tool.py`  
> Core：`core/rigging/jntbas_utils.py`  
> 适用：次级控制器链（`uvpin → zero → driven → space → connect → offset → ctrl`）
>
> 实现状态（2026-10-29）：Core / Tool / 测试已落地；Maya 冒烟 5/5，单元测试 58/58。

---

## 1. 要解决的问题

次级控制器（secondary controller）在跟随模型表面移动时，很容易出现**双倍位移**：

```text
父级移动
├─ 网格跟着移动一次
└─ 蒙皮骨骼也跟着移动，skinCluster 再算一次
   → 网格看起来动了两次
```

次级控制器的核心不是「让它跟随表面」，而是：

> **让父级移动时，蒙皮不产生任何形变；只有骨骼自己的局部运动才变形。**

实现这个目标的关键，是 `skinCluster` 的 `bindPreMatrix`。

---

## 2. skinCluster 的公式

Maya 的线性蒙皮可以粗略写成：

```text
V' = Σ w(k) × bindPreMatrix(k) × drivenMatrix(k) × V
```

其中：

| 符号 | 含义 |
|---|---|
| `V` | 绑定姿态下的点 |
| `drivenMatrix(k)` | 骨骼 k 当前的世界矩阵，连接到 `skinCluster.matrix[k]` |
| `bindPreMatrix(k)` | 骨骼 k 在绑定瞬间的世界逆矩阵 |
| `w(k)` | 权重 |

绑定的时候，`bindPreMatrix = inverse(骨骼绑定世界矩阵)`。

如果父级移动，`drivenMatrix` 会变，但 `bindPreMatrix` 还是原来的静态逆矩阵，两者乘积不再是绑定时的状态，于是产生形变。

---

## 3. 核心做法：让 bindPreMatrix 动态跟随

如果我们让：

```text
bindPreMatrix(k) = inverse(jntbas(k) 的世界矩阵)
```

并且 `jntbas` 和 `jnt` **在同一个父级下、绑定姿态完全重合**，那么：

```text
bindPreMatrix(k) × drivenMatrix(k)
= inverse(jntbasWorld) × jntWorld
```

当父级移动时：

- `jntbasWorld` 跟着父级动
- `jntWorld` 也跟着父级动
- 两者的父级部分互相抵消
- 只剩 `jnt` 自己的局部运动

所以：

- 移动 `zero_*` / `uvpin_*`：不产生形变
- 旋转 `subctrl_*` / `jnt_*`：正常变形

这就是「jntbas 吃逆矩阵」的原理。

---

## 4. 为什么 jntbas 挂在 zero 下、和 jnt 同位置

推荐层级：

```text
uvpin_*
└ zero_*
  ├ jntbas_*        ← 和 jnt_* 同位置、同朝向的兄弟
  └ driven_*
    └ space_*
      └ connect_*
        └ offset_*
          └ ctrl_*
            ├ subctrl_*
            └ output_*
              └ jnt_*
```

原因：

1. `jntbas` 在 `zero` 下，所以 `zero` / `uvpin` 移动时会跟着动
2. `jntbas` 与 `jnt` 在绑定姿态完全重合，`inverse(jntbasWorld) × jntWorld` 才会只剩局部 delta
3. `jntbas` 不能挂在 `ctrl` / `output` 下：它需要代表「父级基准」，而不是跟着次级控制器走
4. `jntbas` **不需要**加入 `skinCluster` 的 influence；它只提供 `bindPreMatrix` 的逆矩阵来源

---

## 5. 节点连接

对每根 `jnt_*`：

```text
jntbas_lf_cuff_sub_001.worldInverseMatrix[0]
        ↓
skinCluster.bindPreMatrix[<jnt 的 influence 索引>]
```

- `worldInverseMatrix` 本身就是逆矩阵，不需要再建 `inverseMatrix` 节点
- 索引必须和 `skinCluster.matrix[i]` 里 `jnt` 的索引一致
- 可以用 `cmds.skinCluster(skin, query=True, influence=True)` 的顺序来定位

示意：

```python
influences = cmds.skinCluster(skin, query=True, influence=True) or []
index = influences.index("jnt_lf_cuff_sub_001")

cmds.connectAttr(
    "jntbas_lf_cuff_sub_001.worldInverseMatrix[0]",
    "{}.bindPreMatrix[{}]".format(skin, index)
)
```

---

## 6. 和 `inverseMatrix + multMatrix` 的区别

| 方式 | 做法 | 适用 |
|---|---|---|
| `multMatrix` | `jntWorld × inverse(parent)` → `skinCluster.matrix[i]` | 想直接改 drivenMatrix，或做 Delta 矩阵 |
| `bindPreMatrix` | `jntbas.worldInverseMatrix` → `skinCluster.bindPreMatrix[i]` | 次级控制器的标准做法，节点更少 |

两者都能消双倍位移，但 `bindPreMatrix` 更贴近次级控制器的经典原理，也不需要给每根骨骼再建 `inverseMatrix`。

---

## 7. 工具行为

`JntbasTool` 提供两个入口：

- **处理全部 jnt_***：扫描全场 `jnt_*`
- **处理选中 jnt_***：只处理当前选择的 `jnt_*`

每根骨骼的处理逻辑：

1. 检查它是不是 `joint`
2. 向上找 `zero_*` 父级
3. 检查它是否被至少一个 `skinCluster` 使用
4. 在 `zero_*` 下创建同位置的 `jntbas_*`（已存在则复用）
5. 对每个 skinCluster，把 `jntbas.worldInverseMatrix[0]` 接到 `bindPreMatrix[index]`
6. 如果 `bindPreMatrix` 已有其他连接，记录冲突并跳过，不强行覆盖

命名：

```text
jnt_lf_cuff_sub_001  →  jntbas_lf_cuff_sub_001
```

---

## 8. 使用步骤

1. 在**绑定姿态 / rest pose** 下打开工具
2. 确认 `zero_*` 和 `uvpin_*` 也处于绑定姿态
3. 点「处理全部 jnt_*」或选中若干 `jnt_*` 后点「处理选中 jnt_*」
4. 检查状态栏：
   ```text
   新建 X，复用 Y，连接 Z，冲突 A，跳过 B，失败 C
   ```
5. 验证：
   - 移动 `zero_*` / `uvpin_*`：网格只整体移动，不应出现二次形变
   - 旋转 `subctrl_*` / `jnt_*`：局部形变仍然正常

---

## 9. 注意与边界

- **绑定姿态**：`jntbas` 的绑定世界矩阵优先从 `bindPreMatrix` 反推；但 `zero_*` 自身必须在绑定姿态，否则 `jntbas` 的 local 会带上姿态偏移。
- **已有连接**：如果 `bindPreMatrix` 已经被 `multMatrix` 或其他节点连接，工具会跳过并报冲突，不会覆盖。
- **多套蒙皮**：同一根 `jnt_*` 被多个 `skinCluster` 使用时，会逐个连接对应索引；如果多个蒙皮的绑定姿态不同，需要人工确认。
- **subctrl 不受影响**：`jntbas` 只抵消父级 `zero` / `uvpin` 的运动；`subctrl` 驱动 `jnt` 的局部运动仍然保留，这正是次级形变。
- **不要给 jntbas 加动画**：它是基准关节，不应被约束或 key 驱动，否则补偿会失效。

---

## 10. 参考

- [次级控制器核心原理讲解](https://blog.csdn.net/huadingjin/article/details/81073941)：`bindPreMatrix` 与 `drivenMatrix` 互逆的核心推导。
- [UV Pin 工具设计](UV_PIN_TOOL_DESIGN.md)：本工具的上游 `uvpin_*` 组来源。

---

## 11. 后续可扩展

1. 处理「只选中模型」时自动找它所有 skinCluster 的 influences
2. 支持从 `bindPreMatrix` 反推 `zero` 的绑定姿态，做到任意姿态可执行
3. 提供「移除 jntbas / 恢复原 bindPreMatrix」的反向操作
4. 在工具里显示每个 `zero_*` 链的处理结果列表
