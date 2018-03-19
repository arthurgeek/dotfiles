# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName $hostname
sudo scutil --set HostName $hostname
sudo scutil --set LocalHostName $hostname
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $hostname
