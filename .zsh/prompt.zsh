# contains git_prompt_info function
[[ -s "$HOME/.zsh/git.zsh" ]] && source "$HOME/.zsh/git.zsh" || "$HOME/.zsh/git.zsh not found"
 
# init variables for better readability
NEWLINE=$'\n'
 
#load colors
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'
 
ZSH_THEME_GIT_PROMPT_PREFIX="on $BLUE"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="ahead"
 
# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="$BOLD_GREEN+$RESET"
ZSH_THEME_GIT_PROMPT_MODIFIED="$BOLD_GREEN!$RESET"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$BOLD_GREEN?$RESET"
 
# Load version control information
# Pick the PROMPT of your favorite theme, such as https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/gentoo.zsh-theme
precmd() {
    PROMPT="${BOLD_YELLOW}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)$(git_prompt_status) ${NEWLINE}${BLUE}$ %{$reset_color%}"
}
