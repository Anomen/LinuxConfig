#!/usr/bin/env sh

# Get the layout of the current space (e.g., "bsp", "stack", "float")
CURRENT_LAYOUT=$(yabai -m query --spaces --space | jq -r '.type')

# If the current layout is bsp, switch to stack.
# Otherwise, switch to bsp and then balance the windows.
if [ "$CURRENT_LAYOUT" = "bsp" ]; then
  yabai -m space --layout stack
else
  yabai -m space --layout bsp && yabai -m space --balance
fi