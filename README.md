# Dev Environment Setup

> [!WARNING]
> As it stands, this repo is a reminder for me on how to setup my development environment.
> However, if you intend to use it, it's recommended to first create a fork of
> this repository. Make sure to go through the code thoroughly, and eliminate
> any elements that are not necessary or beneficial for your use case.
> It's not advisable to directly use my configurations without
> fully understanding their implications. Proceed at your own discretion! I suggest
> spinning up a quick docker container to test the configurations before
> applying them to your main system.

## Overview

This repository is a collection of scripts and configuration files
designed to set up a new development environment on both Linux and macOS systems.
It includes configurations for several essential development tools such as `zsh`,
`Tmux`, `i3`, `fzf`, `Alacritty`, and `Neovim`.

The repository also contains scripts for installing and configuring fonts.
You can customize the list of fonts to be installed by modifying the
`font/font_list` file. For more information on how to set it up,
see [installing fonts](#installing-fonts)

> [!NOTE]
> For your own customization, replace the following files/folders with your own,
> `darwin/packages/Brewfile` (for macOS), `font/font_list`,
> `linux/packages/Brewfile`, `packages/.npm-global-packages`
> (if using node and pnpm) `shellenv/.zshenv`.
> This should work just fine, although some configurations may need to be adjusted.

A key utility used in this setup is [`GNU Stow`](https://www.gnu.org/software/stow/),
a symlink farm manager that greatly simplifies the management of configuration files
across different systems. It allows you to organize files under one directory and
then uses symbolic links to distribute them to their proper locations.

> [!NOTE]
> For `stow` to work as expected, replace the following folders with your own,
> or remove them if not you do not need them.
> **_following the exact STOW folder structure_**:
> `fzf/.config/[your-own-fzf-folder]`, `nvim/.config/[your-own-nvim-folder]`,
> `tmux/.config/[your-own-tmux-folder]`, `zsh/.config/[your-own-zsh-folder]`,
> `linux/.config/[your-own-terminal-folder]`,
> `linux/.config/[your-own-i3-folder]`, `darwin/.config/[your-own-terminal-folder]`.
> The reason for replacing the folder after `/.config` is due to the way `stow` works.
> `stow` operates by creating symlinks from the target directory
> (usually your home directory) to the files in a package directory
> (in this case, the directories listed above). The structure of the package
> directory mirrors the structure of the target directory. So, when you
> run `stow nvim` from `~/dotfiles`, it will create a symlink from `~/.config/nvim`
> to `~/dotfiles/nvim/.config/nvim/`.

The setup process is largely automated through shell scripts, making it easy to
replicate the environment on multiple machines. The repository also includes
instructions for setting up `pnpm`, `node`, and `ssh`.

Whether you're setting up a new machine or just want to keep your configurations
consistent across multiple systems, this repository provides a guide on how you might
go about it.

## Getting Started

### OS Requirements

#### Linux

##### Ubuntu

Ensure you have `sudo` access and the following packages are installed

```bash
sudo apt update && \
  sudo apt upgrade -y && \
  sudo apt install curl git ca-certificates fontconfig unzip zsh vim -y
```

#### macOS

Install essential development tools.

```bash
xcode-select --install

# Once finished, restart a new shell for changes to take effect.
```

### Dependencies

#### `pnpm`

```bash
export SHELL="zsh" && \
  curl -fsSL https://get.pnpm.io/install.sh | sh -
```

The following is appended to the `~/.zshrc`:

```bash
# pnpm
export PNPM_HOME="/home/dot/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
```

#### `zsh`

Setup `zsh` as default login shell.

```bash
# Verify if `zsh` is not the default login shell
echo $0
```

If it is not `zsh`, run:

```bash
# Add zsh to shells
echo $(which zsh) | sudo tee -a /etc/shells

# Change default shell
chsh -s $(which zsh)

# Logout and login again for changes to take effect
```

> [!WARNING]
> Before running next steps, make sure your current shell is zsh and you have restarted
> a new shell session to load `pnpm`.

#### `node`

I suggest installing [nvm](https://github.com/nvm-sh/nvm) for managing `node` versions.

```bash
# XDG_CONFIG_HOME ensures nvm is installed at $HOME/.config. See `nvm` docs for more info.
# `nvm install node` - installs latest Node version. See `nvm` docs for more info
export XDG_CONFIG_HOME=$HOME/.config && \
  bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash' && \
  source ~/.zshrc && \
  nvm install node
```

### `ssh`

> [!NOTE]
> For up-to-date instructions, refer to the official [Github Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) and [Github Docs addding ssh to Gtihub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

```zsh
# Generates a new ssh key
ssh-keygen -t ed25519 -C "your_email@example.com"

# If prompt for passphrase, hit enter to setup none

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add public ssh key to GitHub
cat ~/.ssh/id_ed25519.pub
# Then select and copy the contents of the id_ed25519.pub file
# displayed in the terminal to your clipboard

# Then follow instructions on: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

# After adding your public ssh key in your GitHub account, clone your `dotfiles` repo and set your DOTFILES
cd ~ && git clone git@github.com:[your-user-name]/dotfiles.git
```

## Setup dev environment

The following pipe of commands automate the rest of the development setup.

```bash
export DOTFILES="${DOTFILES:-${HOME}/dotfiles}" && [[ -x "${DOTFILES}/env/install.sh" ]] && "${DOTFILES}/env/install.sh" || echo "Error: install.sh is not executable, found or exited 1. See error messages."
```

### Installing fonts

1. Navigate to [nerd-font](https://www.nerdfonts.com/font-downloads) and choose a font
   of your liking

> [!NOTE]
> You can preview any fonts in [programming-fonts](https://www.programmingfonts.org)

2. Once you have selected a font, make sure it is downloadable at
   [nerd-fonts-releases](https://github.com/ryanoasis/nerd-fonts/releases)

3. Add `your new font` to the `fclist` by doing **_one_** of the following:

   ```bash
   # If vim is available as a text editor or use open the file in your favorite text editor
   cd "${DOTFILES}" && vim font/fclist
   ```

   ```bash
   echo "myFontName" >> "${DOTFILES}/font/fclist"
   ```

### Startup Services

Use `brew` to list available services for running at startup

```bash
brew services
```

Start one

```bash
brew services start sketchybar
brew services start syncthing
```

## Optional

### Setup `vim` as `nvim`

```bash
# Set vim as nvim
sudo ln -s $(which nvim) /usr/local/bin/vim
# Launch a new shell session for changes to take effect.
```

## WIP

This project is continuously evolving, and there are several enhancements and new features in the pipeline:

1. **Support for More Linux Distros**: As I explore and experiment with different Linux distributions, I plan to extend the support of this repository to accommodate more distros. This will make the setup process more versatile and adaptable to various environments.

2. **Support for More Package Managers**: In an effort to make this repository more
   universally applicable, I am working on adding support for a wider range of
   package managers. This means that users will not be limited to `brew`,
   but will also be able to use other popular package managers like `apt`,
   `yum`, `dnf`, and `pacman`.

3. **Modular Installation**: A feature to allow users to select which configurations and tools they want to install. This will make the setup process more flexible and personalized.
