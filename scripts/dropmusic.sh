#!/usr/bin/env bash

## Check if a drop ncmpcpp already exists
## If it does do nothing
## Else create a new instance

DROP=$(pgrep -axfc "alacritty --class ncmpcpp -e ncmpcpp")

if [ $DROP -gt 0 ]
 then
   exit 1
  else
   alacritty --class "ncmpcpp" -e ncmpcpp
fi
