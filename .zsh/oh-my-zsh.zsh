#!/bin/zsh

# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

ZSH_TMUX_AUTOSTART=true

plugins=(git gpg-agent ripgrep tmux colored-man-pages fzf vscode gh aws kubectl helm docker)

source $ZSH/oh-my-zsh.sh
