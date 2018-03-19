#!/usr/bin/env bash

# Mostly taken from https://github.com/mathiasbynens/dotfiles/blob/master/.macos

bot "I'll tweak your Mac OS ${hostname}"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
running "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'
ok

for file in macos/*; do
    running " Processing $(basename $file) configuration"
    . $file
    ok
done

ok "Done. Note that some of these changes require a logout/restart to take effect."
