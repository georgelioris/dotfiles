#!/usr/bin/env zsh
alias tmuxc="TERM=screen-256color tmux"
 tmux ls | sed  "s/:.*//"  | rofi -dmenu -i -theme ~/.config/rofi/dmenu.rasi -p "  tmux-attach"| xargs -I {} alacritty -t "{}" -e zsh -c "TERM=screen-256color tmux a -t {}"
