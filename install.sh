#!/bin/bash
set -e

URL="https://github.com/pakeelz/dotfiles"
DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

mkdir $DIR
git clone https://github.com/pakeelz/dotfiles $DIR

NVIM="$DIR/nvim/"
KITTY="$DIR/kitty/"
HYPR="$DIR/hypr/"
NOCT="$DIR/noctalia/"
PIC="$DIR/pictures/"
ZED="$DIR/zed/"
STARSHIP="$DIR/starship.toml"
ZATHURA="$DIR/zathura/"
FASTFETCH="$DIR/fastfetch/"

FOLDERS=("$NVIM" "$KITTY" "$HYPR" "$NOCT" "$ZED" "$STARSHIP" "$ZATHURA" "$FASTFETCH")

if [ -d $CONFIG_DIR ]; then
  for folder in "${FOLDERS[@]}"; do
    if [ -d $folder ]; then
      echo "Moving $(basename "$folder") config"
      rsync -a $folder "$CONFIG_DIR/$(basename "$folder")"
    else
      mv $folder $CONFIG_DIR
    fi
  done
fi

echo "Moving pictures"
rsync -a $PIC "$HOME"

echo "Cleaning up $DIR"
rm -rf $DIR
