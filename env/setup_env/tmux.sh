#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/notify.sh"

notify "STEP" "Installing tmux plugin manager"

TMUX_PLUGIN_DIR="${HOME}/.tmux"

if [[ ! -d "${TMUX_PLUGIN_DIR}/plugins/tpm" ]]; then
	git clone https://github.com/tmux-plugins/tpm "${TMUX_PLUGIN_DIR}"/plugins/tpm ||
		notify "ERROR" "Failed to install tmux plugin manager. Git clone failed. Try again."
else
	notify "INFO" "Tmux plugin manager is already installed"
fi
