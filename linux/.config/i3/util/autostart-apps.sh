#!/usr/bin/env bash

# get the names of the monitor outputs
HDMI_OUTPUT=$(xrandr | awk '/^HDMI-0 connected/{print $1}')
DP2_OUTPUT=$(xrandr | awk '/^DP-0 connected/{print $1}')
DP4_OUTPUT=$(xrandr | awk '/^DP-2 connected/{print $1}')

BROWSER_TO_OPEN="firefox-devedition"

# open browser in workspace 1 on hdmi-0
i3-msg "workspace 1; move workspace to output $HDMI_OUTPUT; layout stacking; exec --no-startup-id wezterm"
i3-msg "workspace 1; exec --no-startup-id $BROWSER_TO_OPEN https://chat.openai.com/"

# Loop until the browser window with "chat" in its title is found and store its window ID in CHAT_OPEN_BROWSER_ID
# "Chat will be the name of the window when opened a brand new tab in chat.openai.com
# while [ -z "$CHAT_OPEN_BROWSER_ID" ]; do
#   sleep 1
#   CHAT_OPEN_BROWSER_ID=$(wmctrl -lx | grep -i "chat" | awk '{print $1}')
# done

# Make the identified window floating, set its size to 700x2000, and position it at the top-right corner of the HDMI-0 monitor using i3-msg.
# although not perfect, it almost positions the window at the top right corner of the current screen
# i3-msg "[id=${CHAT_OPEN_BROWSER_ID}] floating enable; resize set 700 2000; move position 116ppt 0"

sleep 1

i3-msg "workspace 2; move workspace to output $DP2_OUTPUT; exec --no-startup-id $BROWSER_TO_OPEN"

sleep 2

i3-msg "workspace 3; move workspace to output $DP4_OUTPUT; layout stacking; exec --no-startup-id spotify"
# TEMP: Remove opening sites
# i3-msg "workspace 3; exec --no-startup-id $BROWSER_TO_OPEN https://notion.so https://calendar.google.com"

# executes file synching - syncthing in bg
i3-msg "workspace 3; exec syncthing"
