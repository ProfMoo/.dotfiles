# OpenCode config

Manages `~/.config/opencode/`. Two-tier: `shared/` (tracked) + `local/` (gitignored).

## Build

```sh
scripts/build_opencode_config
```

Deep-merges `shared/<name>.base.json` + `local/<name>.local.json` (local wins) →
`~/.config/opencode/<name>.json`. Auto-runs via `dotbot` (`./install`).

## Update

| Want to change | Edit | Then |
|---|---|---|
| Public opencode.json default (perms, etc.) | `opencode/shared/opencode.base.json` | `scripts/build_opencode_config` |
| Private opencode.json overlay (providers, MCPs, secrets) | `opencode/local/opencode.local.json` | `scripts/build_opencode_config` |
| Public AGENTS.md | `opencode/shared/AGENTS.md` | `scripts/build_opencode_config` |
| Private AGENTS.md additions | `opencode/local/AGENTS.md` | `scripts/build_opencode_config` |
| Static shared file (dcp.jsonc, etc.) | `opencode/shared/<file>` | nothing — symlinked |
| Add a new merged JSON `<name>.json` | create `shared/<name>.base.json`, optionally `local/<name>.local.json`, add `merge_json "<name>"` to `scripts/build_opencode_config` | `scripts/build_opencode_config` |
| Add a new concat'd file | create `shared/<name>`, optionally `local/<name>`, add `concat_md "<name>"` to `scripts/build_opencode_config` | `scripts/build_opencode_config` |

> **Not managed: `tui.json`** — cbcode regenerates it on each launch (adds its own plugins). Don't track or merge.

## Skills

`scripts/install_skills` installs agent skills via `npx skills add <repo>`.

| Want to | Edit |
|---|---|
| Add a public skill (shared across machines) | `opencode/shared/skills.txt` |
| Add a private/work skill | `opencode/local/skills.txt` (gitignored; see `skills.txt.example`) |

Run manually any time:

```sh
scripts/install_skills
```

Auto-runs on `./install`. Idempotent — re-installing an existing skill updates it.

## Bootstrap on a new machine

```sh
./install                                          # symlinks + initial build
cp opencode/local/opencode.local.json.example \
   opencode/local/opencode.local.json              # then edit secrets
scripts/build_opencode_config                      # rebuild
```
