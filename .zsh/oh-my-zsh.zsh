#!/bin/zsh

export FZF_BASE=/path/to/fzf/install/dir

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

ZSH_THEME="suvash"

plugins=(
    git
    gpg-agent
    ripgrep
    tmux
    colored-man-pages
    fzf
    vscode
    gh
    aws
    kubectl
    helm
)
