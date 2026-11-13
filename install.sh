#!/bin/bash
# Links the global layer into ~/.claude. Refuses to overwrite anything that is not already our symlink.
set -euo pipefail
W="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.claude/skills
link() { # $1 target in repo, $2 link path
  if [ -L "$2" ]; then ln -sfn "$1" "$2"; echo "relinked $2";
  elif [ -e "$2" ]; then echo "SKIP $2 exists and is not a symlink — resolve manually";
  else ln -s "$1" "$2"; echo "linked $2"; fi
}
link "$W/claude/CLAUDE.md" ~/.claude/CLAUDE.md
link "$W/claude/rules"     ~/.claude/rules
link "$W/claude/agents"    ~/.claude/agents
for s in "$W"/claude/skills/*/; do if [ -d "$s" ]; then link "${s%/}" ~/.claude/skills/"$(basename "$s")"; fi; done
python3 "$W/tools/merge_settings.py" "$W/claude/settings.base.json"
