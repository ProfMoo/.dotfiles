export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Changing zsh bindings to emacs mode. ctrl-e and ctrl-a now work on command line
bindkey -e

# Setting default editor to VSCode
export EDITOR='code -w'

# Adding asdf bin location
# asdf is a CLI manager mostly used to install multiple versions of the same tool
export PATH="$PATH:$HOME/.asdf/shims"

# Edit and source zsh configs quickly
alias ,ez='$EDITOR ~/.zshrc'
alias ,ezz='$EDITOR ~/.zsh'
alias ,sz='source ~/.zshrc'

# Needed so that zsh can use most bash completion scripts
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Check if given file exists. If true, source the file
source "$HOME/.zsh/aliases.zsh"

export FZF_BASE=$(which fzf)

source "$HOME/.zsh/oh-my-zsh.zsh"
