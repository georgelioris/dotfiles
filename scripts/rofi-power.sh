#!/usr/bin/env bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

# 2016 Oliver Kraitschy - http://okraits.de

OPTIONS=" Power-off\n Reboot\n Suspend\n Hibernate"

  LAUNCHER="rofi -dmenu -i -theme ~/.config/rofi/power.rasi -p Power -no-custom"
#  USE_LOCKER="true"
#  LOCKER="betterlockscreen -l dim"
# Show exit wm option if exit command is provided as an argument
if [ ${#1} -gt 0 ]; then
  OPTIONS="Exit window manager\n$OPTIONS"
fi

option=$(echo -e "$OPTIONS" | $LAUNCHER | awk '{print $2}' | tr -d '\r\n')
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        eval "$1"
        ;;
      Power-off)
        systemctl poweroff
        ;;
      Reboot)
        systemctl reboot
        ;;
      Suspend)
        systemctl suspend
        ;;
      Hibernate)
        systemctl hibernate
        ;;
      *)
        ;;
    esac
fi
