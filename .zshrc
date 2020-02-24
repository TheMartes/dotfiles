# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.config/bin:$PATH
export PATH=$HOME/.config/diff-so-fancy:$PATH

# Export ZSH
export ZSH="/home/martes/.oh-my-zsh"

# Set a theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Source zsh
source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases.sh
