#!/usr/bin/env bash

set -euo pipefail

source ./util.sh

notify "Setting up system fonts"

# NOTE: To add new fonts:
# find the font you are interested in https://www.nerdfonts.com/font-downloads
# preview the font: https://www.programmingfonts.org/
# Make sure it is downloadable at [nerd-fonts-releases](https://github.com/ryanoasis/nerd-fonts/releases)
# append font name to 'fclist'
FONTS_TO_INSTALL="${DOTFILES}/font/fclist"

if ! [[ -s ${FONTS_TO_INSTALL} ]]; then
	print_error "file 'fclist' not found in ${DOTFILES}/font. Check your PATH"
fi

FONT_CACHE_DIR="${DOTFILES}/font/cache"

[[ ! -d ${FONT_CACHE_DIR} ]] && mkdir "${FONT_CACHE_DIR}"

cache_font_full_path=""
while IFP=" " read -r font_name; do
	cache_font_full_path="${FONT_CACHE_DIR}/${font_name}"

	if ! [[ -d "${cache_font_full_path}" ]]; then
		echo -e "\n----"
		echo "Info: Caching ${font_name} font"

		mkdir "${cache_font_full_path}"

		curl -fLo "${cache_font_full_path}.zip" \
			"https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/${font_name}.zip"

		unzip "${cache_font_full_path}.zip" -d "${cache_font_full_path}"

		rm -fr "${cache_font_full_path}.zip"

		echo "Info: Installing font ${font_name}"
		cp -r "${cache_font_full_path}" "${DOT_OS_SYSTEM_FONTS_PATH}" && echo "Successfully installed ${font_name}"
		echo -e "----\n"
	fi

done <"${FONTS_TO_INSTALL}"

if ! fc-cache -fv &>/dev/null; then
	print_error "fc-cache' could not load fonts successfully."
else
	echo "Successfully installed all fonts"
fi
