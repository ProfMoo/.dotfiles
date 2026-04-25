# OpenCode local overlay

Everything in this directory (other than this README and `*.example` files) is
**gitignored**. Use it for OpenCode config you don't want in a public repo:

* Provider URLs / API keys
* MCP server credentials (GitHub PATs, DB passwords, etc.)
* Internal-only model defaults
* Internal-only agent prompts

## Files

* `opencode.local.json` — deep-merged into `opencode/shared/opencode.base.json`
  to produce `~/.config/opencode/opencode.json`. **Local wins on conflicts.**
* `tui.local.json` — deep-merged into `opencode/shared/tui.base.json` to
  produce `~/.config/opencode/tui.json`. Optional. See `tui.local.json.example`.
* `*.example` files — tracked, intended as templates.

## Workflow

```sh
# Edit overrides
$EDITOR opencode/local/opencode.local.json

# Rebuild merged config
scripts/build_opencode_config
```

## Gotchas

* Keep top-level keys consistent with the base. `jq` deep-merges objects but
  arrays are replaced wholesale by the right-hand side. If you set
  `permission.bash` in local, it replaces the entire shared bash allowlist.
* Don't commit secrets. The git ignore rules should prevent it but double-check
  with `git status` before pushing.
