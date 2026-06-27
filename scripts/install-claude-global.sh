#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="${HOME}/.claude"

GLOBAL_CLAUDE_SOURCE="${REPO_ROOT}/claude/global/CLAUDE.md"
GLOBAL_CLAUDE_TARGET="${CLAUDE_DIR}/CLAUDE.md"

SKILL_SOURCE="${REPO_ROOT}/skills/engineering-playbook-guardian"
SKILL_TARGET="${CLAUDE_DIR}/skills/engineering-playbook-guardian"

mkdir -p "${CLAUDE_DIR}/skills"

if [ ! -f "${GLOBAL_CLAUDE_SOURCE}" ]; then
  echo "Missing ${GLOBAL_CLAUDE_SOURCE}"
  exit 1
fi

if [ ! -d "${SKILL_SOURCE}" ]; then
  echo "Missing ${SKILL_SOURCE}"
  echo "Create skills/engineering-playbook-guardian/SKILL.md first."
  exit 1
fi

if [ -e "${GLOBAL_CLAUDE_TARGET}" ] && [ ! -L "${GLOBAL_CLAUDE_TARGET}" ]; then
  BACKUP="${GLOBAL_CLAUDE_TARGET}.backup.$(date +%Y%m%d%H%M%S)"
  echo "Backing up existing ${GLOBAL_CLAUDE_TARGET} to ${BACKUP}"
  mv "${GLOBAL_CLAUDE_TARGET}" "${BACKUP}"
fi

ln -sfn "${GLOBAL_CLAUDE_SOURCE}" "${GLOBAL_CLAUDE_TARGET}"
ln -sfn "${SKILL_SOURCE}" "${SKILL_TARGET}"

echo "Installed global Claude Code behavior:"
echo "  ${GLOBAL_CLAUDE_TARGET} -> ${GLOBAL_CLAUDE_SOURCE}"
echo "  ${SKILL_TARGET} -> ${SKILL_SOURCE}"
echo ""
echo "Restart Claude Code or run /memory to verify loaded instructions."
