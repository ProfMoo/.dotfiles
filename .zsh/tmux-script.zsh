#!/bin/bash

# This script is used in VSCode to spin up a new tmux session for each VSCode window.
# The session name is passed as an argument to the script and is derived from the VSCode project that's open.

SESSION_NAME=$1

echo "Session name: $SESSION_NAME"

# Use full path to tmux
TMUX_PATH="/opt/homebrew/bin/tmux"
echo "Tmux path: $TMUX_PATH"

# Check if tmux is available
if [ ! -x "$TMUX_PATH" ]; then
    echo "Error: tmux not found at $TMUX_PATH"
    exit 1
else
    echo "Tmux found at $TMUX_PATH"
fi

# Create or attach to the tmux session
$TMUX_PATH new-session -A -s vscode-$SESSION_NAME -d
