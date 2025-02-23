#!/bin/bash

echo "Upgrading Homebrew packages and update the .Brewfile..."
brew update && brew upgrade && brew cleanup && brew bundle dump --global --describe --force

echo "Updating Sheldon plugins..."
sheldon lock --update

echo "Re-adding Chezmoi dotfiles..."
chezmoi init && chezmoi re-add --force
