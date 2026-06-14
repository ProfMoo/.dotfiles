# ProfMoo's Dotfiles

## Quick Start

```bash
./install
```

Designed to be idempotent, so you should be able to safely run this multiple times.

## Git Config

The tracked `git/.gitconfig` contains shared, cross-machine defaults.

In contrast, use `~/.gitconfig.local` for every private or machine-specific Git setting:

* personal/work identity
* signing keys
* internal Git URLs

Dotbot creates ignored `git/.gitconfig.local` from `git/.gitconfig.local.example`
if missing, then symlinks `~/.gitconfig.local` to it.

Before running `./install`, move any private values from an existing
`~/.gitconfig` into `git/.gitconfig.local`.

Keep company email, signing keys, internal URLs, proxies, and tokens out of the
tracked config. Put them in `~/.gitconfig.local` instead.
