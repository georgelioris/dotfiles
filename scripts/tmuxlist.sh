#!/usr/bin/env zsh
 tmux ls | sed  "s/:.*//"  | rofi -dmenu -i -theme ~/.config/rofi/dmenu.rasi -p "  tmux-attach"| xargs -I {} alacritty -t "{}" -e zsh -c "source ~/.zshrc && TERM=screen-256color tmux a -t {}"
