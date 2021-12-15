# Setup

## From A Fresh Install

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ProfMoo/.dotfiles/master/run)"
```

## If You've Already Checked Out The Repository

```bash
./run
```

## TODO

1. Provide .vscode configuration
2. Auto-format files
3. Figure out `.zsh_history` so that it works as expected (ex: what happens when you use kubie?)
4. Evaluate if I really need the `strap` tool. It seems to pick a really odd group of things to do (and not do). Could just pick the good bits and take it out.
5. Make everything idempotent (and not just fail if it's already been done)
