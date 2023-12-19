#!/bin/bash

# Use a while loop to read lines
chezmoi managed --include encrypted --path-style absolute | while IFS= read -r encrypted_file; do
  echo "Forgetting: $encrypted_file"
  chezmoi forget --force "$encrypted_file"

  decrypted_file="${encrypted_file%.asc}"

  echo "Decrypting: $encrypted_file -> $decrypted_file"
  # Add your decryption command here

  echo "Adding: $decrypted_file"
  chezmoi add --encrypt "$decrypted_file"
done
