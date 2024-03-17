#!/usr/bin/env bash

set -euo pipefail

source ./util.sh

notify "Installing PNPM packages"

ensure_dependency "pnpm"

NODE_GLOBAL_PACKAGES="${DOTFILES}/dot_node_global_packages"

[[ -s "${NODE_GLOBAL_PACKAGES}" ]] && xargs pnpm install -g <"${NODE_GLOBAL_PACKAGES}" ||
	print_error "file ${NODE_GLOBAL_PACKAGES} not found"
