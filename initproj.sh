#!/bin/bash

# @author: Arjun Rajan, for my tmux workflow
#
# @how to use:
# 1. save this without .sh
# 2. rename it to whatever command u want (i chose "start")
# 2. chmod +x start
# 3. move this to $PATH
#
# @cli command: start <project name>
#
# @description:
# creates tmux session with session name as project name and 3 windows
#   1st and 2nd window in the project directory
#   3rd window in the $HOME directory
#   puts u in 1st window where u can just start working
#   if session already exists, it attaches to it

PROJECT_NAME="$1"

PROJECTS_DIR="$HOME/projects"

PROJECT_PATH="$PROJECTS_DIR/$PROJECT_NAME"

if [ ! -d "$PROJECT_PATH" ]; then
    echo "   project $PROJECT_NAME not found in $PROJECTS_DIR"
    exit 1
fi

# Attach if tmux session with same project name exist
tmux has-session -t "$PROJECT_NAME" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "   attaching to existing session: $PROJECT_NAME"
    tmux attach -t "$PROJECT_NAME"
    exit 0
fi

# Create new session with window 1 in project directory
tmux new-session -d -s "$PROJECT_NAME" -c "$PROJECT_PATH"

# Create window 2 in project directory
tmux new-window -t "$PROJECT_NAME":2 -c "$PROJECT_PATH"

# Create window 3 in home directory
tmux new-window -t "$PROJECT_NAME":3 -c "$HOME"

# Put me into the first window
tmux select-window -t "$PROJECT_NAME":1

# Attach to the session
tmux attach -t "$PROJECT_NAME"

