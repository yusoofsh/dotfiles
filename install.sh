#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚 This script will setup .dotfiles for you."
read -n 1 -r -s -p $'\n    Press any key to continue or Ctrl+C to abort...\n'

# Check if Homebrew is installed, if not install it
if ! command -v brew &>/dev/null; then
    echo ""
    echo "🍺 Installing Homebrew and it's dependencies"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ $(uname -s) == "Darwin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ $(uname -s) == "Linux" ]]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

        if [[ $(lsb_release -si) == "Ubuntu" ]]; then
            echo ""
            echo "📦 Installing packages for Ubuntu"

            sudo apt-get update
            sudo apt-get install -y build-essential procps curl file git
        elif [[ $(lsb_release -si) == "Fedora" ]]; then
            echo ""
            echo "📦 Installing packages for Fedora"

            sudo dnf groupinstall -y 'Development Tools'
            sudo dnf install -y procps-ng curl file git
        else
            echo ""
            echo "❌ Unsupported Linux distribution"
            exit 1
        fi
    else
        echo ""
        echo "❌ Unsupported OS"
        exit 1
    fi
fi

# Use brew for these packages
brew install gcc git curl

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
