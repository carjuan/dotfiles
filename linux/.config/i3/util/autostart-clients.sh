#!/usr/bin/env bash

# get the names of the monitor outputs
HDMI_OUTPUT=$(xrandr | awk '/^HDMI-0 connected/{print $1}')
DP2_OUTPUT=$(xrandr | awk '/^DP-2 connected/{print $1}')
DP4_OUTPUT=$(xrandr | awk '/^DP-4 connected/{print $1}')

# open firefox in workspace 1 on hdmi-0
i3-msg "workspace 1; move workspace to output $HDMI_OUTPUT; layout stacking; exec --no-startup-id alacritty"
i3-msg "workspace 1; exec --no-startup-id firefox https://chat.openai.com/"

# Loop until the Firefox window with "chat" in its title is found and store its window ID in CHAT_OPEN_FIREFOX_ID
# "Chat will be the name of the window when opened a brand new tab in chat.openai.com
while [ -z "$CHAT_OPEN_FIREFOX_ID" ]; do
	sleep 1
	CHAT_OPEN_FIREFOX_ID=$(wmctrl -lx | grep -i "chat" | awk '{print $1}')
done

# Make the identified window floating, set its size to 700x2000, and position it at the top-right corner of the HDMI-0 monitor using i3-msg.
# although not perfect, it almost positions the window at the top right corner of the current screen
i3-msg "[id=${CHAT_OPEN_FIREFOX_ID}] floating enable; resize set 700 2000; move position 116ppt 0"

sleep 2

# open default development server
i3-msg "workspace 2; move workspace to output $DP2_OUTPUT; exec --no-startup-id firefox"

sleep 3

# open firefox notion and google calendar
i3-msg "workspace 3; move workspace to output $DP4_OUTPUT; layout stacking; exec --no-startup-id spotify"
i3-msg "workspace 3; exec --no-startup-id firefox https://notion.so https://calendar.google.com"

# executes stretchly in bg
i3-msg "workspace 3; exec stretchly"
