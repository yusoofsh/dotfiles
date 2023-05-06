#!/opt/homebrew/bin/zsh

# Update macOS system software
echo ""
softwareupdate -ia

# Update Mac App Store apps
echo ""
mas upgrade

# Update Homebrew
echo ""
brew update
brew upgrade

# Sync dotfiles and installed apps
echo ""
brew bundle dump --global --describe --force
chezmoi re-add
chezmoi update

# Send a notification when updates are done
if [ $? -eq 0 ]; then
    terminal-notifier -title "Updates" -message "All updates completed."
else
    terminal-notifier -title "Updates" -message "Updates failed. Check logs."
fi
