#!/bin/bash
# This script ONLY handles updating app icons and padding.

# --- IMPORTANT: SET ABSOLUTE PATHS ---
YABAI_PATH="/opt/homebrew/bin/yabai"
JQ_PATH="/opt/homebrew/bin/jq"

args=()
for space_idx in $($YABAI_PATH -m query --displays | $JQ_PATH -r '.[].spaces | .[]'); do
  icon_strip=$($YABAI_PATH -m query --windows --space "$space_idx" | \
               $JQ_PATH -r '.[] | select(."is-sticky" == false and ."is-floating" == false and .app != "Finder") | .app' | \
               sort | \
               while IFS= read -r app_name; do
                 printf "%s " "$($HOME/.config/sketchybar/plugins/icon_map.sh "$app_name")"
               done)
  
  # Trim trailing space
  icon_strip="${icon_strip% }"
  
  # Set label and padding
  if [[ -n "$icon_strip" ]]; then
    args+=(--set "space.$space_idx" label="$icon_strip" label.padding_right=10)
  else
    args+=(--set "space.$space_idx" label="" label.padding_right=0)
  fi
done

sketchybar -m "${args[@]}"
