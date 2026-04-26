#!/bin/zsh
#
# Used by VSCode as a terminal profile to open every workspace inside its own
# tmux session. VSCode passes ${workspaceFolder} as $1.
#
# Behavior:
#   - Session name is "vscode-<sanitized-basename>" (no '.', ':', or spaces).
#   - If the session exists, attach. Otherwise create + attach.
#   - Falls back to a plain interactive zsh if tmux can't open a terminal
#     (e.g. some embedded terminals don't pass a controlling TTY).

emulate -L zsh
set -e

WORKSPACE="${1:-$PWD}"
RAW_NAME="${WORKSPACE:t}"          # zsh basename modifier
SAFE_NAME="${RAW_NAME// /_}"
SAFE_NAME="${SAFE_NAME//./_}"
SAFE_NAME="${SAFE_NAME//:/_}"
SESSION_NAME="vscode-$SAFE_NAME"

TMUX_PATH="/opt/homebrew/bin/tmux"

# Refuse to nest tmux sessions.
if [[ -n "${TMUX:-}" ]]; then
  exec /bin/zsh -l
fi

if [[ ! -x "$TMUX_PATH" ]]; then
  echo "tmux-script: tmux not found at $TMUX_PATH; falling back to zsh" >&2
  exec /bin/zsh -l
fi

# Try to attach/create. If tmux can't open a terminal (no controlling TTY,
# embedded terminal, etc.), drop into a plain login shell instead of failing.
if ! exec "$TMUX_PATH" new-session -A -s "$SESSION_NAME" -c "$WORKSPACE" 2>/tmp/tmux-script.err; then
  echo "tmux-script: tmux failed (see /tmp/tmux-script.err); falling back to zsh" >&2
  exec /bin/zsh -l
fi
