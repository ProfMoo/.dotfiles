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
[[ -s "$HOME/.zsh/custom_aliases.zsh" ]] && source "$HOME/.zsh/custom_aliases.zsh"

# Checking for a work-specific folder (which won't be checked into Git) and then sourcing it
# [[ -d "$HOME/.zsh/work" ]] && [-[ -s "$HOME/.zsh/work/init.zsh" ]] && source "$HOME/.zsh/work/init.zsh"

# Checking for a home-specific folder (which won't be checked into Git) and then sourcing it
[[ -d "$HOME/.zsh/home" ]] && [[ -s "$HOME/.zsh/home/init.zsh" ]] && source "$HOME/.zsh/home/init.zsh"

# source $HOME/.zsh/install "git gpg-agent ripgrep tmux colored-man-pages fzf vscode gh aws kubectl helm"

# Adding krew to path
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
