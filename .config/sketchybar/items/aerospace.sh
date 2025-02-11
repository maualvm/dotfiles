#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    space_item=(
      icon="$sid"
      icon.padding_left=8
      label.padding_right=0
      click_script="aerospace workspace $sid"
      script="$CONFIG_DIR/plugins/aerospace.sh $sid"
    )
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        "${space_item[@]}"
done
