#!/usr/bin/env bash
alacritty --title="wifiwidget" -e bash -c 'printf "\\e]11;#0d0b0a\\e\\\\" && echo "" && tput civis && PS1="" && stty -echo && printf "\033[1mSSID: \033[0m" && iwgetid -r && printf "\033[1mIP: \033[0m" && myip' &
sleep 0.25

i3-msg [title="wifiwidget"] focus, floating enable, resize set 165 70, move position 1176 25
