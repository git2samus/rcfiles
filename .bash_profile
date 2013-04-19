if [[ -z $PROFILE_LOADED ]]; then export PROFILE_LOADED=1
    export HISTSIZE=10000 HISTCONTROL=erasedups HISTIGNORE=[bf]g:jobs:clear:exit
    export PROMPT_COMMAND='unset HISTFILESIZE; history -a'
    export PROMPT_DIRTRIM=2
    export EDITOR=vim
    export VISUAL=$EDITOR
    export CDPATH=.:~:~/dev
    export PATH=$HOME/bin${PATH:+:$PATH}

    [[ -r ~/.functionrc ]] && . ~/.functionrc

    [[ -r ~/.bash_profile_local ]] && . ~/.bash_profile_local
fi
