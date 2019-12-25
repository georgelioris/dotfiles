#!/usr/bin/env bash
tmux ls | sed  "s/:.*//"  | rofi -dmenu -i -theme ~/.config/rofi/power.rasi | xargs -I {} tmux kill-session -t "{}"
