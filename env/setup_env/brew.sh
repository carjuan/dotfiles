#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/notify.sh"

function install_brew() {
	local OS="${DOT_OS:-$(uname)}"
	local INSTALL_PATH="${1}"
	if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
		notify "ERROR" "Failed to install Brew. Make sure you have internet connection. Try again. If the issue persists, try installing it manually."
	fi

	case "${OS}" in
	Linux)
		# Install brew dependencies build-esential and gcc
		sudo apt-get install build-essential gcc -y
		;;
	esac

	# Make sure brew is active in current shell session
	eval "$(${INSTALL_PATH} shellenv)" && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.zshrc
}

function is_brew_installed() {
	local BREW_INSTALL_PATH="${1}"
	if ! command -v brew &>/dev/null; then
		install_brew "${BREW_INSTALL_PATH}"
	else
		notify "INFO" "brew is already installed"
	fi
}

function install_dev_packages() {
	local PACKAGE_MANAGER="${1}"
	local PACKAGE_MANAGER_INSTALL_PATH="${2}"
	local PACKAGE_MANAGER_PACKAGES_FILE="${3}"

	case "${PACKAGE_MANAGER}" in
	brew)

		notify "STEP" "Installing ${PACKAGE_MANAGER}"

		is_brew_installed "${PACKAGE_MANAGER_INSTALL_PATH}"

		notify "STEP" "Installing/Upgrading ${PACKAGE_MANAGER} packages"

		if [[ ! -s "${PACKAGE_MANAGER_PACKAGES_FILE}" ]]; then
			notify "ERROR" "${PACKAGE_MANAGER_PACKAGES_FILE} must be in your PATH to run $0"
		fi

		notify "INFO" "Using ${PACKAGE_MANAGER_PACKAGES_FILE} to setup this machine"

		brew update

		brew upgrade

		brew cleanup

		if ! brew bundle install --file="${PACKAGE_MANAGER_PACKAGES_FILE}"; then
			notify "ERROR" "Unable to install one or more dependencies from ${PACKAGE_MANAGER_PACKAGES_FILE}. Ensure you have an up-to-date Brewfile"
		fi
		;;
	esac

}
