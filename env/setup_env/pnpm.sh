#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/notify.sh"

notify "STEP" "Installing PNPM packages"

export PNPM_HOME="${HOME}/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME"*) ;;
*) export PATH="${PNPM_HOME}:${PATH}" ;;
esac

NODE_GLOBAL_PACKAGES="${DOTFILES}/common/pnpm/packages"

[[ -s "${NODE_GLOBAL_PACKAGES}" ]] && xargs pnpm install -g <"${NODE_GLOBAL_PACKAGES}" ||
  notify "ERROR" "either file ${NODE_GLOBAL_PACKAGES} was not found or pnpm could not run properly."
