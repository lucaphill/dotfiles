# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"

# Variáveis de ambiente
export EDITOR=helix
export VISUAL=helix
export ENTRY_COUNTRY=BR

# ssh-agent, só se ainda não houver um
[[ -z $SSH_AUTH_SOCK ]] && eval "$(ssh-agent -s)" >/dev/null

# zoxide
eval "$(zoxide init zsh)"
alias cd=z

# Limpa a tela se o terminal abrir pequeno e for redimensionado logo no início
zmodload zsh/datetime
typeset -gi shell_start=$EPOCHSECONDS
TRAPWINCH() {
  (( EPOCHSECONDS - shell_start <= 1 )) || return
  (( $(tput lines) <= 25 )) || return
  zle && zle clear-screen
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
