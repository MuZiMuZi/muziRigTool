# muziRigTool

面向 **Autodesk Maya 2023** 的模块化 Rigging 框架。

> **当前状态：基建阶段。**
> 包入口、测试入口、CI 与文档骨架已就绪，业务模块从零开始按阶段加入。
> 本仓库不继承 `muziToolset` 的历史代码，两者可并存：旧库保持可用，新库承担重构后的架构。

---

## 环境要求

```text
Maya 2023（内置 Python 3.9）
PySide2（Maya 2023 自带）
```

工具集以 Maya `scripts` 目录形式部署，仓库根目录本身即 Python Package：

```text
C:\Users\<user>\Documents\maya\scripts\muziRigTool
```

因此 Maya 中可以直接：

```python
import muziRigTool

print(muziRigTool.__version__)
```

---

## 目录规划

```text
muziRigTool/
├─ app/              Maya 应用入口、主工具箱、窗口生命周期
├─ ui/               公共 PySide Theme、Window、可复用 Widget
├─ core/             Maya / Python 通用能力（无 Rig 业务语义）
├─ systems/          完整 Rig Module 与可重复构建的工作流
├─ tools/            绑定师直接使用的小工具
├─ resources/        Controller Shape、Guide 模板、图标
├─ tests/            静态门禁与不带 Maya 的单元测试
└─ docs/             设计文档与 API Reference
```

依赖方向恒定向下，不允许反向 import：

```text
app ──→ tools ──→ systems ──→ core
                  ui 为上层提供公共界面能力
```

新增目录之前先问一句：它属于「原子能力」「业务单元」还是「用户入口」——三者分别落在 `core`、`systems`、`tools`。

---

## 开发

不依赖 Maya 的检查（提交前跑一遍）：

```powershell
python -m compileall -q .
python -m unittest discover -s tests -v
```

依赖 Maya 的验证必须在 Maya 2023 的 Script Editor 或 `mayapy` 中执行，不进 CI。

---

## 约定

| 项 | 规则 |
|---|---|
| 模块 / 函数 / 变量 | `snake_case` |
| 类 | `PascalCase` |
| 方向标记 | `lf` / `rt` / `md` |
| Maya 节点命名 | `[type]_[side]_[part]_[function]_[index]` |
| 提交信息 | `feat(scope) / fix(scope) / docs(scope) / refactor(scope) / test(scope) / chore(scope)` |

原则：文档跟随源码提交；上层不复制下层的算法；公开 API 必须写 docstring。

---

## 许可证

[木兰宽松许可证，第2版](LICENSE)（Mulan PSL v2）。
