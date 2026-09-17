#!/bin/bash

MONITOR="eDP-1"

BATTERY_MODE="2560x1600@60"

AC_MODE="2560x1600@240"

PROFILE=$(powerprofilesctl get)

if [ "$PROFILE" = "performance" ]; then
  TARGET_MODE="$AC_MODE"
  TARGET_HZ="240"
else
  TARGET_MODE="$BATTERY_MODE"
  TARGET_HZ="60"
fi

CURRENT_HZ=$(hyprctl monitors -j | jq -r --arg mon "$MONITOR" '.[] | select(.name==$mon) | .refreshRate | round')

if [ "$CURRENT_HZ" = "$TARGET_HZ" ]; then
  exit 0
fi

hyprctl eval "hl.monitor({ output = \"$MONITOR\", mode = \"$TARGET_MODE\", position = \"0x0\", scale = 1.6, vrr = 1 })"
