# karpathy-skills-anycoding

面向 OpenCode、Claude Code、Cursor、Trae、OpenClaw 等 AI 编程工具的通用 coding-agent skills。

[English](./README.md) | [简体中文](./README.zh.md)

## 安装的是行为，不是样板废话

大多数 AI 编程工具都会写代码。

但更少的工具能持续做到：

- 在需求有歧义时先停下来确认
- 优先选择最小正确实现
- 避免修改无关代码
- 在动手前先定义成功标准

这个项目提供的是一层紧凑的行为规则，让 coding agent 在多个工具里都更像一个靠谱的资深工程师。

## 这是什么

`karpathy-skills-anycoding` 是一个工具无关的通用 skill 包，目标是让 AI coding assistant 的行为更像务实的资深工程师。

它把一组高信号的工程行为原则整理成可复用的 instruction files、tool adapters 和一键安装脚本，让这些规则能在多种 AI 编程工具中复用。

## 它和普通 prompt 有什么不同

这个仓库的设计目标是：

- 可跨多个 AI 编程工具迁移
- 足够短，能持续影响模型行为
- 足够务实，能直接用于真实仓库
- 对兼容性诚实，不夸大支持范围

它不是一个巨大的万能提示词，而是一层专门约束 coding behavior 的轻量操作层。

## 为什么有人会用它

很多 coding agent 仍然容易：

- 替用户做错误假设
- 过度工程、过度抽象
- 修改无关代码
- 在没有定义成功标准前就开始实现

这个仓库的目标正好相反：

- 先澄清歧义
- 先找最小正确解
- 只做外科手术式改动
- 用明确检查来验证结果

## 四个核心原则

1. Think Before Coding
2. Simplicity First
3. Surgical Changes
4. Goal-Driven Execution

这些原则来源于 Andrej Karpathy 对 LLM 编码常见失误模式的公开观察。

## 一键安装

在你希望规则生效的项目目录里执行对应命令。

如果你的工具支持项目规则、指令文件、自定义 skill 或 system prompt，这个项目就提供了现成起点。

### OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/anycoding/scripts/install.sh | bash -s -- --tool opencode
```

### Claude Code

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/anycoding/scripts/install.sh | bash -s -- --tool claude
```

### Cursor

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/anycoding/scripts/install.sh | bash -s -- --tool cursor
```

### 通用安装

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/anycoding/scripts/install.sh | bash -s -- --tool universal --output AGENTS.md
```

### PowerShell

```powershell
irm https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/anycoding/scripts/install.ps1 | iex
Install-KarpathySkills -Tool claude
```

### 安装脚本会做什么

- `opencode`：把带标记的规则块追加到 `AGENTS.md`
- `claude`：把带标记的规则块追加到 `CLAUDE.md`
- `cursor`：直接写入 `.cursor/rules/karpathy-guidelines.mdc`
- `universal`：把通用规则块追加到指定目标文件，例如 `AGENTS.md`

如果同一块已经存在，安装脚本会跳过，避免重复写入。

## 支持的工具

### 已确认的直接入口

这些工具存在已知的项目级文件或规则入口，按约定路径安装后应该可以直接生效：

- OpenCode：项目根目录 `AGENTS.md`
- Claude Code：项目根目录 `CLAUDE.md`
- Cursor：`.cursor/rules/karpathy-guidelines.mdc`

### 可迁移适配模板

这些适配文件可以直接复用，但是否自动加载仍取决于工具版本和配置方式：

- Trae
- OpenClaw
- 其他基于 prompt 或 rules 的 coding agent

## 常见使用场景

- 让 AI coding assistant 少做过度工程
- 降低生成 diff 里的顺手重构和无关修改
- 给团队里的多种 AI 工具统一一层行为规范
- 不写超长系统提示词，也能快速提升 agent 表现
- 给新仓库快速加上一层更靠谱的 coding 行为规则

## 快速开始

### 方式 1：使用核心 skill

把 `core/karpathy-anycoding.md` 放到你的工具指令入口里。

### 方式 2：使用现成适配器

从 `adapters/` 里选择最接近你工具形态的文件，放到对应入口。

### 方式 3：使用可复用 skill 包

