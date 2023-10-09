#!/bin/zsh

# can be used to test if the aliases are working
alias test='echo "test"'

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
