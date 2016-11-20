#!/bin/sh
rm -rfv ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.themes/Anomen* ~/.themes/Orion ~/.themes/Ambiance* ~/.icons/Vibrancy* ~/.gitconfig
ln -s ~/.vickev/vim/vimrc ~/.vimrc
ln -s ~/.vickev/zsh/zshrc ~/.zshrc
ln -s ~/.vickev/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.vickev/gitconfig ~/.gitconfig
cp -r ~/.vickev/themes/* ~/.themes

sudo dpkg -i ~/.vickev/packages/*.deb
sudo apt-get install -f

# sound-application-switcher


echo 'source ~/.vickev/bashrc' >> ~/.bashrc
