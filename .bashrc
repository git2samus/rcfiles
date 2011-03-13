shopt -s extglob failglob histappend checkwinsize
((${BASH_VERSINFO[0]} >= 4)) && shopt -s globstar

[[ -r ~/.gitsh ]] && gitps1='$(__git_ps1)' && . ~/.gitsh
if [[ $- = *i* ]]; then
    t_bold=$(tput bold) t_reset=$(tput sgr0)
    PS1="\\[$t_reset\\]\\n\\[$t_bold\\]\\u@\\h:\\w\\[$t_reset\\]$gitps1\\n\\$ "; PS2='> '; PS3='? '; PS4='+ '
    unset t_bold t_reset
    bind -x '"\C-\M-l":kill -WINCH $$'
    unalias -a; [[ -r ~/.aliasrc ]] && . ~/.aliasrc
else
    PS1="\\n\\u@\\h:\\w$gitps1\\n\\$ "; PS2='> '; PS3='? '; PS4='+ '
fi

[[ -r ~/.bashrc_local ]] && . ~/.bashrc_local

# ruby version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
