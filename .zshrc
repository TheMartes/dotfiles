# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.config/bin:$PATH
export PATH=$HOME/.config/diff-so-fancy:$PATH
export PATH=/snap/bin:$PATH
export PATH=$HOME/.config/diff-so-fancy:$PATH
export PATH=/home/martes/.local/bin:$PATH
export PATH=/home/martes/go/bin:$PATH

# Export ZSH
export ZSH="/home/martes/.oh-my-zsh"

# Set a theme
ZSH_THEME=""

# Plugins
plugins=(git)

# Source zsh
source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases.sh

unalias grv
complete -F __start_kubectl k

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten
