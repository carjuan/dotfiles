#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${DOTFILES:-}" ]]; then
	export DOTFILES="${HOME}/dotfiles"
fi

source "${DOTFILES}/env/util.sh"

# Fail fast if HOME is unset
if [[ -z "${HOME:-}" ]]; then
	print_error "\$HOME must be set to run $0"
fi

ensure_dependency "curl" "fc-cache" "cp" "cd"

# Enable a simple vim config in case 'neovim' is not setup
VIMRC="vimrc"
VIMRC_FILE="${DOTFILES}/${VIMRC}/.vimrc"

if [[ -s ${VIMRC_FILE} ]]; then
	cp "${VIMRC_FILE}" "${HOME}"
fi

# Are we in the expected OS
OS=$(uname -s | tr '[:upper:]' '[:lower:]')

export DOT_BREWFILE="${DOTFILES}/${OS}/packages/Brewfile"
export DOT_OS=${OS}

case "${OS}" in
linux)
	export DOT_OS_SYSTEM_FONTS_PATH="${HOME}/.local/share/fonts"
	;;

darwin)
	export DOT_OS_SYSTEM_FONTS_PATH="${HOME}/Library/Fonts"
	./macos.sh
	;;
*)
	print_error "Current OS is not supported. Aborting this script installation"
	;;
esac

./git.sh

./brew.sh

./vim_as_nvim.sh

./pnpm.sh

./stow.sh

./fonts.sh

[[ -e "${HOME}"/.zshrc ]] && rm -f "${HOME}"/.zshrc || exit 0
