#!/bin/sh

source "$CONFIG_DIR/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100)
    ICON="􀛨"
    COLOR=$GREEN
  ;;
  [6-8][0-9])
    ICON="􀺸"
    COLOR=$YELLOW
  ;;
  [3-5][0-9])
    ICON="􀺶"
    COLOR=$ORANGE
  ;;
  [1-2][0-9])
    ICON="􀛩"
    COLOR=$RED
  ;;
  *)
    ICON="􀛪"
    COLOR=$RED
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋"
  COLOR=$GREEN
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
battery=(
  icon="$ICON"
  label="${PERCENTAGE}%"
  background.border_width=1
  background.border_color="$COLOR"
  label.color="$COLOR"
  icon.color="$COLOR"
)
sketchybar --set "$NAME" "${battery[@]}"
