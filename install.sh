#!/bin/sh
rm -rfv ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.themes/{Anomen*,Orion} ~/.gitconfig
ln -s ~/.vickev/vim/vimrc ~/.vimrc
ln -s ~/.vickev/zsh/zshrc ~/.zshrc
ln -s ~/.vickev/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.vickev/gitconfig ~/.gitconfig
ln -s ~/.vickev/themes/* ~/.themes

echo 'source ~/.vickev/bashrc' >> ~/.bashrc
