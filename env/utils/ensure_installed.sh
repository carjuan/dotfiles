#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/notify.sh"

ensure_installed() {
	if [[ -n $* ]]; then
		for dependency in "$@"; do
			notify "STEP" "Checking script dependency: ${dependency}"
			ensure_dependency "${dependency}"
		done
		return
	fi

	notify "ERROR" "No dependencies provided to check"

}

ensure_dependency() {
	# Fail on a dependency not installed
	local dependency="${1}"
	if ! command -v "${dependency}" &>/dev/null; then
		notify "ERROR" "dependency ${dependency} not found in \$PATH. Make sure it is executable before running this ${0} script"
	fi

	notify "INFO" "${dependency} is already installed"

}
