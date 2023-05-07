#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚 This script will setup .dotfiles for you."
read -n 1 -r -s -p $'\n    Press any key to continue or Ctrl+C to abort...\n
'

# Check if Homebrew is installed, if not install it
if ! command -v brew &> /dev/null
then
    echo ""
    echo "🍺 Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Check if chezmoi is installed, if not install it
if ! command -v chezmoi &> /dev/null
then
    echo ""
    echo "👊 Installing chezmoi"
    brew install chezmoi
fi

# Initialize dotfiles
echo ""
echo "🚀 Initializing dotfiles"
chezmoi init --apply --verbose yusoofsh

echo ""
echo "✅ Done."
