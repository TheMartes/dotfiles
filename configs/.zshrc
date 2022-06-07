# Path
export ZSH="/Users/martes/.oh-my-zsh"
export PATH="/Users/martes/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$PATH:$(go env GOPATH)/bin
export TMUX_TMPDIR=~/.tmux/tmp
export GIT_USER="buncekm"
export GIT_TOKEN="yeUd13r4MBeftTx44RwM"

# Theme
ZSH_THEME="afowler"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Colorful LS
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Aliases
source $HOME/.aliases.sh
alias ls="gls --color=always"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzfCodeDirs() {
    local dir
    dir=$(find ~/Code -mindepth 1 -maxdepth 1 -type d | fzf) &&
    cd "$dir"
}

zle -N fzfCodeDirs
bindkey "^f" fzfCodeDirs

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
