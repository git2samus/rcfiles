# vim: set filetype=sh:

alias mtab='cat /etc/mtab'
alias fstab='cat /etc/fstab'

alias today='date +%d/%m/%y'

alias :e='vim'
alias :q='exit'

alias ll='ls -lh'
alias lc='ls --color=auto'
alias llc='ls -lh --color=auto'

alias grep-c='grep --color'
alias egrep-c='egrep --color'
alias fgrep-c='fgrep --color'

alias add='git add'
alias amend='git amend'
alias blame='git blame'
alias branch='git branch'
alias checkout='git checkout'
alias commit='git commit'
alias diff='git diff'
alias log='git log'
alias pull='git pull'
alias push='git push'
alias rebase='git rebase'
alias reset='git reset' # this hides shell's reset but fuckit
alias show='git show'
alias status='git status'
alias tag='git tag'

alias git-np='git --no-pager'
alias tree-log='git log --all --graph --decorate --oneline'

alias scr='screen -dmr'
alias scl='screen -list'
alias scs='screen -S'

alias rm-pyc="find -name '*.pyc' -delete"

[[ -e ~/.bash_aliases_local ]] && . ~/.bash_aliases_local
