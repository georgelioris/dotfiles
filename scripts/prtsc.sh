#!/usr/bin/env bash

# Rofi Print Screen
# 2019 - George Lioris
# TODO 
# Make notifications Better

OPTIONS=" Screen\n Window\n Selection"

LAUNCHER="rofi -dmenu -i -theme ~/.config/rofi/power.rasi -p "PrtSc" -no-custom"

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $2}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Screen)
       sleep 0.2s && scrot -e 'mv $f ~/Pictures/scrots' && `notify-send "PrtSc " "Screenshot saved\!" -t 1200` 
        ;;
      Window)
       sleep 0.2s && scrot -u -e 'mv $f ~/Pictures/scrots' && `notify-send "PrtSc " "Screenshot saved\!" -t 1200` 
        ;;
      Selection)
       sleep 0.2s && scrot -s -e 'mv $f ~/Pictures/scrots' && `notify-send "PrtSc " "Screenshot saved\!" -t 1200` 
        ;;
      *)
        ;;
    esac
fi

