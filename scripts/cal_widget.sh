#!/usr/bin/env bash
# This is widget to show a calendar
alacritty -title="calwidget" --class="calwidget" -e sh -c ' printf "\\e]11;#0d0b0a\\e\\\\" && tput civis && PS1="" && stty -echo && clear && cal' &
sleep 3
i3-msg [title="calwidget"] focus, floating enable, resize set 188 175, move position 0 0

# Right = 1240
