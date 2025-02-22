#!/bin/sh

set -eu

if ! chezmoi="$(command -v chezmoi)"; then
    bin_dir="${HOME}/.local/bin"
    chezmoi="${bin_dir}/chezmoi"
    echo "Installing chezmoi to '${chezmoi}'" >&2
    chezmoi_install_script="$(curl -fsSL get.chezmoi.io)"
    sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
    unset chezmoi_install_script bin_dir
fi


echo "Running 'chezmoi init'" >&2
exec "$chezmoi" init --verbose --apply yusoofsh
