#!/bin/sh

echo "Upgrading Homebrew packages and update the .Brewfile..."
brew update && brew upgrade && brew cleanup && brew bundle dump --global --describe --force
brew upgrade bottom keka latest neovim proto starship timemachineeditor

echo "Updating App Store applications..."
mas upgrade

echo "Updating Proto tools..."
proto install node && proto install npm && proto install pnpm && proto install yarn

echo "Updating Visual Studio Code extensions..."
code --update-extensions

echo "Updating Sheldon plugins..."
sheldon lock --update

echo "Updating TLDR caches..."
tldr --update

echo "Re-adding Chezmoi dotfiles..."
chezmoi init && chezmoi re-add --force
