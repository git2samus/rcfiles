if [[ -z $PROFILE_LOADED ]]; then export PROFILE_LOADED=1
    export HISTCONTROL=erasedups HISTSIZE=-1  # do not store duplicates, do not limit size
    export PROMPT_COMMAND='history -a'        # update other sessions' histories
    export PROMPT_DIRTRIM=2
    export EDITOR=vim
    export VISUAL=$EDITOR
    export CDPATH=.:~:~/dev
    export PATH=$HOME/bin${PATH:+:$PATH}

    [[ -r ~/.functionrc ]] && . ~/.functionrc

    [[ -r ~/.bash_profile_local ]] && . ~/.bash_profile_local
fi

# on some weird situations (ssh mostly) .bashrc does not load
. ~/.bashrc
