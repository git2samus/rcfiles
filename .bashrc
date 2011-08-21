if [[ $- = *i* ]]; then
  shopt -s extglob failglob histappend checkwinsize
  ((${BASH_VERSINFO[0]} >= 4)) && shopt -s globstar

  set -o vi
  bind -x '"\C-\M-l":kill -WINCH $$' # can't use -x on .inputrc

  if [[ -r ~/.gitsh ]]; then
    gitps1='$(__git_ps1)'
    . ~/.gitsh
  fi
  t_bold=\\[$(tput bold)\\] t_reset=\\[$(tput sgr0)\\]
  PS1="$t_reset\\n$t_bold\\u@\\h:\\w$t_reset$gitps1\\n\\$ "; PS2='> '; PS3='? '; PS4='+ '

  unalias -a; [[ -r ~/.aliasrc ]] && . ~/.aliasrc
fi

[[ -r ~/.bashrc_local ]] && . ~/.bashrc_local

# ruby version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# python's virtualenv (for when invoked from screen)
[[ -r bin/activate ]] && . bin/activate
