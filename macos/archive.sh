# Move archive files to trash after expansion

# Delete directly: "/dev/null"
# Leave alone (default) "."
defaults write com.apple.archiveutility dearchive-move-after -string "~/.Trash"
