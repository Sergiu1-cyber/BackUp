#!/usr/bin/bash

# update package 
apt update -y
apt upgrade -y

# instalez instrumente de descarcare
apt install curl -y
apt install wget -y
apt install git -y

# setez zsh
apt install zsh -y

# adaog oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# adaog plugin pentru autosugestie
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# adaog plagin pentru culoare
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

apt install python -y
apt install nodejs -y


apt install vim -y
apt install neovim -y
apt install grep -y 
apt install ripgrep -y
apt install ranger -y

apt install openssh -y

apt install cronie gnupg pass man openssh rclone rsync sqlite syncthing termux-services tmux -y

termux-setup-storage

termux-reload-settings

git clone git@github.com:Sergiu1-cyber/BackUp.git



