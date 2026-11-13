# ai-workflow

Personal multi-agent development system for Claude Code (WSL Ubuntu, driven from T3 Code).

- `claude/` — global layer, symlinked into `~/.claude/` (CLAUDE.md, rules, agents, skills).
- `projects/` — personal per-project notes and registry (never copied into client repos).
- `templates/` — task document templates (spec, plan, review, report).
- `tasks/<project>/<task-id>/` — per-task artifacts.

Install on a new machine: clone to `~/ai-workflow`, then run `./install.sh`.
