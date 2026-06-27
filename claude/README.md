# Claude Code Integration

This directory contains global Claude Code behavior derived from the Engineering Playbook.

## Global behavior

`claude/global/CLAUDE.md` is intended to be installed at:

```text
~/.claude/CLAUDE.md
```

This makes the Engineering Playbook discipline available across Carlos's software projects.

## Global skill

The reusable skill lives at:

```text
skills/engineering-playbook-guardian/SKILL.md
```

It should be installed globally at:

```text
~/.claude/skills/engineering-playbook-guardian/SKILL.md
```

## Install

Run:

```bash
./scripts/install-claude-global.sh
```

The installer uses symlinks, so updates to this repository update the global Claude behavior after pulling the latest changes.

## Verify

In Claude Code, run:

```text
/memory
```

and confirm that `~/.claude/CLAUDE.md` is loaded.

You can invoke the skill directly with:

```text
/engineering-playbook-guardian
```

## Notes

This is user-level behavior.

Project-specific `CLAUDE.md` files may add local rules.

If project rules conflict with the Engineering Playbook, Claude should flag the conflict instead of silently choosing one.
