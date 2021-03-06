#!/usr/bin/env bash

# Detects if iTerm2 is running
if ! pgrep -f "Alacritty" > /dev/null; then
    open -a "/Applications/Alacritty.app"
else
    # Create a new window
    if ! osascript -e 'tell application "Alacritty" to create window with default profile' > /dev/null; then
        # Get pids for any app with "iTerm" and kill
        for i in $(pgrep -f "Alacritty"); do kill -15 "$i"; done
        open  -a "/Applications/Alacritty.app"
    fi
fi
