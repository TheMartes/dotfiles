# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/martes/.zsh/completions:"* ]]; then export FPATH="/Users/martes/.zsh/completions:$FPATH"; fi
# Path
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="$HOME/.rover/bin:$PATH"
export PATH="/usr/local/opt/go/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$PATH:$(go env GOPATH)/bin
export TMUX_TMPDIR=~/.tmux/tmp
export GO111MODULE=on
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

alias make='gmake'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Theme
ZSH_THEME="robbyrussell"
export BAT_THEME="Catppuccin-mocha"

# pnpm
export PNPM_HOME="/Users/martes/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
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

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

# gnupg fix arch linux
GPG_TTY=$(tty)
export GPG_TTY

[[ "$TERM_PROGRAM" == "CodeEditApp_Terminal" ]] && . "/Applications/CodeEdit.app/Contents/Resources/codeedit_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/martes/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/martes/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi
. "/Users/martes/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH
