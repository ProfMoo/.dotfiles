#!/bin/zsh

# Strip the path and leave the folder name
folder_name="$(basename $(git rev-parse --show-toplevel))"

# Construct the session name
SESSION="$folder_name"

# Attach to Tmux (or create a new session if needed)
if [ -z "$TMUX" ]; then
    # We're not inside Tmux
    echo "We're not inside tmux"

    if [ -z "$(tmux ls | grep $SESSION)" ]; then
        echo "Create a new session and attaching..."
        tmux new -s "$SESSION"
    fi

    echo "Attaching to already existing session '$SESSION'"
    tmux attach-session -d -t "$SESSION"
else
    # We're inside of Tmux
    echo "Already inside of tmux"
    if [ -z "$(tmux ls | grep $SESSION)" ]; then
        echo "Create a new dettached session..."
        tmux new -s "$SESSION" -d
    fi

    echo "Switching to the correct tmux session"
    tmux switch-client -t "$SESSION"

fi
