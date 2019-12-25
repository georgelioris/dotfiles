#!/usr/bin/env bash
tmux ls | sed  "s/:.*//"  | rofi -dmenu -i -theme ~/.config/rofi/power.rasi | xargs -I {} alacritty -t "{}" -e tmux a -t "{}"
