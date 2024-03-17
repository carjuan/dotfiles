#!/usr/bin/env bash

set -euo pipefail

source ./util.sh

ensure_dependency "git"

#Git config user name
echo "Please enter your FULL NAME for Git Configuration"
read git_user_name

#Git config email
echo "Please enter your EMAIL for Git Configuration"
read git_user_email

# Setup git credentials
git config --global user.name "${git_user_name}"
git config --global user.email "${git_user_email}"
