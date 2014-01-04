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

# some of these hide shell commands (eg 'reset', 'diff')
# to bypass use: 'command reset', 'command diff', etc.
alias add='git add'
alias amend='git amend'
alias bisect='git bisect'
alias blame='git blame'
alias branch='git branch'
alias checkout='git checkout'
alias commit='git commit'
alias diff='git diff'
alias fetch='git fetch'
alias log='git log'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias rebase='git rebase'
alias remote='git remote'
alias reset='git reset'
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
