#!/bin/bash
rm -rfv ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.gitconfig ~/.config/fish ~/.config/omf ~/.inputrc ~/.tmux ~/.config/yabai ~/.config/skhd ~/.config/sketchybar*
ln -s ~/.vickev/vim/vimrc ~/.vimrc
ln -s ~/.vickev/zsh/zshrc ~/.zshrc
ln -s ~/.vickev/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.vickev/tmux ~/.tmux
ln -s ~/.vickev/gitconfig ~/.gitconfig
ln -s ~/.vickev/inputrc ~/.inputrc
ln -s ~/.vickev/fish ~/.config/fish
ln -s ~/.vickev/omf ~/.config/omf
ln -s ~/.vickev/yabai ~/.config/yabai
ln -s ~/.vickev/skhd ~/.config/skhd
ln -s ~/.vickev/sketchybar ~/.config/sketchybar
ln -s ~/.vickev/sketchybarrc ~/.config/sketchybarrc

## Install fish
#if [ "$OSTYPE" = "linux-gnu" ] ; then
#    echo "Install Fish"
#    sudo -s bash -c "apt-get install fish autojump curl"
#	curl -L https://get.oh-my.fish | fish
#    fish -c "omf install"
#fi;

echo 'source ~/.vickev/bashrc' >> ~/.bashrc
