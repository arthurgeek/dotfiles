set -gx fish_greeting
set -gx ANSIBLE_FORCE_COLOR true

if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
end

direnv hook fish | source
starship init fish | source
zoxide init fish | source
thefuck --alias | source

alias cat="bat --theme Dracula"
alias f="fuck"
alias k="kubecolor"
alias kubectl="kubecolor"
