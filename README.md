# Dotfiles and GNU stow setup

This directory contains my `dotfiles` setup

## Ubuntu

### Requirements

Ensure you have the following installed on your system.

#### Git

```
# Install Git
sudo apt update && sudo apt upgrade -y && sudo apt install git -y

# Setup basic git config
git config --global user.email "your_email@example.com"
git config --global user.name "Your Name"
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

#### Setup SSH and dotfiles repo

```zsh
# Generates a new ssh key
ssh-keygen -t ed25519 -C "your_email@example.com"

# If prompt for passphrase, hit enter to setup the defaults

# Start the ssh-agent in th background
eval "$(ssh-agent -s)"

# Add public ssh key to GitHub
cat ~/.ssh/id_ed25519.pub
# Then select and copy the contents of the id_ed25519.pub file
# displayed in the terminal to your clipboard

# Then follow instructions on: [GitHub ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

# After adding your public ssh key in your GitHub account, clone your `dotfiles` repo
cd ~ && git clone git@github.com:carjuan/dotfiles.git
```

## Macos

### Requirements

Ensure you have the following installed on your system.