如果你的工具支持 `SKILL.md` 风格的可复用技能包，可以直接使用 `skills/karpathy-guidelines/SKILL.md`。

## 如何判断它是否真的起效

当这套 skill 开始起作用时，你通常会看到：

- 模型在实现前更愿意先澄清问题
- diff 更小，和任务无关的改动更少
- 第一次实现就更简单、更克制
- 完成时更倾向于给出明确验证，而不是模糊地说“应该好了”

## 仓库结构

```text
karpathy-skills-anycoding/
├── README.md
├── README.zh.md
├── LICENSE
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── .gitignore
├── core/
│   └── karpathy-anycoding.md
├── scripts/
│   ├── install.sh
│   └── install.ps1
├── skills/
│   └── karpathy-guidelines/
│       └── SKILL.md
├── adapters/
│   ├── claude/
│   │   └── CLAUDE.md
│   ├── cursor/
│   │   └── .cursor/
│   │       └── rules/
│   │           └── karpathy-guidelines.mdc
│   ├── opencode/
│   │   └── AGENTS.md
│   ├── openclaw/
│   │   └── AGENTS.md
│   ├── trae/
│   │   └── AGENTS.md
│   └── universal/
│       └── SYSTEM_PROMPT.md
└── docs/
    ├── ADOPTION.md
    ├── COMPATIBILITY.md
    └── GITHUB_METADATA.md
```

## 各工具推荐方式

### OpenCode

使用安装脚本，或把 `adapters/opencode/AGENTS.md` 放到项目根目录并命名为 `AGENTS.md`。

### Claude Code

使用安装脚本，或把 `adapters/claude/CLAUDE.md` 放到项目根目录并命名为 `CLAUDE.md`。

### Cursor

使用安装脚本，或将 `adapters/cursor/.cursor/rules/karpathy-guidelines.mdc` 放到 `.cursor/rules/`。

### Trae

从 `adapters/trae/AGENTS.md` 开始，把它放到 Trae 的 workspace instruction 或 agent profile 入口。

### OpenClaw

从 `adapters/openclaw/AGENTS.md` 开始，把它放到项目 instruction 或 bootstrap prompt 入口。

### 其他 AI 编程工具

从 `adapters/universal/SYSTEM_PROMPT.md` 或 `core/karpathy-anycoding.md` 开始。

## 为什么这种方式有效

本项目强调的是行为规则，而不是某个私有插件生态的功能代码。

因此，只要一个工具支持以下任意一种入口，这套规则通常就有机会持续影响它的行为：

- 项目说明文件
- rules 文件
- 自定义 skill
- system prompt
- workspace memory
- agent profile

它最适合与仓库自身的工程规范一起使用，例如语言约定、测试要求、框架模式和安全约束。

## FAQ

### 这个项目是不是只适合某一个 AI 工具？

不是。核心内容是工具无关的。部分 adapter 对应明确文件入口，部分则是可迁移模板。

### 它能保证代码质量一定变好吗？

不能。任何 prompt 都不能保证结果，但它能减少一些 coding agent 最常见的失误模式。

### 我是否应该用它替代仓库自己的工程规范？

不应该。它更适合作为行为层，再叠加你仓库自身的工程规则。

### 为什么不把所有内容都写进一个超长 prompt？

因为更短、更聚焦的行为规则通常更容易持续影响模型，也更容易维护。

## 仓库内包含的内容

- `core/karpathy-anycoding.md`：核心 skill 源文件
- `skills/karpathy-guidelines/SKILL.md`：可复用 skill 包
- `adapters/`：不同工具形态的适配文件
- `scripts/install.sh` 与 `scripts/install.ps1`：一键安装脚本
- `docs/COMPATIBILITY.md`：兼容性说明
- `docs/ADOPTION.md`：采用建议
- `docs/GITHUB_METADATA.md`：GitHub description、topics、social preview 建议文案

## 致谢与归因

本项目受到以下内容启发并基于其进行改造：

- 灵感来源项目：[`multica-ai/andrej-karpathy-skills`](https://github.com/multica-ai/andrej-karpathy-skills)
- 原始思想来源：Andrej Karpathy 关于 LLM 编码常见问题的公开观点

感谢上游作者对这些原则做出的清晰提炼与初始包装。

## 许可证

MIT
