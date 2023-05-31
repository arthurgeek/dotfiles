# Hide Spotlight tray-icon
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

# Disable Spotlight indexing
sudo mdutil -i off
