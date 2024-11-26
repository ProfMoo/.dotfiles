# oh-my-zsh configuration
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

plugins=(
    git
    gpg-agent
    tmux
    colored-man-pages
    fzf
    vscode
    gh
    aws
    kubectl
    helm
    docker
    golang
)

source $ZSH/oh-my-zsh.sh

# Add homebrew binaries to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Add golang binaries to PATH
export PATH="$PATH:$HOME/go/bin:/usr/local/go/bin"

# Changing zsh bindings to emacs mode. ctrl-e and ctrl-a now work on command line
bindkey -e

# Setting default editor to VSCode
export EDITOR='code -w'

# Edit and source zsh configs quickly
alias ,ez='$EDITOR ~/.zshrc'
alias ,ezz='$EDITOR ~/.zsh'
alias ,sz='source ~/.zshrc'

# Needed so that zsh can use most bash completion scripts
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Telling the oh-my-zsh fzf plugin where to find fzf
export FZF_BASE=$(which fzf)

# Add aliases
source "$HOME/.zsh/aliases.zsh"

# Sourcing my oh-my-zsh file
source "$HOME/.zsh/oh-my-zsh.zsh"

# Setting up fzf fuzzy finding
source <(fzf --history)
