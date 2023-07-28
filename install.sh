#!/bin/bash
set -eufo pipefail

# Install Homebrew
command -v brew >/dev/null 2>&1 || \
  (echo "🍺 Installing Homebrew" && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Install chezmoi
command -v chezmoi >/dev/null 2>&1 || \
  (echo "🏠 Installing chezmoi" && brew install chezmoi)

# Initialize chezmoi
echo "🚀 Initializing chezmoi" && chezmoi init --branch chezmoi https://github.com/arthurgeek/dotfiles
echo "🪄 Applying dotfiles" && chezmoi apply

echo ""
echo "🏁 Done."
