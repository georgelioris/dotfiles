#!/bin/sh

[ "$(bluetoothctl show | grep Powered | cut -d " " -f2)" = "yes" ];
BT_STATUS=$?

case "$1" in
  status)
    if [ "$BT_STATUS" -eq 0 ]; then
       echo "%{F#569CD6}%{F-}"
    else
      echo "%{F#808080}%{F-}"
    fi
    ;;
    toggle)
      if [ "$BT_STATUS" -eq 0 ]; then
      notify-send " Bluetooth" "Disabled" -t 1500;
      bluetoothctl power off  >/dev/null 2>&1 &&
        echo "%{F#808080}%{F-}"
      else
      notify-send " Bluetooth" "Enabled" -t 1500;
      bluetoothctl power on >/dev/null 2>&1 &&
        echo "%{F#569CD6}%{F-}" &&
        bluetoothctl connect 41:42:D8:9C:D6:1C >/dev/null 2>&1 &&
        notify-send " Bluetooth" "Lenovo Livepods Connected" -t 1500;
    fi
    ;;
  esac
