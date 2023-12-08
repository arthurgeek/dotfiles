set -gx fish_greeting
set -gx ANSIBLE_FORCE_COLOR true

# GOLANG configurations
set -gx GOPATH $HOME/Development/go
set -gx GOROOT /opt/homebrew/opt/go/libexec
set -gx PATH $GOPATH/bin $GOROOT/bin $PATH

if status is-interactive
  eval (/opt/homebrew/bin/brew shellenv)
end

direnv hook fish | source
starship init fish | source
zoxide init fish | source
thefuck --alias | source
abbr --global cat "bat --theme Dracula"
abbr --global f fuck
abbr --global k kubectl
abbr --global vim nvim
abbr --global vi nvim

function kubectl
  kubecolor $argv
end
