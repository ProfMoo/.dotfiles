#!/bin/zsh

# can be used to test if the aliases are working
alias tst='echo "success!"'

# ls
alias ls='ls -G'
alias l='ls -1A'
alias ll='ls -lah'

# common tools
alias h='helm'

# watching resources in kubernetes
alias wp='watch kubectl get pod'
alias wa='watch --interval 2 kubectl get all'

# kubie shortcuts
alias kctx='kubie ctx'
alias kns='kubie ns'
alias getns='kubie info ns | tr -d '\n' | pbcopy'
# with kubefwd
alias kfwd='sudo kubefwd svc -n $(kubie info ns) --kubeconfig=$KUBECONFIG'

# Source any local-only zsh files (e.g. work-specific aliases).
# Files in .zsh/local/ are gitignored; see .zsh/local/README.md for details.
if [[ -d "$HOME/.zsh/local" ]]; then
  for _local_zsh in "$HOME"/.zsh/local/*.zsh(N); do
    source "$_local_zsh"
  done
  unset _local_zsh
fi
