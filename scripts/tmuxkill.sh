#!/usr/bin/env bash
tmux ls | sed  "s/:.*//"  | rofi -dmenu -i -theme  ~/.config/rofi/dmenu.rasi -p " tmux-kill" | xargs -I {} tmux kill-session -t "{}"
