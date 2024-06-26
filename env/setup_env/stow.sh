#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/notify.sh"
source "${DOTFILES}/env/utils/quiet_cd.sh"

function remove_temporary_dot_zshrc() {

	[[ -e "${HOME}"/.zshrc ]] && rm -f "${HOME}"/.zshrc || notify "INFO" "${HOME}/.zshrc not found. Skipping its removal."

}

function stow_env() {

	local OS="${1}"

	# Make sure we are in right PATH before 'stow <folder>'
	quiet_cd "${DOTFILES}"

	# NOTE: Modify this list to add new stow folders OR if changes have been made to $DOTFILES directory names
	STOW_FOLDERS=("${OS}" "zsh" "tmux" "nvim" "fzf" "shellenv")

	notify "STEP" "Setting up stow"

	for folder in "${STOW_FOLDERS[@]}"; do
		stow_folder_full_path="${DOTFILES}/${folder}"

		if ! [ -d "${stow_folder_full_path}" ]; then
			notify "ERROR" "stow cannot link ${folder} because it is not in your ${DOTFILES} path"
		fi

		echo -e "\n----"
		echo -e "The following folder is to be modified  by 'stow': \e[36m$(basename "${stow_folder_full_path}")\e[0m in ${DOTFILES}"

		# stow: ERROR: does not take absolute paths.
		# Passing 'folder' name only
		if ! stow -v "${folder}"; then
			notify "ERROR" "stow could not link ${folder}"
		fi
		echo -e "----\n"

	done

	remove_temporary_dot_zshrc
}
