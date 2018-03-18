#!/usr/bin/env bash

# some colorized echo helpers
# mostly taken from: https://github.com/atomantic/dotfiles/blob/master/lib_sh/echos.sh

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"

function ok() {
    message=${1:-}
    echo -e "$COL_GREEN[ok]$COL_RESET "$message
}

function bot() {
    message=${1:-}
    echo -e "\n$COL_GREEN\[._.]/$COL_RESET - "$message
}

function running() {
    message=${1:-}
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$message": "
}

function action() {
    message=${1:-}
    echo -e "\n$COL_YELLOW[action]:$COL_RESET\n ⇒ $message..."
}

function warn() {
    message=${1:-}
    echo -e "$COL_YELLOW[warning]$COL_RESET "$message
}

function error() {
    message=${1:-}
    echo -e "$COL_RED[error]$COL_RESET "$message
}
