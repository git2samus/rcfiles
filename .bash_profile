export HISTSIZE=10000 HISTCONTROL=erasedups HISTIGNORE=[bf]g:jobs:clear:exit
export PROMPT_COMMAND='unset HISTFILESIZE; history -a; xterm_prompt'
export PROMPT_DIRTRIM=2
export CDPATH=.:~
export EDITOR=vim

[[ -r ~/.functionrc ]] && . ~/.functionrc
[[ -r ~/.bashrc ]] && . ~/.bashrc

[[ -r ~/.bash_profile_local ]] && . ~/.bash_profile_local
