#!/bin/bash
set -e

# Update System and Install Some Apps
sudo apt update && sudo apt upgrade
sudo apt install neovim git curl starship zsh ripgrep eza gnome-tweaks gcc zathura

# Setup git
git config --global user.name "Pakel"
git config --global user.email wppakel@gmail.com

# Install CascadiaCode Nerd Font
curl -Lo ~/Downloads/CascadiaCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/CascadiaCode.zip
unzip ~/Downloads/CascadiaCode.zip -d ~/Downloads
sudo mv ~/Downloads/*.ttf /usr/share/fonts/
rm ~/Downloads/README.md ~/Downloads/LICENSE

# Change Shell
chsh -s $(which zsh)

# Install cloudflare-warp
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

sudo apt-get update && sudo apt-get install cloudflare-warp

# Config Section
URL="https://github.com/pakeelz/dotfiles"
DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

mkdir $DIR
git clone https://github.com/pakeelz/dotfiles $DIR

NVIM="$DIR/nvim/"
KITTY="$DIR/kitty/"
PIC="$DIR/pictures/"
ZED="$DIR/zed/"
STARSHIP="$DIR/starship.toml"
ZATHURA="$DIR/zathura/"
FASTFETCH="$DIR/fastfetch/"
ZSH_CONFIG="$DIR/.zshrc"

FOLDERS=("$NVIM" "$KITTY" "$ZED" "$STARSHIP" "$ZATHURA" "$FASTFETCH")

if [ -d $CONFIG_DIR ]; then
  for folder in "${FOLDERS[@]}"; do
    if [ -d "$CONFIG_DIR/$(basename "$folder")" ]; then
      echo "Rsync $(basename "$folder") config"
      rsync -a $folder "$CONFIG_DIR/$(basename "$folder")"
    else
      echo "Moving $folder config"
      mv $folder $CONFIG_DIR
    fi
  done
fi

echo "Moving pictures"

if [ -d "$HOME/Pictures/" ]; then
  rsync -a $PIC "$HOME"
else
  mv $PIC "$HOME"
fi

# Setup zsh
mv $ZSH_CONFIG ~/
mkdir ~/.zsh_plugins

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh_plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh_plugins

echo "Cleaning up $DIR"
rm -rf $DIR
