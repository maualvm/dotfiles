#!/bin/bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    BACKGROUND_COLOR=$BLUE
    ICON_COLOR=$BLACK
    LABEL_COLOR=$BLACK
else
    BACKGROUND_COLOR=$BACKGROUND_2
    ICON_COLOR=$WHITE
    LABEL_COLOR=$WHITE
fi

aerospace_item=(
  background.color=$BACKGROUND_COLOR
  icon.color=$ICON_COLOR
  label.color=$LABEL_COLOR
)
sketchybar --set $NAME "${aerospace_item[@]}"
