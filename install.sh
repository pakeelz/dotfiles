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
ZATHURA="$DIR/zathura"
FASTFETCH="$DIR/fastfetch"

FOLDERS=("$NVIM" "$KITTY" "$HYPR" "$NOCT" "$ZED" "$STARSHIP" "$ZATHURA" "$FASTFETCH")

if [ -d $CONFIG_DIR ]; then
  for folder in "${FOLDERS[@]}"; do
    rsync -a --remove-source-files $folder $CONFIG_DIR
  done
fi
