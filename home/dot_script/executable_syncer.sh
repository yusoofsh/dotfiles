#!/opt/homebrew/bin/zsh

# Update macOS applications
echo "Updating macOS applications..."
mas upgrade

# Update Homebrew package list
echo "Updating Homebrew package list..."
brew update

# Upgrade all installed Homebrew packages
echo "Upgrading installed Homebrew packages..."
brew upgrade

# Remove outdated or unused Homebrew dependencies
echo "Cleaning up Homebrew..."
brew cleanup

# Update Sheldon's locked packages
echo "Updating Sheldon and modules..."
sheldon lock --update

# Dump the current state of installed Homebrew packages with descriptions (global scope and forced refresh)
echo "Dumping installed Homebrew packages..."
brew bundle dump --global --describe --force

# Re-add any deleted or modified dotfiles from Chezmoi
echo "Re-adding Chezmoi dotfiles..."
chezmoi re-add

# Update Chezmoi and apply any changes to dotfiles
echo "Updating Chezmoi dotfiles..."
chezmoi update
