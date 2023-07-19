#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# K8s
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
alias k="kubectl"

# Sops
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt

# Direnv
eval "$(direnv hook zsh)"

# terraform
complete -o nospace -C /opt/homebrew/bin/terraform terraform
