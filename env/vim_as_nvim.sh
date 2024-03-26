#!/usr/bin/env bash

set -euo pipefail

source ./util.sh

ensure_dependency "nvim"

notify "Setting up vim as nvim"

USER_BIN="${HOME}/.local/bin"

[[ ! -d ${USER_BIN} ]] && mkdir -p "${USER_BIN}"

quiet_cd "${USER_BIN}"

[[ ! -L ${USER_BIN}/vim ]] && ln -s "$(which nvim)" ./vim && echo "finished making ''vim' -> nvim" ||
	echo "command 'vim' already -> nvim. No need to 'ln -s'"
