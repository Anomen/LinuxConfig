#!/usr/bin/env bash

# This script is triggered by a yabai signal.
# The YABAI_WINDOW_ID environment variable is automatically set by yabai.

# Ensure we have a window ID
[ -z "$YABAI_WINDOW_ID" ] && exit 0

# Define icons for stack indicator
STACK_ACTIVE_ICON=""
STACK_INACTIVE_ICON=""

# Query yabai for the focused window's information
WINDOW_INFO=$(yabai -m query --windows --window $YABAI_WINDOW_ID)

# Check if the window is floating or fullscreened, if so, hide indicator
if [[ $(echo "$WINDOW_INFO" | jq -r '."is-floating"') == "true" || 
      $(echo "$WINDOW_INFO" | jq -r '."has-fullscreen-zoom"') == "true" ]]; then
  sketchybar --set stack_indicator drawing=off
  exit 0
fi

# Get the stack index. If it's 0, the window is not in a stack.
STACK_INDEX=$(echo "$WINDOW_INFO" | jq -r '."stack-index"')

if [[ "$STACK_INDEX" -eq 0 ]]; then
  # Not in a stack, hide the indicator
  sketchybar --set stack_indicator drawing=off
else
  # Get all windows in the same stack, sorted by stack-index
  FRAME=$(echo "$WINDOW_INFO" | jq .frame)
  CURRENT_APP_NAME=$(echo "$WINDOW_INFO" | jq -r '.name')
  CURRENT_APP_ID=$(echo "$WINDOW_INFO" | jq -r '.id')
  
  # Build icon strip showing stack order with current window highlighted
  icon_strip=$(yabai -m query --windows --space | \
    jq -r --argjson f "$FRAME" --arg id "$CURRENT_APP_ID" --arg active_icon "$STACK_ACTIVE_ICON" --arg inactive_icon "$STACK_INACTIVE_ICON" '
      [.[] | select(."is-floating" == false and .frame == $f and .app != "Finder" and .app != "Bitwarden")] |
      sort_by(."stack-index") |
      .[] | 
      if .id == ($id | tonumber) then $active_icon + " " + .app else $inactive_icon + " " + .app end
    ' | \
    while IFS= read -r app_name; do
        printf "%s" "$app_name  " 
    done)

  # Update the indicator and draw it
  sketchybar --set stack_indicator label="$icon_strip" \
                                   icon=""  \
                                   drawing=on \
             --animate sin 15 --set stack_indicator
fi
