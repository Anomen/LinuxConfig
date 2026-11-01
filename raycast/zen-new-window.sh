#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New Zen Window Here
# @raycast.mode silent
# @raycast.packageName Zen Browser

osascript -e '
if application "Zen" is running then
  tell application "System Events"
    tell process "Zen"
      click menu item "New Window" of menu 1 of menu bar item "File" of menu bar 1
      delay 0.2
      set frontmost to true
    end tell
  end tell
else
  tell application "Zen" to activate
end if
'
