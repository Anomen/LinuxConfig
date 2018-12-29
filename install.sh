#!/bin/sh
rm -rfv ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.gitconfig
ln -s ~/.vickev/vim/vimrc ~/.vimrc
ln -s ~/.vickev/zsh/zshrc ~/.zshrc
ln -s ~/.vickev/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.vickev/gitconfig ~/.gitconfig
ln -s ~/.vickev/inputrc ~/.inputrc
#ln -s ~/.vickev/compiz/* ~/.config/compiz-1/compizconfig
#cp -r ~/.vickev/themes/* ~/.themes

echo 'source ~/.vickev/bashrc' >> ~/.bashrc
