#!/usr/bin/env bash

## Check if a drop terminal already exists
## If it does do nothing
## Else create a new instance

DROP=$(pgrep -axfc "alacritty --class dropdown --config-file /home/void/.config/alacritty/drop.yml")

if [ $DROP -gt 0 ]
 then
   exit 1
  else
    exec alacritty --class "dropdown" --config-file /home/void/.config/alacritty/drop.yml
fi
