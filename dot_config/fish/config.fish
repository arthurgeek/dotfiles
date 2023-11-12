set -gx fish_greeting
set -gx ANSIBLE_FORCE_COLOR true

if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
end

direnv hook fish | source
starship init fish | source
zoxide init fish | source
thefuck --alias | source
abbr --global cat "bat --theme Dracula"
abbr --global f "fuck"
abbr --global k "kubectl"
