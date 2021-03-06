function ask_admin_password() {
    bot "I need you to enter your sudo password so I can start:"
    sudo -v

    # Keep-alive: update existing sudo timestamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

function ensure_homebrew_is_installed() {
    running "checking homebrew install"

    brew_bin=$(which brew) 2>&1 > /dev/null
    if [[ $? != 0 ]]; then
        action "installing homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [[ $? != 0 ]]; then
            error "unable to install homebrew, script $0 abort!"
            exit 2
        fi
    else
        ok
        # Make sure we’re using the latest Homebrew
        running "updating homebrew"
        brew update
        ok
        bot "before installing brew packages, we can upgrade any outdated packages."
        read -r -p "run brew upgrade? [y|N] " response
        if [[ $response =~ ^(y|yes|Y) ]];then
            # Upgrade any already-installed formulae
            action "upgrade brew packages"
            brew upgrade
            ok "brews updated..."
        else
            ok "skipped brew package upgrades";
        fi
    fi
}

function brew_bundle() {
    action "brew bundle"
    brew bundle
    ok
}

function ensure_zsh_is_default_shell() {
    # check current shell
    running "checking if zsh is the current shell"
    CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
    if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
        action "setting newer homebrew zsh (/usr/local/bin/zsh) as your shell"
        sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
    fi
    ok
}

function macos_tweaks() {
    read -r -p "do you want to run MacOS tweaks? [y|N] " response

    if [[ $response =~ ^(y|yes|Y) ]];then
        . ./sh/macos.sh
    else
        ok "skipping MacOS tweaks"
    fi
}

function init_submodules() {
  action "initializing submodules"
  git submodule update --init --recursive > /dev/null 2>&1
  ok
}

function ensure_brew() {
    running "checking if $1 is installed"

    if brew ls --versions $1 > /dev/null; then
        ok
    else
        action "brew install $1"
        brew install $1 > /dev/null
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
        fi
        ok
    fi
}

function do_symlink() {
    action "symlinking dotfiles"

    ensure_brew "stow"

    for dir in */ ; do
        if [[ $dir == "sh/" || $dir == "macos/" ]]; then
            continue
        fi

        running "creating symlinks for $dir..."
        stow --ignore='.DS_Store'  --target=$HOME $dir
        ok
    done
}

function ensure_node_is_installed() {
    running "checking if node is installed"

    if brew ls --versions node > /dev/null; then
        ok
    else
        action "brew install node"
        brew install node > /dev/null
        if [[ $? != 0 ]]; then
            error "failed to install node! aborting..."
        fi
        ok
    fi
}

npm_global_install() {
    action "installing node global packages"

    ensure_brew "node"

    cat npm_globals.txt | xargs npm install -g > /dev/null 2>&1

    ok
}

function homebrew_cleanup() {
    action "cleanup homebrew"
    brew cleanup > /dev/null 2>&1
    ok
}
