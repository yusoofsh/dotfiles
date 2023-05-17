#!/opt/homebrew/bin/zsh

echo ""
echo "Updating macOS system software"
softwareupdate -ia

echo ""
echo "Updating Mac App Store apps"
mas upgrade

echo ""
echo "Updating Homebrew and installed packages"
brew update
brew upgrade

echo ""
echo "Sync dotfiles and installed apps"
brew bundle dump --global --describe --force
chezmoi re-add
chezmoi update

# Send a notification when updates are done
if [ $? -eq 0 ]; then
    terminal-notifier -title "up.sh Result" -message "All updates completed."
else
    terminal-notifier -title "up.sh Result" -message "Updates failed. Check logs."
fi
