#!/usr/bin/env bash

make_escape() { printf "\033[%sm" "$1"; }
make_bold() { make_escape "1;$1"; }
make_underline() { make_escape "4;$1"; }
make_italic() { make_escape "3;$1"; }

fg_blue="$(make_bold 34)"
fg_bright_blue="$(make_bold 94)"
fg_red="$(make_bold 31)"
fg_green="$(make_bold 32)"
bg_cyan="$(make_escape 44)"
bg_red="$(make_bold 41)"
bg_green="$(make_bold 42)"
bold="$(make_bold 39)"
reset="$(make_escape 0)"

function notify_step() {
	local NOTIFICATION_MESSAGE="${1}"
	printf "${fg_blue}==========>${bold}${bg_cyan}STEP:${reset}${fg_blue} %s${reset}\n" "${NOTIFICATION_MESSAGE}"
}

function notify_info() {
	local NOTIFICATION_MESSAGE="${1}"
	printf "${fg_bright_blue}==>${bold}${bg_cyan}INFO:${reset}${fg_bright_blue} %s${reset}\n" "${NOTIFICATION_MESSAGE}"
}

function notify_error() {
	local ERROR_MSG="$*"
	printf "${fg_red}==========>${bold}${bg_red}ERROR:${reset}${fg_red} %s${reset}\n" "${ERROR_MSG}" >&2
	exit 1
}

function notify_success() {
	local SUCCESS_MSG="$1"
	printf "${fg_green}==========>${bold}${bg_green}COMPLETED:${reset}${fg_green} %s${reset}\n" "${SUCCESS_MSG}"
}

function notify() {
	local ACTION="${1}"
	local MSG="${2}"

	if [ -z "${ACTION}" ]; then
		notify_error "You must provide an action to notify"
	fi

	if [ "${ACTION}" == "STEP" ]; then
		notify_step "${MSG}"
		return
	fi

	if [ "${ACTION}" == "INFO" ]; then
		notify_info "${MSG}"
		return
	fi

	if [ "${ACTION}" == "SUCCESS" ]; then
		notify_success "${MSG}"
		return
	fi

	if [ "${ACTION}" == "ERROR" ]; then
		notify_error "${MSG}"
	fi

	notify_error "Unkown action ${ACTION}. ACTION='STEP'|'INFO'|'SUCCESS'|'ERROR'"
}
