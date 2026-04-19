# Compatibility

## Compatibility levels

### Confirmed direct support

These tools have known instruction file entry points reflected in this repository.

#### OpenCode

- expected path: project-root `AGENTS.md`
- confidence: high
- basis: OpenCode documentation describes `/init` generating `AGENTS.md`

#### Claude Code

- expected path: project-root `CLAUDE.md`
- confidence: high
- basis: Claude Code documentation uses `CLAUDE.md` as project instructions

#### Cursor

- expected path: `.cursor/rules/karpathy-guidelines.mdc`
- confidence: high
- basis: Cursor rules are designed for project-level instruction files

### Portable templates

These adapters are provided because the behavioral content is portable, but this repository does not claim that a single fixed filename is guaranteed to auto-load across all versions.

#### Trae

- status: portable adapter template
- recommended use: copy into Trae's workspace instruction or agent profile surface

#### OpenClaw

- status: portable adapter template
- recommended use: copy into the tool's project instruction or bootstrap prompt surface

#### Other tools

- use `core/karpathy-anycoding.md` or `adapters/universal/SYSTEM_PROMPT.md`
- map the content into whatever instruction mechanism the tool supports
