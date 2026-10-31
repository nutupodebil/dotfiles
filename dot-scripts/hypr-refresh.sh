#!/bin/bash

MONITOR="eDP-1"

PROFILE=$(powerprofilesctl get)

TARGET_HZ_AC="240"
TARGET_HZ_BAT="60"

CURRENT_HZ=$(hyprctl monitors -j | jq -r --arg mon "$MONITOR" '.[] | select(.name==$mon) | .refreshRate | round')

if [ "$PROFILE" = "performance" ]; then
  if [ "$CURRENT_HZ" = "$TARGET_HZ_AC" ]; then
    exit 0
  fi
  cp ~/.config/hypr/monitor-profiles/ac.lua ~/.config/hypr/modules/monitors.lua
else
  if [ "$CURRENT_HZ" = "$TARGET_HZ_BAT" ]; then
    exit 0
  fi
  cp ~/.config/hypr/monitor-profiles/battery.lua ~/.config/hypr/modules/monitors.lua
fi
