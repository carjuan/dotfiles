#!/usr/bin/env bash

set -euo pipefail

source ./util.sh

notify "Installing PNPM packages"

ensure_dependency "node" "pnpm"

NODE_GLOBAL_PACKAGES="${DOTFILES}/dot_node_global_packages"

[[ -s "${NODE_GLOBAL_PACKAGES}" ]] && xargs pnpm install -g <"${NODE_GLOBAL_PACKAGES}" ||
	print_error "either file ${NODE_GLOBAL_PACKAGES} was not found or pnpm could not run properly.
    Check PNPM output for more INFO"
