setopt auto_cd                        # change directory without typing cd
autoload -U colors && colors          # load colors
zstyle ':completion:*' menu select    # use arrow keys to select autocompletion items
bindkey -e                            # zsh bindings to emacs mode. ctrl-e and ctrl-a now works

# Setting default editor to VSCode
export EDITOR='code -w'

# Telling GPG which prompt to use for entering the GPG password
export GPG_TTY=$(tty)

# asdf CLI manager (mostly used to install multiple versions of the same tool)
export PATH="$PATH:$HOME/.asdf/shims"

# Needed so that zsh can use most bash completion scripts
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Check if given file exists. If true, source the file
[[ -s "$HOME/.zsh/alias.zsh" ]] && source "$HOME/.zsh/alias.zsh"
[[ -s "$HOME/.zsh/prompt.zsh" ]] && source "$HOME/.zsh/prompt.zsh"
[[ -s "$HOME/.zsh/git.zsh" ]] && source "$HOME/.zsh/git.zsh"
[[ -s "$HOME/.zsh/autocompletion.zsh" ]] && source "$HOME/.zsh/autocompletion.zsh"

# Adding Kubectl tab completion
source <(kubectl completion zsh)
# with alias as well
complete -F __start_kubectl k

# Adding aws-vault tab completion
source <( aws-vault --completion-script-bash )

# Addind krew to path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
