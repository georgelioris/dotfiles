#!/usr/bin/env bash
tmux ls | sed  "s/:.*//"  | rofi -dmenu -i -theme ~/.config/rofi/dmenu.rasi -p "  tmux-attach"| xargs -I {} alacritty -t "{}" -e tmux a -t "{}"
