#!/usr/bin/env bash

# Kill all existing Polybar instances
polybar-msg cmd quit
while pgrep -x polybar >/dev/null; do sleep 0.5; done

echo "Launching Polybar..."

if type "xrandr"; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload example &
    done
else
  polybar --reload example &
fi

echo "Polybar launched on monitors: $monitors"
