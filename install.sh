#!/usr/bin/env bash

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case first pipe command fails (but second succeeds)
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

__script_dir="$(cd "$(dirname "${BASH_SOURCE[${__b3bp_tmp_source_idx:-0}]}")" && pwd)"

# Configuration
hostname="Zion"
trackpad=true # there is a trackpad in this computer?
apple_language="en" # system language

# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
apple_locale="en_GB@currency=EUR"
apple_measurement_units="Centimeters"
apple_metric_units=true
timezone="Europe/Madrid"

non_apple_lcd=true # there is a non-apple LCD attached to this computer?

# Hot Corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
tl_corner=5 # top left corner
tr_corner=0 # top right corner
bl_corner=2 # bottom left corner
br_corner=4 # bottom right corner

# This script install needed system dependencies and symlinks all dotfiles

# include some helpers
source ./sh/helpers.sh
source ./sh/echos.sh

# exit if hostname is not defined
HOSTNAME=${hostname:-}
if [[ -z "$HOSTNAME" ]]; then
    error "Edit ./install.sh and add your hostname" 1>&2
    exit 1
fi

bot "Hi! I'm going to install some packages and tweak your system settings."

# Ask for the administrator password upfront
ask_admin_password

# ensure homebrew is installed
ensure_homebrew_is_installed

# install brew (and cask) packages defined in `Brewfile`
brew_bundle

# install npm global packages defined in npm_globals.txt
# npm_global_install

# ensure zsh from homebrew is the user default shell
ensure_zsh_is_default_shell

# run some MacOS tweaks
macos_tweaks

# initialize / updates submodules
init_submodules

# symlink dotfiles
do_symlink

# run homebrew cleanup
homebrew_cleanup

bot "All done! You might need to restart now :)"
