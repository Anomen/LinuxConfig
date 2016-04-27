#!/bin/sh
rm ~/.vimrc ~/.zshrc ~/.tmux.conf
ln -s ~/.vickev/vim/vimrc ~/.vimrc
ln -s ~/.vickev/zsh/zshrc ~/.zshrc
ln -s ~/.vickev/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.vickev/gitconfig ~/.gitconfig

echo 'source ~/.vickev/bashrc' >> ~/.bashrc
