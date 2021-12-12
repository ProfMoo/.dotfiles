# Setting up Kubie completion requires turning on bashcomplete 
# since Kubie doesn't support native zsh complete yet
autoload bashcompinit
bashcompinit
source ~/.zsh/bash-completions/kubie.bash

# Helm autocomplete 
source <(helm completion zsh)
