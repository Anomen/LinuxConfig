#!/bin/bash
# This script ONLY handles the color highlighting of the active space.

# --- IMPORTANT: SET ABSOLUTE PATHS ---
YABAI_PATH="/opt/homebrew/bin/yabai"
JQ_PATH="/opt/homebrew/bin/jq"

# --- COLOR DEFINITIONS ---
INACTIVE_SPACE_COLOR=0x11ffffff
ACTIVE_SPACE_COLOR=0xddffffff
INACTIVE_FONT_COLOR=0x88ffffff # White
ACTIVE_FONT_COLOR=0xff1e1e2e   # A dark color (Catppuccin Macchiato Base)

# Get the index of the currently focused space
active_space_idx=$($YABAI_PATH -m query --spaces --space | $JQ_PATH .index)

args=()
for space_idx in $($YABAI_PATH -m query --displays | $JQ_PATH -r '.[].spaces | .[]'); do
  # Set background and font colors based on whether the space is active
  if [[ "$space_idx" == "$active_space_idx" ]]; then
    args+=(--set "space.$space_idx" background.color=$ACTIVE_SPACE_COLOR \
                                   icon.color=$ACTIVE_FONT_COLOR \
                                   label.color=$ACTIVE_FONT_COLOR)
  else
    args+=(--set "space.$space_idx" background.color=$INACTIVE_SPACE_COLOR \
                                   icon.color=$INACTIVE_FONT_COLOR \
                                   label.color=$INACTIVE_FONT_COLOR)
  fi
done

sketchybar -m "${args[@]}"
