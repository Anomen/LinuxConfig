#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Remove sidebar
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Anomen
# @raycast.authorURL https://raycast.com/Anomen

log() {
  echo "[$(date '+%H:%M:%S')] $*"
}

log "Restarting Dock..."
launchctl kickstart -k gui/$(id -u)/com.apple.Dock.agent

for attempt in $(seq 1 30); do
  if ! pgrep -x Dock >/dev/null; then
    log "Attempt $attempt/30: waiting for Dock..."
    sleep 0.2
    continue
  fi

  dock_pid=$(pgrep -x Dock)
  log "Attempt $attempt/30: Dock is running (pid $dock_pid), loading yabai scripting addition..."

  if sa_output=$(sudo yabai --load-sa 2>&1); then
    log "Scripting addition loaded successfully."
    log "Done."
    exit 0
  fi

  log "Attempt $attempt/30: load-sa failed — $sa_output"
  sleep 0.2
done

log "Failed: could not load yabai scripting addition after Dock restart."
exit 1
