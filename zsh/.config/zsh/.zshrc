#!/usr/bin/env zsh

# Some useful options (man zshoptions)

setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef   # Disable ctrl-s to freeze terminal
zle_highlight=('paste:none')  # Disables highlight text when pasting in terminal


# NO BEEP
unsetopt BEEP

#completions
autoload -Uz compinit

zstyle ':completion:*' menu select

zmodload zsh/complist

# compinit
_comp_options+=(globdots) # Include hidden files

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Init sourcing functions

source "$ZDOTDIR/init/loader"

is_zsh_history

# Source core shell files 
zsh_source_file "zsh-aliases"
zsh_source_file "zsh-exec"
zsh_source_file "zsh-prompt"
zsh_source_file "zsh-vim-mode"
zsh_source_file "fzf-env/fzf"
zsh_source_file "fzf-env/theme"
zsh_source_file "util/webdev"
zsh_source_file "util/instructor-git-token-update"
zsh_source_file "zsh-notify"
zsh_source_file "zsh-exports"

# Plugin Manager
zsh_install_plugin "zsh-users/zsh-autosuggestions"
zsh_install_plugin "zsh-users/zsh-syntax-highlighting"
zsh_install_plugin "hlissner/zsh-autopair"


#### Key-bindings override
## FZF
bindkey -r '^T'
bindkey '^W' fzf-file-widget


# Install completion plugins
# zsh_add_completion "esc/conda-zsh-completion" false
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
# bindkey "^p" up-line-or-beginning-search # Up
# bindkey "^n" down-line-or-beginning-search # Down
# bindkey "^k" up-line-or-beginning-search # Up
# bindkey "^j" down-line-or-beginning-search # Down

bindkey '^F' autosuggest-accept

compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
