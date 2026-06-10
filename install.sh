#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)/home"

find "$DOTFILES_DIR" -mindepth 1 | while read -r src; do
    rel="${src#$DOTFILES_DIR/}"
    dst="$HOME/$rel"

    mkdir -p "$(dirname "$dst")"

    [ -e "$dst" ] || [ -L "$dst" ] && rm -rf "$dst"

    ln -s "$src" "$dst"
done