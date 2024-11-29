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
    kube-ps1
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

# Setting the GOPATH and adding the GO install location to path
export GOPATH="$HOME/go"
export PATH="$PATH:${GOPATH}/bin"
export GO111MODULE=on

# Adding the Kubernetes context to the prompt
PROMPT='$(kube_ps1)'$PROMPT

# Needed so that zsh can use most bash completion scripts
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

######################################################################################
### Ensure as many commands are written to the same shared zsh history as possible ###
######################################################################################

# Append to the history file, don't overwrite it
setopt APPEND_HISTORY
# Write to the history file immediately, not when the shell exits
setopt INC_APPEND_HISTORY
# Share history across all sessions
setopt SHARE_HISTORY
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Adding flux shell completion
. <(flux completion zsh)

# Adding cilium shell completion
. <(cilium completion zsh)

# Add any work-related configuration here
# Some stuff doesn't make sense (or isn't a good idea) to check into a public repo.
# Check if given file exists. If true, source the file
[[ -s "$HOME/.work/general.zsh" ]] && source "$HOME/.work/general.zsh"

# Telling the oh-my-zsh fzf plugin where to find fzf
export FZF_BASE=$(which fzf)

# Add aliases
source "$HOME/.zsh/aliases.zsh"
