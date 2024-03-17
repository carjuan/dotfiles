#!/ust/bin/env bash

print_error() {
	local MESSAGE="$*"
	local ERROR="Error: "
	echo -e "$0: \e[31m${ERROR}\e[0m - ${MESSAGE}" >&2
	exit 1
}

ensure_dependency() {
	# Fail on dependency not installed
	for command in "$@"; do
		if ! type "${command}" &>/dev/null; then
			print_error "command '${command}' must be installed to run $0"
		fi
	done
}

notify() {
	# Bash color interpretation: echo -e "\e[31mRed Text\e[0m" where \e[ <begins color modifications> and \e[0m <ends colors modifications>
	# Color codes: 36m Cyan, 31m Red, 32m Green, 34m Blue
	local NOTIFICATION_MESSAGE="${1}"
	echo -e "\n\e[34m--------------------------------------------------------\e[0m"
	echo -e "\e[36m${NOTIFICATION_MESSAGE}\e[0m"
	echo -e "\e[34m--------------------------------------------------------\e[0m"
}

quiet_cd() {

	CDPATH='' cd -- "$@" &>/dev/null || return

}
