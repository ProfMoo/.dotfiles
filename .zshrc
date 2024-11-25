export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Adding homebrew binaries to the PATH
echo 'export PATH="/opt/homebrew/bin:$PATH"' >>~/.zshrc

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

# Sourcing oh-my-zsh
source "$HOME/.zsh/oh-my-zsh.zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
