alias ls='ls -G'
alias l='ls -1A'
alias ll='ls -lah'
 
# editing configs
alias ,ez='$EDITOR ~/.zshrc'
alias ,ezz='$EDITOR ~/.zsh'
alias ,sz='source ~/.zshrc'

# common tools
alias h='helm'
alias k='kubectl'

# watching resources in kubernetes
alias wp='watch kubectl get pod'
alias wa='watch --interval 2 kubectl get all'

# kubie shortcuts
alias kctx='kubie ctx'
alias kns='kubie ns'
alias getns='kubie info ns | tr -d '\n' | pbcopy'
# with kubefwd
alias kfwd='sudo kubefwd svc -n $(kubie info ns) --kubeconfig=$KUBECONFIG'
