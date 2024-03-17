#!/usr/bin/env bash

set -euo pipefail

source ./util.sh

notify "Installing Brewfile packages"

ensure_dependency "brew"

if [[ ! -s "${DOT_BREWFILE}" ]]; then
	print_error "${DOT_BREWFILE} must be in your PATH to run $0"
fi

echo "Using ${DOT_BREWFILE} to setup this machine"

brew update

brew upgrade

brew cleanup

brew bundle install --file="${DOT_BREWFILE}"
