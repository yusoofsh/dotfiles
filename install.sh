#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚 This script will setup .dotfiles for you."
echo "💬 Ensure you have imported the GPG private key to decrypt the files."
read -n 1 -r -s -p $'\n    Press any key to continue or Ctrl+C to abort...\n'

if [[ $(uname -s) == "Darwin" ]]; then
    # Check if Homebrew is installed, if not install it
    if ! command -v brew &>/dev/null; then
        echo ""
        echo "🍺 Installing Homebrew and it's dependencies"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Check if chezmoi is installed, if not install it
    if ! command -v chezmoi &>/dev/null; then
        echo ""
        echo "� Installing chezmoi"
        brew install chezmoi
    fi

    # Initialize dotfiles
    echo ""
    echo "🚀 Initializing dotfiles"
    chezmoi init --verbose --apply --ssh yusoofsh

elif [[ $(uname -s) == "Linux" ]]; then
    # Initialize dotfiles
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME"/.local/bin init --apply yusoofsh

else
    echo ""
    echo "❌ Unsupported system"

fi

echo ""
echo "✅ Done."
