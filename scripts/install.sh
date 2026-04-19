#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(pwd)"
REPO_BASE="${KARPATHY_SKILLS_BASE_URL:-https://raw.githubusercontent.com/Vincent-A-Yang/karpathy-skills-anycoding/main}"

tool=""
output=""

usage() {
  printf '%s\n' "Usage: install.sh --tool <opencode|claude|cursor|universal> [--output <path>]"
}

fetch() {
  curl -fsSL "$1"
}

append_marked_block() {
  file_path="$1"
  marker="$2"
  content="$3"

  mkdir -p "$(dirname "$file_path")"

  if [ -f "$file_path" ] && grep -Fq "$marker" "$file_path"; then
    printf '%s\n' "Already installed in $file_path"
    return 0
  fi

  if [ -f "$file_path" ] && [ -s "$file_path" ]; then
    printf '\n\n%s\n\n%s\n\n%s\n' "$marker" "$content" "$marker" >> "$file_path"
  else
    printf '%s\n\n%s\n\n%s\n' "$marker" "$content" "$marker" > "$file_path"
  fi

  printf '%s\n' "Installed to $file_path"
}

write_file() {
  file_path="$1"
  content="$2"

  mkdir -p "$(dirname "$file_path")"
  printf '%s\n' "$content" > "$file_path"
  printf '%s\n' "Installed to $file_path"
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --tool)
      tool="$2"
      shift 2
      ;;
    --output)
      output="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf '%s\n' "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [ -z "$tool" ]; then
  usage >&2
  exit 1
fi

case "$tool" in
  opencode)
    content="$(fetch "$REPO_BASE/adapters/opencode/AGENTS.md")"
    append_marked_block "${output:-$ROOT_DIR/AGENTS.md}" "<!-- karpathy-skills-anycoding:opencode -->" "$content"
    ;;
  claude)
    content="$(fetch "$REPO_BASE/adapters/claude/CLAUDE.md")"
    append_marked_block "${output:-$ROOT_DIR/CLAUDE.md}" "<!-- karpathy-skills-anycoding:claude -->" "$content"
    ;;
  cursor)
    content="$(fetch "$REPO_BASE/adapters/cursor/.cursor/rules/karpathy-guidelines.mdc")"
    write_file "${output:-$ROOT_DIR/.cursor/rules/karpathy-guidelines.mdc}" "$content"
    ;;
  universal)
    content="$(fetch "$REPO_BASE/adapters/universal/SYSTEM_PROMPT.md")"
    append_marked_block "${output:-$ROOT_DIR/AGENTS.md}" "<!-- karpathy-skills-anycoding:universal -->" "$content"
    ;;
  *)
    printf '%s\n' "Unsupported tool: $tool" >&2
    exit 1
    ;;
esac
