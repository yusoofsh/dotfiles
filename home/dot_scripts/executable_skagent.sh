#!/bin/bash

# Directory containing SSH keys
SSH_DIR="$HOME/.ssh"

# Start the SSH agent if not already running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
fi

# Add valid SSH keys to the agent
for key in "$SSH_DIR"/*.pub; do
    # Check if file exists and is not empty
    [ -f "$key" ] || continue
    base_key="${key%.pub}"
    if [ -f "$base_key" ]; then
        ssh-add -q --apple-use-keychain "$base_key"
    fi
done
