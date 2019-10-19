# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.config/bin:$PATH

# Export ZSH
export ZSH="/home/martes/.oh-my-zsh"

# Set a theme
ZSH_THEME="oxide"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source zsh
source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases.sh

# Git Credentials
GIT_AUTHOR_NAME="TheMartes"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="matt.buncek@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
