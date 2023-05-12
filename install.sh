#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚 This script will setup .dotfiles for you."
read -n 1 -r -s -p $'\n    Press any key to continue or Ctrl+C to abort...\n
'

# Check if Homebrew is installed, if not install it
if ! command -v brew &>/dev/null; then
    echo ""
    echo "🍺 Installing Homebrew and it's dependencies"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ $(uname -s) == "Darwin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    brew install gcc
fi

# Check if chezmoi is installed, if not install it
if ! command -v chezmoi &>/dev/null; then
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
