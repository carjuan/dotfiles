# Dotfiles and GNU stow setup

This directory contains my `dotfiles` setup

## Ubuntu

### Requirements

Ensure you have the following installed on your system.

#### Git

```
sudo apt update && sudo apt upgrade -y && sudo apt install git -y
```

#### Curl

```
sudo apt install curl -y
```

#### Simple text editor (optional)

```
sudo apt install vim -y
```

#### Homebrew

```bash
# Install Hombrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your path in current shell session
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install Homebrew's dependencies
sudo apt-get install build-essential gcc -y
```

#### zsh

```bash
# Install zsh
brew install zsh

# Add zsh to shells
echo $(which zsh) | sudo tee -a /etc/shells

# Change default shell
chsh -s $(which zsh)


# Logout and login again for changes to take effect
```

#### Setup dotfiles repo and stow

```zsh

```

## Macos

### Requirements

Ensure you have the following installed on your system.
