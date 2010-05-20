export HISTSIZE=10000 HISTCONTROL=erasedups
export PROMPT_COMMAND='unset HISTFILESIZE; history -a; xterm_prompt'
export PROMPT_DIRTRIM=2
export EDITOR=vim

[[ -r ~/.bash_profile_local ]] && . ~/.bash_profile_local
[[ -r ~/.functionrc ]] && . ~/.functionrc
[[ -r ~/.bashrc ]] && . ~/.bashrc
