export HISTSIZE=10000 HISTCONTROL=erasedups HISTIGNORE=[bf]g:jobs:clear:exit
export PROMPT_COMMAND='unset HISTFILESIZE; history -a'
export PROMPT_DIRTRIM=2
export CDPATH=.:~
export EDITOR=vim
export VISUAL=$EDITOR

if [[ -d $HOME/bin ]]; then
  PATH=$HOME/bin${PATH:+:$PATH}
fi


[[ -r ~/.functionrc ]] && . ~/.functionrc
[[ -r ~/.bashrc ]] && . ~/.bashrc

[[ -r ~/.bash_profile_local ]] && . ~/.bash_profile_local
