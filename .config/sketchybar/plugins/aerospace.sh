#!/bin/bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
                           background.border_width=0 \
                           background.color=$BLUE \
                           icon.color=$BLACK \
                           label.color=$BLACK
else
    sketchybar --set $NAME background.drawing=off \
                           icon.color=$WHITE \
                           label.color=$WHITE
fi
