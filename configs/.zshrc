# Path
export ZSH="/Users/martes/.oh-my-zsh"
export PATH="/Users/martes/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/Users/martes/.rover/bin:$PATH"
export PATH="/usr/local/opt/go/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$PATH:$(go env GOPATH)/bin
export TMUX_TMPDIR=~/.tmux/tmp
export GO111MODULE=on
export HOMEBREW_NO_AUTO_UPDATE=1

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Theme
ZSH_THEME="robbyrussell"
export BAT_THEME="Catppuccin-mocha"

# pnpm
export PNPM_HOME="/Users/martes/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

STOW_FOLDERS="bin,configs,iterm,karabiner,nvim,secrets,workspacify"

# Colorful LS
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Aliases
source $HOME/.aliases.sh
alias ls="gls --color=always"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzfCodeDirs() {
    local dir
    dir=$(find ~/Code -mindepth 1 -maxdepth 1 -type d | fzf) &&
    cd "$dir"
}

zle -N fzfCodeDirs
bindkey "^f" fzfCodeDirs

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/Users/martes/.bun/_bun" ] && source "/Users/martes/.bun/_bun"

eval "$(starship init zsh)"
