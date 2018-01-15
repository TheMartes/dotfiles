# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Volumes/martes/.oh-my-zsh

# Theme
ZSH_THEME="spaceship"

# Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases.sh

# Spaceship Theme
source "/Volumes/martes/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
