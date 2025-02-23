#!/bin/bash

# Help message function
show_usage() {
  echo "Usage: $(basename "$0") <old_path> <new_path>"
  echo "Updates VS Code history entries by replacing old path with new path"
  echo
  echo "Arguments:"
  echo "  old_path    The path to be replaced"
  echo "  new_path    The new path to use"
  exit 1
}

# Check if help is requested
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  show_usage
fi

# Validate argument count
if [ $# -ne 2 ]; then
  echo "Error: Expected 2 arguments, got $#"
  show_usage
fi

old_path="$1"
new_path="$2"
history_dir="$HOME/Library/Application Support/Code/User/History"

# Check if history directory exists
if [ ! -d "$history_dir" ]; then
  echo "Error: VS Code history directory not found at: $history_dir"
  exit 1
fi

# Check if sd is installed
if ! command -v sd &>/dev/null; then
  echo "Error: 'sd' command not found. Please install it with: brew install sd"
  exit 1
fi

# Count files before processing
file_count=$(find "$history_dir" -name "entries.json" -type f | wc -l)

if [ "$file_count" -eq 0 ]; then
  echo "No entries.json files found in history directory"
  exit 0
fi

echo "Found $file_count entries.json files to process..."

# Process files with progress indicator
current=0
while IFS= read -r file; do
  ((current++))
  echo -n "Processing file $current/$file_count: $(basename "$(dirname "$file")")... "
  sd "$old_path" "$new_path" "$file"
  echo "done"
done < <(find "$history_dir" -name "entries.json" -type f)

echo
echo "✅ VS Code history paths updated successfully"
echo "   Old path: $old_path"
echo "   New path: $new_path"
