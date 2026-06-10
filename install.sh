#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(realpath "$(dirname "$0")/home")"

find "$DOTFILES_DIR" -type f | while read -r src; do
    rel="${src#$DOTFILES_DIR/}"
    dst="$HOME/$rel"

    mkdir -p "$(dirname "$dst")"

    # Already linked correctly
    if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$src" ]; then
        continue
    fi

    # Refuse to overwrite existing files
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "Skipping existing file: $dst"
        continue
    fi

    rm -f "$dst"
    ln -s "$src" "$dst"

    echo "Linked $dst"
done