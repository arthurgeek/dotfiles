set -gx fish_greeting
set -gx ANSIBLE_FORCE_COLOR true
set -gx TERM wezterm
set -gx EDITOR nvim

# GOLANG configurations
set -gx GOPATH $HOME/Development/go
set -gx GOROOT /opt/homebrew/opt/go/libexec
set -gx PATH $GOPATH/bin $GOROOT/bin $PATH

# LazyGit
set -gx LG_CONFIG_FILE $HOME/.config/lazygit/config.yml

# EXA plugin config
set EXA_STANDARD_OPTIONS --group --git --header --group-directories-first --icons
set EXA_L_OPTIONS $EXA_STANDARD_OPTIONS
set EXA_LT_OPTIONS --long --tree --level

# FZF plugin config
set fzf_preview_dir_cmd eza $EXA_STANDARD_OPTIONS --all --oneline --color=always
set fzf_diff_highlighter delta --features="default decorations" --paging=never
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

# Kubectl krew
set -gx PATH $PATH $HOME/.krew/bin

fish_config theme choose "Catppuccin Mocha"

/opt/homebrew/bin/brew shellenv | source
direnv hook fish | source
starship init fish | source
zoxide init fish --cmd cd | source
thefuck --alias | source
chezmoi completion fish | source
wezterm shell-completion --shell fish | source

abbr --global cat bat
abbr --global f fuck
abbr --global k kubectl
abbr --global vim nvim
abbr --global vi nvim
abbr --global ls l
abbr --global vimdiff nvim -d
