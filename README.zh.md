# karpathy-skills-anycoding

受 Karpathy 启发的通用 AI 编程技能包，适用于多种 AI 编程工具、编码助手与自主 coding agent。

这个仓库把一组高价值的 coding 行为原则重组为“工具无关”的通用格式，可复用于 OpenCode、Claude Code、Cursor、Trae、OpenClaw 以及其他类似的 AI coding 工具。

## 为什么要做这个项目

很多 skills 项目本身很有价值，但常常绑定某一个工具入口或某一种插件形态。这个项目改为以一个统一核心 skill 为中心，再提供多种适配层。

因此，这个版本做了三件事：

1. 把核心原则抽离成一个工具无关的统一 skill 源
2. 为不同 AI 工具提供适配层
3. 保持内容足够短、足够强、足够可移植

## 这个项目解决什么问题

很多 AI 编程助手仍然容易出现这些问题：

- 替用户做错误假设
- 过度工程、过度抽象
- 顺手改动无关代码
- 在没有定义成功标准前就开始实现

这个项目的目标，是给 AI coding assistant 增加一层高信号、低噪音的行为约束，让它更像一个可靠的资深工程师：

- 先澄清歧义，再开始编码
- 先找最小正确解，再写代码
- 只改需要改的地方
- 用可验证的结果来定义完成

## 四个核心原则

本项目保留了原始思路里最重要的四条原则：

1. Think Before Coding
2. Simplicity First
3. Surgical Changes
4. Goal-Driven Execution

这些原则源自 Andrej Karpathy 对 LLM 编码失误模式的公开观察。

## 兼容性

本项目目前分为两类兼容性。

### 已确认的直接入口

这些工具有明确的项目级文件或规则入口，按约定路径放置后预期可直接生效：

- OpenCode：项目根目录 `AGENTS.md`
- Claude Code：项目根目录 `CLAUDE.md`
- Cursor：`.cursor/rules/karpathy-guidelines.mdc`

### 可迁移适配模板

这些适配文件可以直接复用，但是否自动加载仍取决于对应工具版本和其指令入口机制：

- Trae
- OpenClaw
- 通用系统提示词
- 通用 `SKILL.md` 风格技能包

如果你的工具支持以下任意一种机制，通常都可以直接使用本项目：

- 项目级说明文件
- 自定义技能
- 工作区规则
- Agent profile
- 系统提示词
- 启动 prompt
- 持久化 memory

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
    └── COMPATIBILITY.md
```

## 安装

### 一键安装到当前项目

以下命令会把对应适配文件安装到当前仓库。

### OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main/scripts/install.sh | bash -s -- --tool opencode
```

### Claude Code

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main/scripts/install.sh | bash -s -- --tool claude
```

### Cursor

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main/scripts/install.sh | bash -s -- --tool cursor
```

### 通用安装到自定义文件

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main/scripts/install.sh | bash -s -- --tool universal --output AGENTS.md
```

### PowerShell

```powershell
irm https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main/scripts/install.ps1 | iex
Install-KarpathySkills -Tool claude
```

安装脚本默认采用保守策略：

- 对 `CLAUDE.md` 和 `AGENTS.md`，如果文件已存在，会以带标记的块追加进去
- 对 Cursor，会直接写入专用规则文件
- 如果已经安装过同一块内容，会自动跳过，避免重复

如果你要自托管或本地测试，可以通过 `KARPATHY_SKILLS_BASE_URL` 覆盖脚本的下载源地址。

## 快速使用

### 方式 1：直接使用通用核心版本

将 `core/karpathy-anycoding.md` 的内容复制到你的工具所使用的项目指令、系统提示、工作区 memory 或自定义 skill 中。

### 方式 2：使用适配器版本

从 `adapters/` 中选择最接近你工具形态的版本直接使用。

### 方式 3：使用 Skill 包格式

如果你的平台支持 `SKILL.md` 风格的技能定义，可以直接使用 `skills/karpathy-guidelines/SKILL.md`。

## 推荐使用方式

### OpenCode

直接使用安装脚本，或把 `adapters/opencode/AGENTS.md` 放到项目根目录并命名为 `AGENTS.md`。

### Trae

优先使用 `adapters/trae/AGENTS.md`，将其放入 Trae 对应的工作区或 agent 指令入口。

### OpenClaw

优先使用 `adapters/openclaw/AGENTS.md`，作为项目级 agent policy 或启动提示。

### Claude Code

直接使用安装脚本，或把 `adapters/claude/CLAUDE.md` 放到项目根目录并命名为 `CLAUDE.md`。

### Cursor

直接使用安装脚本，或将 `adapters/cursor/.cursor/rules/karpathy-guidelines.mdc` 放到项目 `.cursor/rules/` 目录中。

### 其他 AI 编程工具

可以从 `adapters/universal/SYSTEM_PROMPT.md` 或 `core/karpathy-anycoding.md` 开始。

## 为什么这种方式会起效

本项目的核心内容是“行为规则”，而不是依赖某个插件私有逻辑的功能代码。只要 AI 工具有项目指令、规则文件、系统提示、agent profile 或类似入口，这些规则就有机会持续影响其行为。

因此，本项目最适合以下场景：

- 工具本身支持项目级规则或系统提示
- 你会把这些 rules 和仓库本身的工程规范一起使用
- 你希望 instruction 足够短、足够强，而不是被冗长说明稀释

## 这个版本与灵感来源的区别

本版本的关键改造点包括：

- 不再依赖单一插件生态
- 以一个通用核心文件作为事实来源
- 提供多个 AI 工具的适配层
- 保持内容精简，方便复制、拼接、迁移和组合

## 面向 GitHub 搜索与热门主题的描述方向

为了更容易被开发者搜索到，本项目的 README 和定位有意识地覆盖了当前 GitHub 上常见且相关的主题表达，例如：

- AI coding assistant
- coding agent
- autonomous software agent
- prompt engineering for coding
- developer productivity
- software engineering best practices
- Claude Code
- Cursor rules
- OpenCode
- Trae
- OpenClaw

这里的目标不是堆关键词，而是让真正需要“高质量 coding agent 行为规范”的用户更容易找到它。

## 采用建议

本项目最适合和你自己的仓库规则一起使用，例如：

- 编程语言约定
- 测试要求
- 框架约束
- PR / commit 规范
- 安全规则
- 部署要求

这个 skills 项目负责约束“行为方式”，不负责替代你项目本身的工程上下文。

## 项目化补充内容

- `CONTRIBUTING.md`：贡献说明
- `CODE_OF_CONDUCT.md`：协作行为规范
- `CHANGELOG.md`：版本变更记录
- `docs/COMPATIBILITY.md`：工具兼容性说明
- `scripts/install.sh` 与 `scripts/install.ps1`：一键安装脚本

## 致谢与归因

本项目受到以下内容启发并基于其进行改造：

- 灵感来源项目：[`multica-ai/andrej-karpathy-skills`](https://github.com/multica-ai/andrej-karpathy-skills)
- 原始思想来源：Andrej Karpathy 关于 LLM 编码常见问题的公开观点

感谢上游作者对这些原则做出的清晰提炼与初始包装。

## 许可证

MIT
