#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/notify.sh"

function ensure_font_list() {
	# NOTE: To add new fonts:
	# find the font you are interested in https://www.nerdfonts.com/font-downloads
	# preview the font: https://www.programmingfonts.org/
	# Make sure it is downloadable at [nerd-fonts-releases](https://github.com/ryanoasis/nerd-fonts/releases)
	# append font name to 'font_list'
	local FONTS_TO_INSTALL="${1}"

	if ! [[ -s ${FONTS_TO_INSTALL} ]]; then
		notify "ERROR" "file 'font_list' not found in ${DOTFILES}/font. Check your PATH"
	fi
}

function make_font_cache_dir() {

	local CACHE_DIR="${1}"

	[[ ! -d ${CACHE_DIR} ]] && mkdir -p "${CACHE_DIR}" || notify "INFO" "Found font cache dir ${CACHE_DIR}"
}

function ensure_fonts_installed() {
	if ! fc-cache -fv &>/dev/null; then
		notify "ERROR" "fc-cache' could not load fonts successfully."
	fi
}

function install_system_fonts() {
	notify "STEP" "Installing and setting up system fonts"

	local OS="${1}"
	local OS_SYSTEM_FONTS_PATH="${2}"
	local FONT_CACHE_PATH="${DOTFILES}/font/cache"
	local FONTS_TO_INSTALL_PATH="${DOTFILES}/font/font_list"

	ensure_font_list "${FONTS_TO_INSTALL_PATH}"
	make_font_cache_dir "${FONT_CACHE_PATH}"

	local cache_font_full_path=""
	while IFP=" " read -r font_name; do
		cache_font_full_path="${FONT_CACHE_PATH}/${font_name}"

		if ! [[ -d "${cache_font_full_path}" ]]; then
			echo -e "\n----"
			notify "INFO" "Caching ${font_name} font"

			mkdir "${cache_font_full_path}"

			curl -fLo "${cache_font_full_path}.zip" \
				"https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/${font_name}.zip"

			unzip "${cache_font_full_path}.zip" -d "${cache_font_full_path}"

			rm -fr "${cache_font_full_path}.zip"

			notify "INFO" "Installing font ${font_name}"
			cp -r "${cache_font_full_path}" "${OS_SYSTEM_FONTS_PATH}" && notify "INFO" "Successfully installed ${font_name}"
			echo -e "----\n"
		fi

	done <"${FONTS_TO_INSTALL_PATH}"

	# macos does not need to be checked. ensure_fonts_installed uses fc-cache which 'macos' does not.
	[[ "${OS}" == "linux" ]] && ensure_fonts_installed || notify "INFO" "Successfully installed all fonts"
}
