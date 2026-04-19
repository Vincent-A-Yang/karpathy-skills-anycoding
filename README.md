# karpathy-skills-anycoding

Universal Karpathy-inspired skills and instruction packs for AI coding assistants, coding agents, and autonomous software engineering tools.

This repository repackages a strong set of coding behaviors into a tool-agnostic format that can be reused across OpenCode, Claude Code, Cursor, Trae, OpenClaw, and similar AI coding tools.

## Why this project exists

Many skill repositories are useful but tightly coupled to one product surface. This project instead centers everything around a single universal skill source, then ships adapters for multiple instruction surfaces.

The goal is simple:

- one core skill
- many tool adapters
- minimal vendor lock-in
- easy reuse in any coding agent workflow

## What problem this solves

Many AI coding assistants still tend to:

- make silent assumptions
- overengineer solutions
- change unrelated code
- act before defining success criteria

This repository gives your coding agent a small, strong behavioral layer that pushes it toward:

- clarifying ambiguity before implementation
- choosing the simplest correct solution
- making surgical diffs instead of broad rewrites
- defining verifiable goals and looping until they pass

## Core principles

The skill keeps the same four high-value principles:

1. Think Before Coding
2. Simplicity First
3. Surgical Changes
4. Goal-Driven Execution

These principles are derived from Andrej Karpathy's public comments about common LLM coding failure modes.

## Supported usage styles

This repository is designed for any of these patterns:

- project-level instruction file
- reusable local skill or prompt pack
- agent memory / system prompt seed
- editor rule file
- team-wide engineering agent policy
- copy-paste guidance for one-off sessions

## Compatibility

This repository currently covers two compatibility levels.

### Confirmed direct instruction surfaces

These have known file or rule entry points and are expected to work directly when installed into the correct path:

- OpenCode via project-root `AGENTS.md`
- Claude Code via project-root `CLAUDE.md`
- Cursor via `.cursor/rules/karpathy-guidelines.mdc`

### Portable adapter templates

These are included as ready-to-use instruction packs, but exact auto-loading behavior depends on the tool version and how that tool exposes project instructions:

- Trae
- OpenClaw
- generic coding agents and prompt-based tools

If your tool supports any kind of persistent instructions, project rules, workspace memory, custom skills, agent profiles, or startup prompt, this repository should be usable with little or no change.

## Repository structure

```text
karpathy-skills-anycoding/
├── README.md
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

## Install

### One-line install for the current project

These commands install the adapter into the current repository.

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

### Universal install to a custom file

```bash
curl -fsSL https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main/scripts/install.sh | bash -s -- --tool universal --output AGENTS.md
```

### PowerShell

```powershell
irm https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main/scripts/install.ps1 | iex
Install-KarpathySkills -Tool claude
```

The installer is intentionally conservative:

- for `CLAUDE.md` and `AGENTS.md`, it appends a marked block if the file already exists
- for Cursor, it writes the dedicated rule file in `.cursor/rules/`
- if the block is already installed, it skips duplicate insertion

For self-hosting or testing, you can override the source with `KARPATHY_SKILLS_BASE_URL`.

## Quick start

### Option 1: Use the universal source

Copy the contents of `core/karpathy-anycoding.md` into your tool's project instruction file, system prompt, memory, or custom skill.

### Option 2: Use a tool adapter

Pick the closest ready-made adapter from `adapters/` and place it where your tool expects project-level instructions.

### Option 3: Use the skill format directly

If your platform supports a reusable `SKILL.md`-style package, use `skills/karpathy-guidelines/SKILL.md`.

## Recommended installation by tool

### OpenCode

Use the installer above or copy `adapters/opencode/AGENTS.md` into your project root as `AGENTS.md`.

### Trae

Start from `adapters/trae/AGENTS.md`, then place the content into the instruction surface Trae uses for your workspace or agent profile.

### OpenClaw

Start from `adapters/openclaw/AGENTS.md`, then use it as your project agent policy or bootstrap prompt.

### Claude Code

Use the installer above or copy `adapters/claude/CLAUDE.md` into your project root as `CLAUDE.md`.

### Cursor

Use the installer above or place `adapters/cursor/.cursor/rules/karpathy-guidelines.mdc` in your project's `.cursor/rules/` directory.

### Any other AI coding assistant

Use `adapters/universal/SYSTEM_PROMPT.md` or `core/karpathy-anycoding.md` as the starting point.

## Why this works

The instructions in this repository are intentionally short and behavioral rather than tool-API-specific. That makes them portable.

They do not depend on hidden plugin logic. They depend on a simple fact shared by most coding agents: if a tool reads project instructions, those instructions can shape behavior.

That means this repository is most effective when:

- the tool already supports project instructions, rules, or system prompts
- you combine these skills with repository-specific engineering rules
- you keep the instruction layer concise enough to remain influential

## How this version differs from the source inspiration

This adaptation intentionally changes the packaging model:

- removes dependence on one plugin ecosystem
- centers the project on a single universal source of truth
- adds ready-to-adapt variants for multiple coding-agent tools
- keeps the principles minimal so they remain broadly portable

## GitHub discovery focus

This repository is intentionally described in terms commonly used across GitHub and current AI coding workflows:

- AI coding assistant
- coding agent
- autonomous software agent
- prompt engineering for coding
- Claude Code
- Cursor rules
- OpenCode
- Trae
- OpenClaw
- developer productivity
- software engineering best practices

The intention is not keyword stuffing. It is to make the project easier for developers to actually find when searching for high-signal instruction packs for coding agents.

## Adoption advice

These guidelines work best when merged with project-specific rules such as:

- language conventions
- testing requirements
- framework patterns
- commit or PR expectations
- security and deployment constraints

This skill should shape behavior, not replace repository-specific engineering context.

## Included project files

- `CONTRIBUTING.md` for contribution expectations
- `CODE_OF_CONDUCT.md` for open source collaboration norms
- `CHANGELOG.md` for release tracking
- `docs/COMPATIBILITY.md` for honest tool-by-tool compatibility notes
- `scripts/install.sh` and `scripts/install.ps1` for one-line installation

## Attribution

This project is inspired by and adapted from:

- Source inspiration: [`multica-ai/andrej-karpathy-skills`](https://github.com/multica-ai/andrej-karpathy-skills)
- Original idea source: Andrej Karpathy's comments on common LLM coding pitfalls

Respect and thanks to the upstream author for the original distillation and packaging.

## License

MIT
