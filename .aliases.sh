#System
alias dev="cd ~/Code"
alias c="clear"
alias l="ls -oh"
alias la="ls -oAh"

#Laravel
alias art="php artisan"
alias migrate="php artisan migrate"
alias rollback="php artisan migrate:rollback"
alias refresh="php artisan migrate:refresh"
alias fresh="php artisan migrate:fresh"
alias serve="php artisan serve"
alias mfs="php artisan migrate:fresh --seed"
alias m:c="php artisan make:controller $1 -r"
alias m:m="php artisan make:model $1 -m"
alias tinker="php artisan tinker"

#Composer
alias cu="composer update"
alias cg="composer global update"
alias cdump="composer dump autoload"
alias cr="composer require"
alias crg="composer global require"

#Git
alias gi="git init"
alias ga="git add $1"
alias gs="git status"
alias gc="git commit -m $1"
alias push="git push"
alias pull="git pull"
alias checkout="git checkout $1"
alias branch="git branch $1"
