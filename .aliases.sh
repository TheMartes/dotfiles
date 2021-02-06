#System
alias c="clear"
alias l="ls -oh"
alias la="ls -oAh"
alias tmux_reload="tmux source-file ~/.tmux.conf"
alias bash_reload="source $HOME/.bashrc"
alias zsh_reload="source $HOME/.zshrc"
alias weather='curl -4 http://wttr.in/Prague'
alias stop_containers="$HOME/.docker-fix.sh"
alias holy_trinity="git submodule update --init --force --recursive"

# Only if I'm using bash
# alias take="mkdir $1 && cd !*"

# For laravel thingies
alias art="php artisan "

#Git
alias ga="git add $1"
alias gs="git status"
alias nah="git reset --hard;git clean -df;"
