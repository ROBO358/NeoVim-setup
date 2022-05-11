#!/bin/sh

cd "dirname $0"

echo "SETUP Starting..."
sudo apt update

sudo apt -y install neovim curl
sudo sh -c "curl -sL install-node.vercel.app/lts | bash"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt -y autoremove
sudo apt -y autoclean

cp -frb ./bin/.config $HOME

mkdir -p $HOME/.local/share/fonts
cd $HOME/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

if ! grep -q "alias vim=nvim" $HOME/.zshrc; then
	echo "SET ALIAS"
	echo "alias vim=nvim" >> $HOME/.zshrc
	zsh -c "source '$HOME/.zshrc'"
fi

echo "Done"

echo "======"
echo "Execute the': PlugInstall' command on NeoVim."
echo "SET 'Droid Sans Mono for Powerline Nerd Font Complete.otf' TO THE DEFAULT FONT OF THE TERMINAL."
