#!/bin/bash
set -e

URL="https://github.com/pakeelz/dotfiles"
DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

mkdir $DIR
git clone https://github.com/pakeelz/dotfiles $DIR

NVIM="$DIR/nvim"
KITTY="$DIR/kitty"
HYPR="$DIR/hypr"
NOCT="$DIR/noctalia"
PIC="$DIR/pictures"
ZED="$DIR/zed"
STARSHIP="$DIR/starship.toml"

FOLDERS=("$NVIM" "$KITTY" "$HYPR" "$NOCT" "$PIC" "$ZED" "$STARSHIP")

if [ -d $CONFIG_DIR ]; then
  for folder in "${FOLDERS[@]}"; do
    mv $folder $CONFIG_DIR
  done
fi
