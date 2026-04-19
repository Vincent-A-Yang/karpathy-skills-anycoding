# karpathy-skills-anycoding

Universal, reusable coding-agent skills for OpenCode, Claude Code, Cursor, Trae, OpenClaw, and other AI coding tools.

[English](./README.md) | [简体中文](./README.zh.md)

## What this is

`karpathy-skills-anycoding` is a tool-agnostic skill pack that helps AI coding assistants behave more like pragmatic senior engineers.

It turns a small set of high-signal engineering behaviors into reusable instruction files, adapters, and install scripts that work across multiple coding-agent tools.

## Why people use it

Many coding agents still tend to:

- make silent assumptions
- overengineer solutions
- edit unrelated code
- start coding before defining success criteria

This repository pushes them toward the opposite behavior:

- clarify ambiguity first
- prefer the smallest correct solution
- make surgical diffs
- verify outcomes against concrete checks

## The four principles

1. Think Before Coding
2. Simplicity First
3. Surgical Changes
4. Goal-Driven Execution

These principles are inspired by Andrej Karpathy's public comments about common LLM coding failure modes.

## Install in one command

Use the installer that matches your tool and run it inside the repository where you want the rules to apply.

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

### Universal install

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/anycoding/scripts/install.sh | bash -s -- --tool universal --output AGENTS.md
```

### PowerShell

```powershell
irm https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/anycoding/scripts/install.ps1 | iex
Install-KarpathySkills -Tool claude
```

## Supported tools

### Confirmed direct instruction surfaces

These have known file or rule entry points and should work directly when installed to the expected path:

- OpenCode via project-root `AGENTS.md`
- Claude Code via project-root `CLAUDE.md`
- Cursor via `.cursor/rules/karpathy-guidelines.mdc`

### Portable adapter templates

These adapters are included as ready-to-use templates, but exact auto-loading behavior depends on the tool version and configuration model:

- Trae
- OpenClaw
- other prompt-driven or rules-driven coding agents

## Quick start

### Option 1: use the core skill

Copy `core/karpathy-anycoding.md` into your tool's instruction surface.

### Option 2: use a ready-made adapter

Pick the closest file from `adapters/` and place it where your tool expects project instructions.

### Option 3: use the reusable skill package

If your tool supports a `SKILL.md`-style reusable package, use `skills/karpathy-guidelines/SKILL.md`.

## Repository structure

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

## Recommended setup by tool

### OpenCode

Use the installer or copy `adapters/opencode/AGENTS.md` to your project root as `AGENTS.md`.

### Claude Code

Use the installer or copy `adapters/claude/CLAUDE.md` to your project root as `CLAUDE.md`.

### Cursor

Use the installer or place `adapters/cursor/.cursor/rules/karpathy-guidelines.mdc` in `.cursor/rules/`.

### Trae

Start from `adapters/trae/AGENTS.md`, then place it into Trae's workspace instruction or agent profile surface.

### OpenClaw

Start from `adapters/openclaw/AGENTS.md`, then place it into the tool's project instruction or bootstrap prompt surface.

### Other AI coding assistants

Start from `adapters/universal/SYSTEM_PROMPT.md` or `core/karpathy-anycoding.md`.

## Why this approach works

This project focuses on behavioral instructions, not tool-private plugin logic.

That makes it portable across tools that support any of the following:

- project instructions
- rules files
- custom skills
- system prompts
- workspace memory
- agent profiles

It works best when combined with repository-specific engineering rules such as language conventions, testing requirements, framework patterns, and security constraints.

## Included files

- `core/karpathy-anycoding.md`: source-of-truth core skill
- `skills/karpathy-guidelines/SKILL.md`: reusable skill package
- `adapters/`: tool-specific or tool-shaped variants
- `scripts/install.sh` and `scripts/install.ps1`: one-command installers
- `docs/COMPATIBILITY.md`: compatibility notes
- `docs/ADOPTION.md`: adoption guidance
- `docs/GITHUB_METADATA.md`: suggested GitHub description, topics, and social preview copy

## Attribution

This project is inspired by and adapted from:

- Source inspiration: [`multica-ai/andrej-karpathy-skills`](https://github.com/multica-ai/andrej-karpathy-skills)
- Original idea source: Andrej Karpathy's comments on common LLM coding pitfalls

Respect and thanks to the upstream author for the original distillation and packaging.

## License

MIT
