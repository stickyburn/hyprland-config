source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-z/zsh-z.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -Uz compinit && compinit
source ~/.config/zsh/aliases

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' +'l:|=* r:|=*'

setopt AUTO_CD
setopt COMPLETE_IN_WORD
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

autoload -Uz vcs_info
precmd() {
  precmd(){
    vcs_info
    echo
  }
}

export EDITOR=vim
export NNN_COLORS='77ff'
export NNN_FCOLORS='c1e2552eab6033f7c6d6abc4'

export PNPM_HOME="$HOME/.local/pnpm"
export PNPM_STORE_DIR="$PNPM_HOME/store"
path=("$PNPM_HOME" $path)

setopt prompt_subst
zstyle ':vcs_info:git:*' formats '🐙 %b'
export RPROMPT='%F{085}%D{%L:%M}%f'
export PROMPT='%F{085}%1d ${vcs_info_msg_0_}
>%f '

# uv and fly deployments
. "$HOME/.local/bin/env"
export FLYCTL_INSTALL="/home/Yas/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/Yas/.local/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# opencode
export PATH=/home/Yas/.opencode/bin:$PATH
