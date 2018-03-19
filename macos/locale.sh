# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array $apple_language
defaults write NSGlobalDomain AppleLocale -string $apple_locale
defaults write NSGlobalDomain AppleMeasurementUnits -string $apple_measurement_units
defaults write NSGlobalDomain AppleMetricUnits -bool $apple_metric_units

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone $timezone > /dev/null
