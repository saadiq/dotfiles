#PROMPT='$USER@%{$fg[cyan]%}%m:%{$reset_color%}%~ $→ '
PROMPT='$USER@%{$fg[cyan]%}%m:%{$reset_color%}%~$(parse_git_dirty) $ '

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
