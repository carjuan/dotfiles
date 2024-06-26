#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/ensure_installed.sh"
source "${DOTFILES}/env/utils/notify.sh"
source "${DOTFILES}/env/setup_env/brew.sh"
source "${DOTFILES}/env/setup_env/fonts.sh"
source "${DOTFILES}/env/setup_env/stow.sh"

if [[ -z "${DOTFILES:-}" ]]; then
	export DOTFILES="${HOME}/dotfiles"
fi

# Fail fast if HOME is unset
if [[ -z "${HOME:-}" ]]; then
	notify "ERROR" "\$HOME must be set to run $0"
fi

# Enable a simple vim config in case 'neovim' is not setup
VIMRC="vimrc"
VIMRC_FILE="${DOTFILES}/${VIMRC}/.vimrc"

if [[ -s ${VIMRC_FILE} ]]; then
	cp "${VIMRC_FILE}" "${HOME}"
fi

DOT_OS=$(uname | tr "[:upper:]" "[:lower:]")
export DOT_OS
DOT_BREWFILE_PATH="${DOTFILES}/${DOT_OS}/packages/Brewfile"
DOT_PACKAGE_MANAGER="brew"

dot_brew_install_path=""
dot_os_system_fonts_path=""
dot_install_script_dependencies=""

case "${DOT_OS}" in
linux)
	dot_brew_install_path="/home/linuxbrew/.linuxbrew/bin/brew"
	dot_os_system_fonts_path="${HOME}/.local/share/fonts"

	install_dev_packages "${DOT_PACKAGE_MANAGER}" "${dot_brew_install_path}" "${DOT_BREWFILE_PATH}"

	dot_install_script_dependencies=("curl" "git" "mkdir" "unzip" "rm" "xargs" "fc-cache" "cp" "pnpm" "node" "npm" "stow")

	ensure_installed "${dot_install_script_dependencies[@]}"

	stow_env "${DOT_OS}"

	install_system_fonts "${DOT_OS}" "${dot_os_system_fonts_path}"
	;;

darwin)
	dot_brew_install_path="/usr/local/bin/brew"
	dot_os_system_fonts_path="${HOME}/Library/Fonts"

	install_dev_packages "${DOT_PACKAGE_MANAGER}" "${dot_brew_install_path}" "${DOT_BREWFILE_PATH}"

	dot_install_script_dependencies=("curl" "git" "mkdir" "unzip" "cp" "rm" "xargs" "pnpm" "node" "npm" "stow")

	ensure_installed "${dot_install_script_dependencies[@]}"

	stow_env "${DOT_OS}"

	install_system_fonts "${DOT_OS}" "${dot_os_system_fonts_path}"
	;;
*)
	notify "ERROR" "Current OS is not supported. Aborting this script installation"
	;;
esac

DOT_ENV_SETUP_SCRIPTS_PATH="${DOTFILES}/env/setup_env"
DOT_ENV_SETUP_SCRIPTS=("git" "pnpm" "tmux")

for script in "${DOT_ENV_SETUP_SCRIPTS[@]}"; do
	"${DOT_ENV_SETUP_SCRIPTS_PATH}/${script}.sh"
done

notify "SUCCESS" "Installation succeded! Restart shell session to load your new shell configs!"
