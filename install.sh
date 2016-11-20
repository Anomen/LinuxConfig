#!/bin/sh
rm -rfv ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.themes/Anomen* ~/.themes/Orion ~/.gitconfig ~/.config/compiz-1/compizconfig/*
ln -s ~/.vickev/vim/vimrc ~/.vimrc
ln -s ~/.vickev/zsh/zshrc ~/.zshrc
ln -s ~/.vickev/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.vickev/gitconfig ~/.gitconfig
ln -s ~/.vickev/autostart/* ~/.config/autostart/
ln -s ~/.vickev/compiz/* ~/.config/compiz-1/compizconfig
cp -r ~/.vickev/themes/* ~/.themes

sudo dpkg -i ~/.vickev/packages/*.deb

# Diodon
sudo add-apt-repository ppa:diodon-team/stable
sudo apt-get update

sudo apt-get install -f diodon

echo 'source ~/.vickev/bashrc' >> ~/.bashrc
