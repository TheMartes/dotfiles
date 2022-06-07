#System
alias c="clear"
alias g="git "
alias l="ls -oh"
alias la="ls -oAh"
alias tmux_reload="tmux source-file ~/.tmux.conf"
alias bash_reload="source $HOME/.bashrc"
alias weather='curl -4 http://wttr.in/Trnava'
alias holy_trinity="git submodule update --init --force --recursive"
alias hh="history | grep gds"
alias vim="nvim $1"
alias v="nvim $1"

#Git
alias gi="git init"
alias ga="git add $1"
alias gs="git status"
alias gc="git commit -m $1"
alias push="git push"
alias pull="git pull"
alias checkout="git checkout $1"
alias branch="git branch $1"
alias nah="git reset --hard;git clean -df;"

unset gcs
alias gcs="bash $HOME/.git-credentials-setter.sh " # leave the space in the end, due to argument passing

