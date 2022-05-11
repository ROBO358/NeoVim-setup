#!/bin/sh

cd "dirname $0"

echo "SETUP Starting..."
sudo apt update
sudo apt -y upgrade

sudo apt -y install neovim curl
sudo sh -c "curl -sL install-node.vercel.app/lts | bash"
sudo sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt -y autoremove
sudo apt -y autoclean

cp -frb ./bin/.config $HOME

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
echo "Done"

echo "======"
echo "Execute the': PlugInstall' command on NeoVim."
echo "SET 'Droid Sans Mono for Powerline Nerd Font Complete.otf' TO THE DEFAULT FONT OF THE TERMINAL."
