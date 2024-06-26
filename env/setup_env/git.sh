#!/usr/bin/env bash

set -euo pipefail

source "${DOTFILES}/env/utils/notify.sh"

notify "STEP" "Setting up Git"

#Git config user name
notify "INFO" "Please enter your FULL NAME for Git Configuration"
read git_user_name

#Git config email
notify "INFO" "Please enter your EMAIL for Git Configuration"
read git_user_email

# Setup git credentials
git config --global user.name "${git_user_name}"
git config --global user.email "${git_user_email}"
