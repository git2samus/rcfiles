if [[ $- = *i* ]]; then
    shopt -s extglob failglob histappend checkwinsize
    ((${BASH_VERSINFO[0]} >= 4)) && shopt -s globstar

    # TODO: make conditional based on editing-mode (note: when changing modes from .inputrc $SHELLOPTS does not recognize it)
    # bind -x '"\C-\M-w":kill -WINCH $$';; # can't use -x on .inputrc

    # put these here instead of .bash_profile due to issues with screen
    [[ -r ~/.git-completion.bash ]] && . ~/.git-completion.bash

    # detect git-aware prompt function
    if [[ $(type -t __git_ps1) = function ]]; then
        gitps1='$(__git_ps1)'
    fi

    # monochrome
    # t_bold=\\[$(tput bold)\\] t_reset=\\[$(tput sgr0)\\]
    # PS1="$t_reset\\n$t_bold\\u@\\h:\\w$t_reset$gitps1\\n\$(jobs_prompt)\\$ "; PS2='> '; PS3='? '; PS4='+ '

    # cygwin style
    t_green=\\[$(tput setaf 2)\\] t_yellow=\\[$(tput setaf 3)\\] t_reset=\\[$(tput sgr0)\\]
    PS1="$t_reset\\n$t_green\\u@\\h $t_yellow\\w$t_reset$gitps1\\n\$(jobs_prompt)\\$ "; PS2='> '; PS3='? '; PS4='+ '

    unalias -a; [[ -r ~/.aliasrc ]] && . ~/.aliasrc
fi

[[ -r ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

[[ -r ~/.bashrc_local ]] && . ~/.bashrc_local

