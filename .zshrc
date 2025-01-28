# oh-my-zsh configuration
export ZSH=$HOME/.oh-my-zsh

# Setting PATH correctly at the top of .zshrc to ensure that all subshells
# and subprocesses can access the same PATH. This is particularly important since critical tools (such as tmux)
# are called later in the installation process and might not be accessible by default PATH variables.

# Add homebrew binaries to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Setting the GOPATH and adding the GO install location to path
export GOPATH="${HOME}/go"
export PATH="$PATH:${GOPATH}/bin"

# Adding kubectl krew plugin path to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

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
    talosctl
)

source $ZSH/oh-my-zsh.sh

# Changing zsh bindings to emacs mode. ctrl-e and ctrl-a now work on command line
bindkey -e

# Setting default editor to VSCode
export EDITOR='code -w'

# Edit and source zsh configs quickly
alias ,ez='$EDITOR ~/.zshrc'
alias ,ezz='$EDITOR ~/.zsh'
alias ,sz='source ~/.zshrc'

# No reason to use anything besides go modules in 2024.
export GO111MODULE=on

# Enable bash-style completion scripts in Zsh
autoload -U +X bashcompinit && bashcompinit

# Initialize Zsh completion system
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
