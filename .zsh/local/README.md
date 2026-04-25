# Local-only zsh config

Anything in this directory (other than this README and `example.zsh`) is
**gitignored**. Use it for work-specific or otherwise private shell config you
don't want checked into a public dotfiles repo.

## How it works

`.zsh/aliases.zsh` automatically sources every `*.zsh` file in this directory
(via `~/.zsh/local/*.zsh`) when a new shell starts. The sourcing happens after
the public aliases, so local files can override anything defined upstream.

## Usage

Drop any `*.zsh` file in here, e.g.:

```sh
cp .zsh/local/example.zsh .zsh/local/aliases.zsh
$EDITOR .zsh/local/aliases.zsh
```

Then `,sz` (or open a new shell) to pick up the changes.

Files added here will not show up in `git status`.
