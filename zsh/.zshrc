source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"

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

export HISTSIZE=500
export SAVEHIST=500

autoload -Uz vcs_info
precmd() {
  precmd(){
    vcs_info
    echo
  }
}

setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %b'
export RPROMPT='%F{183}%D{%L:%M}%f'
export PROMPT='%F{183}%1d ${vcs_info_msg_0_}
%f '
