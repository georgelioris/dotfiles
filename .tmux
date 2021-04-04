#!/bin/env zsh
SESSION="aerity"
alias tmux="TERM=screen-256color tmux"
RESIZE="tmux resize-pane -t $SESSION:vim.1 -x 50"
set -e

if tmux has-session -t $SESSION 2> /dev/null; then
  tmux attach -t $SESSION
  exit
fi

tmux -f $HOME/.config/tmux/.tmux.conf new-session -d -s $SESSION -n vim

# 1. Main Window
tmux send-keys -t $SESSION:vim "$RESIZE && cd client" Enter
tmux send-keys -t $SESSION:vim "vim -c GFiles" Enter
tmux split-window -t $SESSION:vim -h
tmux split-window -t $SESSION:vim.right -v
tmux send-keys -t $SESSION:vim.1 "cd client && yarn dev"
tmux send-keys -t $SESSION:vim.2 "cd client && git status" Enter

# 1. Git - Node server - Tests
tmux new-window -t $SESSION -n node
tmux split-window -t $SESSION:node -h
tmux split-window -t $SESSION:node.right -v
tmux send-keys -t $SESSION:node.left "cd ~/" Enter
tmux send-keys -t $SESSION:node.right "cd server && git status" Enter
#tmux send-keys -t $SESSION:node.right "yarn start"
tmux send-key -t $SESSION:node.bottom-right "cd client && git status" Enter

# 3. Single window
tmux new-window -t $SESSION -n zsh
tmux send-keys -t $SESSION:zsh "mongod"


# Set default window
tmux select-window -t $SESSION:1
#Attach to Session
tmux attach -t $SESSION:vim.top
#tmux resize-pane -t $SESSION:vim.1 -y 8
