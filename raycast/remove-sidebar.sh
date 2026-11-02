#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Remove sidebar
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Anomen
# @raycast.authorURL https://raycast.com/Anomen

log() {
  echo "[$(date '+%H:%M:%S')] $*"
}

restart_dock() {
  log "Restarting Dock..."
  launchctl kickstart -k gui/$(id -u)/com.apple.Dock.agent

  # Wait for a new Dock pid that stays stable and has a registered window server connection.
  local pid="" last="" stable=0
  for _ in $(seq 1 50); do
    pid=$(pgrep -x Dock | head -n1)
    if [ -n "$pid" ] && [ "$pid" = "$last" ]; then
      stable=$((stable + 1))
      [ "$stable" -ge 3 ] && return 0
    else
      stable=0
    fi
    last="$pid"
    sleep 0.2
  done
  return 1
}

for attempt in $(seq 1 5); do
  log "Attempt $attempt/5"
  if ! restart_dock; then
    log "Dock did not come up."
    continue
  fi

  # A freshly launched Dock isn't injectable immediately; give it time to register.
  sleep 1.5
  log "Dock is running (pid $(pgrep -x Dock | head -n1)), loading yabai scripting addition..."

  sa_output=$(sudo yabai --load-sa 2>&1)
  sa_status=$?

  # yabai 7 can exit 1 with no output even when injection worked; Dock holding the SA socket is the real signal.
  if lsof -p "$(pgrep -x Dock | head -n1)" 2>/dev/null | grep -q yabai-sa; then
    log "Scripting addition loaded successfully (load-sa exit $sa_status)."
    log "Done."
    exit 0
  fi

  log "load-sa failed (exit $sa_status) — ${sa_output:-no output}"
done

log "Failed: could not load yabai scripting addition after Dock restart."
exit 1
