#System
alias c="clear"
alias g="git "
alias k=kubectl
alias l="ls -oh"
alias la="ls -oAh"
alias tmux_reload="tmux source-file ~/.tmux.conf"
alias bash_reload="source $HOME/.bashrc"
alias weather='curl -4 http://wttr.in/Trnava'
alias holy_trinity="git submodule update --init --force --recursive"

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
alias wip="git add . && git commit -m 'wip'"

# GCS Is my custom script to set proper git credentials based on workspace im in
unset gcs
alias gcs="bash $HOME/.git-credentials-setter.sh " # leave the space in the end, due to argument passing

alias vim="nvim "
