# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH=/Users/martes/.oh-my-zsh

# Theme
ZSH_THEME="oxide"

# Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases.sh
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Start tmux
tmux
