# PATH — interactive-only
export PATH="$HOME/.config/pear/bin:$PATH"

source "$ZDOTDIR/secrets/secrets.zsh"

source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"

source ~/.config/zsh/plugins/zsh-history-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -Uz compinit && compinit
source ~/.config/zsh/aliases/git
source ~/.config/zsh/aliases/system
[[ -f ~/.config/zsh/aliases/python ]] && source ~/.config/zsh/aliases/python

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
_skip_first_newline=1
precmd_hooks() {
  vcs_info
  if [[ -n "$_skip_first_newline" ]]; then
    unset _skip_first_newline
  else
    echo
  fi
}
precmd_functions+=(precmd_hooks)

setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{#c79eff} %b%f'
export RPROMPT='%F{#555}%D{%H:%M}%f'
export PROMPT='%F{#ff91c3}%1d%f ${vcs_info_msg_0_}
%F{#ff338f}›%f '
