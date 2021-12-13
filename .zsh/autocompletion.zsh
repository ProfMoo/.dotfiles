# Needed so that zsh can use most bash completion scripts
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# source ~/.zsh/bash-completions/kubie.bash

# Helm autocomplete 
source <(helm completion zsh)

# Adding Kubectl tab completion
source <(kubectl completion zsh)
# with alias as well
complete -F __start_kubectl k

# Adding aws-vault tab completion
source <( aws-vault --completion-script-bash )
