#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# needed deps
apt install cmake gcc clang git curl zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install neovim
curl -O https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
cp -r nvim-linux64/bin/* /usr/bin/
cp -r nvim-linux64/lib/* /usr/lib/
cp -r nvim-linux64/share/* /usr/share/
cp -r nvim-linux64/man/* /usr/share/man
rm -rf nvim-linux64.tar.gz nvim-linux64/
echo "alias vim=\"nvim\"" > $HOME/.zshrc

# install zoxide
apt install zoxide
echo "eval \"$(zoxide init zsh)\"" > $HOME/.zshrc

# refresh
source $HOME/.zshrc
