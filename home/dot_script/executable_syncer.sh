#!/bin/bash

echo "Updating App Store applications..."
mas upgrade

echo "Upgrading Homebrew packages and update the .Brewfile..."
brew update && brew upgrade && brew cleanup && brew bundle dump --global --describe --force

echo "Updating Sheldon plugins..."
sheldon lock --update

echo "Updating TLDR caches..."
tldr --update

echo "Re-adding Chezmoi dotfiles..."
chezmoi re-add;
