#!/usr/bin/env bash

set -euo pipefail

source ./util.sh

notify "Setting up stow"

ensure_dependency "stow" "basename"

# Make sure we are in right PATH before 'stow <folder>'
quiet_cd "${DOTFILES}"

# NOTE: Modify this list to add new stow folders OR if changes have been made to directory names
STOW_FOLDERS=("${DOT_OS}" "zsh" "tmux" "nvim" "fzf" "shellenv")

# Check folder are in PATH before stow
for folder in "${STOW_FOLDERS[@]}"; do
	stow_folder_full_path="${DOTFILES}/${folder}"

	if ! [ -d "${stow_folder_full_path}" ]; then
		print_error "${folder} is not in your ${DOTFILES} path"
	fi

	stow_folders_full_path+=("${stow_folder_full_path}")

	echo -e "\n----"
	echo -e "The following folder is to be modified  by 'stow': \e[36m$(basename "${stow_folder_full_path}")\e[0m in ${DOTFILES}"

	# stow: ERROR: does not take absolute paths.
	# Passing 'folder' name only
	stow -v "${folder}"
	echo -e "----\n"

done
