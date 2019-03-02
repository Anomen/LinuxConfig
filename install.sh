#!/bin/bash
rm -rfv ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.gitconfig ~/.config/fish ~/.config/omf
ln -s ~/.vickev/vim/vimrc ~/.vimrc
ln -s ~/.vickev/zsh/zshrc ~/.zshrc
ln -s ~/.vickev/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.vickev/gitconfig ~/.gitconfig
ln -s ~/.vickev/fish ~/.config/fish
ln -s ~/.vickev/omf ~/.config/omf
#ln -s ~/.vickev/compiz/* ~/.config/compiz-1/compizconfig
#cp -r ~/.vickev/themes/* ~/.themes

# Install fish
if [ "$OSTYPE" = "linux-gnu" ] ; then
    echo "Install Fish"
    sudo -s bash -c "apt-get install fish"
    fish -c "omf install"
fi;

echo 'source ~/.vickev/bashrc' >> ~/.bashrc
