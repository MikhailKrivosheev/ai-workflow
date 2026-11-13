#!/usr/bin/env python3
"""Merge permission lists from settings.base.json into ~/.claude/settings.json (additive only)."""
import json, os, shutil, sys

base_path, target_path = sys.argv[1], os.path.expanduser("~/.claude/settings.json")
base = json.load(open(base_path))
target = json.load(open(target_path)) if os.path.exists(target_path) else {}
if os.path.exists(target_path):
    shutil.copy2(target_path, target_path + ".bak")
perms = target.setdefault("permissions", {})
added = 0
for kind, items in base.get("permissions", {}).items():
    lst = perms.setdefault(kind, [])
    for it in items:
        if it not in lst:
            lst.append(it); added += 1
json.dump(target, open(target_path, "w"), indent=2, ensure_ascii=False)
print(f"settings.json: added {added} permission entries")
