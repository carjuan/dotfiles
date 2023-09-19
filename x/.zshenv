# Environment variables set everywhere
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="brave"

# XDF CONIG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# zsh config dir
export ZDOTDIR=$HOME/.config/zsh

HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

# ############## LINUX ################################
# What OS are we running?
if command apt > /dev/null; then
	# pactl list short sinks -- lists available audio outputs
	pactl set-default-sink alsa_output.pci-0000_2d_00.4.analog-stereo
fi
