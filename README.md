# ProfMoo's Dotfiles

## Quick Start

```bash
./install
```

Designed to be idempotent, so you should be able to safely run this multiple times.

## Git Config

The tracked `git/.gitconfig` contains only shared, non-secret defaults. It always
loads `~/.gitconfig.local` last.

Use `~/.gitconfig.local` for every private or machine-specific Git setting:

* personal/work identity
* signing keys
* internal Git URLs
* credential helpers, proxies, and tokens
* editor, diff/merge tools, and local paths
* optional `includeIf` rules for separate personal/work files

Dotbot creates ignored `git/.gitconfig.local` from `git/.gitconfig.local.example`
if missing, then symlinks `~/.gitconfig.local` to it.

Before running `./install`, move any private values from an existing
`~/.gitconfig` into `git/.gitconfig.local`.

Keep company email, signing keys, internal URLs, proxies, and tokens out of the
tracked config. Put them in `~/.gitconfig.local` instead.

## TODO

* Ensure the Last.FM API Key isn't leaked
