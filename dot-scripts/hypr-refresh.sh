#!/bin/bash

MONITOR="eDP-1"

PROFILE=$(powerprofilesctl get)

CURRENT_HZ=$(hyprctl monitors -j | jq -r --arg mon "$MONITOR" '.[] | select(.name==$mon) | .refreshRate | round')

if [ "$PROFILE" = "performance" ]; then
  TARGET_HZ="240"
  if [ "$CURRENT_HZ" = "$TARGET_HZ" ]; then
    exit 0
  fi
  cp ~/.config/hypr/monitor-profiles/ac.lua ~/.config/hypr/modules/monitors.lua
else
  TARGET_HZ="60"
  if [ "$CURRENT_HZ" = "$TARGET_HZ" ]; then
    exit 0
  fi
  cp ~/.config/hypr/monitor-profiles/battery.lua ~/.config/hypr/modules/monitors.lua
fi
