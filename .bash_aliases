# vim: set filetype=sh:

alias mtab="cat /etc/mtab"
alias fstab="cat /etc/fstab"

alias today="date +%d/%m/%y"

alias :e="vim"
alias :q="exit"

alias ll="ls -lh"
alias lc="ls --color=auto"
alias llc="ls -lh --color=auto"

alias grc="grep --color"
alias egrc="egrep --color"
alias fgrc="fgrep --color"

alias gnp="git --no-pager"
alias gad='git add'
alias gam='git amend'
alias gch='git checkout'
alias gco='git commit'
alias gdi='git diff'
alias gfe='git fetch'
alias glo='git log'
alias gme='git merge'
alias gpl='git pull'
alias gph='git push'
alias grb='git rebase'
alias gre='git reset'
alias gst='git status'
alias gsh='git stash'

alias scr="screen -dmr"
alias scl="screen -list"
alias scs="screen -S"

alias rm-pyc="find -name '*.pyc' -delete"

[[ -e ~/.bash_aliases_local ]] && . ~/.bash_aliases_local
