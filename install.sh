#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚  This script will setup .dotfiles for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

# Install Homebrew
command -v brew >/dev/null 2>&1 ||
	(echo '🍺  Installing Homebrew' && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Install chezmoi
command -v chezmoi >/dev/null 2>&1 ||
	(echo '👊  Installing chezmoi' && brew install chezmoi)

# Initialize dotfiles
(echo '🚀  Initializing dotfiles' && chezmoi init yusoofsh --apply --verbose)

echo ""
echo "✅  Done."
