#!/usr/bin/env bash

# Get current status
status=$(playerctl status 2>/dev/null)

# Only continue if something is playing/paused
if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)

    # Truncate title + artist if too long
    combined="$artist - $title"
    max_length=50
    if [ ${#combined} -gt $max_length ]; then
        combined="${combined:0:$max_length}..."
    fi

    # Display with emoji/icon based on status
    if [[ "$status" == "Playing" ]]; then
        echo "▶️ $combined"
    else
        echo "⏸️ $combined"
    fi
else
    echo "No music"
fi
