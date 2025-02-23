#!/bin/bash

# Check if directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $(basename "$0") <directory>"
    echo "Example: $(basename "$0") ~/projects"
    exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist"
    exit 1
fi

# Convert to absolute path
search_dir=$(cd "$1" && pwd)

convert_to_https() {
  local dir="$1"
  cd "$dir" || return

  # Get current remote URL
  remote_url=$(git config --get remote.origin.url)

  # Check if URL is SSH format
  if [[ $remote_url == git@* ]]; then
    # Convert SSH to HTTPS format
    # From: git@github.com:username/repo.git
    # To: https://github.com/username/repo.git
    new_url=$(echo "$remote_url" | sed 's|git@\(.*\):\(.*\)|https://\1/\2|')

    # Update remote URL
    git remote set-url origin "$new_url"
    echo "Converted $dir"
    echo "  From: $remote_url"
    echo "  To: $new_url"
  fi
}

# Find all .git directories and process their parent directories
export -f convert_to_https
find "$search_dir" -type d -name ".git" -exec bash -c 'convert_to_https "${0%/.git}"' {} \;
