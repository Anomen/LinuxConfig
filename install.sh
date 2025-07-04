#!/bin/bash
rm -rfv ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.gitconfig ~/.config/fish ~/.config/omf ~/.inputrc ~/.tmux ~/.config/yabai ~/.config/skhd ~/.config/sketchybar* ~/.p10k.zsh
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
ln -s ~/.vickev/p10k.zsh ~/.p10k.zsh

## Install fish
#if [ "$OSTYPE" = "linux-gnu" ] ; then
#    echo "Install Fish"
#    sudo -s bash -c "apt-get install fish autojump curl"
#	curl -L https://get.oh-my.fish | fish
#    fish -c "omf install"
#fi;

echo 'source ~/.vickev/bashrc' >> ~/.bashrc


# Install zsh
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
brew install powerlevel10k zsh-autosuggestions zsh-syntax-highlighting eza zoxide