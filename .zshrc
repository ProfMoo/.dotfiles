setopt auto_cd                        # change directory without typing cd
autoload -U colors && colors          # load colors
zstyle ':completion:*' menu select    # use arrow keys to select autocompletion items
bindkey -e                            # zsh bindings to emacs mode. ctrl-e and ctrl-a now works

# Setting default editor to VSCode
export EDITOR='code -w'

# Adding asdf bin location
# asdf is a CLI manager mostly used to install multiple versions of the same tool
export PATH="$PATH:$HOME/.asdf/shims"

# Check if given file exists. If true, source the file
[[ -s "$HOME/.zsh/alias.zsh" ]] && source "$HOME/.zsh/alias.zsh"
[[ -s "$HOME/.zsh/prompt.zsh" ]] && source "$HOME/.zsh/prompt.zsh"
[[ -s "$HOME/.zsh/autocompletion.zsh" ]] && source "$HOME/.zsh/autocompletion.zsh"
[[ -s "$HOME/.zsh/fzf.zsh" ]] && source "$HOME/.zsh/fzf.zsh"

# Checking for a work-specific folder (which won't be checked into Git) and then sourcing it
# [[ -d "$HOME/.zsh/work" ]] && [[ -s "$HOME/.zsh/work/init.zsh" ]] && source "$HOME/.zsh/work/init.zsh"

# Checking for a home-specific folder (which won't be checked into Git) and then sourcing it
[[ -d "$HOME/.zsh/home" ]] && [[ -s "$HOME/.zsh/home/init.zsh" ]] && source "$HOME/.zsh/home/init.zsh"

# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git gpg-agent ripgrep tmux colored-man-pages)

source $ZSH/oh-my-zsh.sh

# Adding krew to path
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
