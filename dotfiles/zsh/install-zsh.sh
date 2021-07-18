#!/bin/bash

# https://jonasjacek.github.io/colors/
highlight_color=$'\e[48;2;0;175;255m\e[38;2;255;255;255m' # white on DeepSkyBlue1
warning_color=$'\e[48;2;255;0;0m\e[38;2;255;255;255m' # white on red
default_color=$'\033[0m'

# Check if zsh is already default shell
if [ -n "$(echo $SHELL | grep zsh)" ]; then echo "zsh is already the default shell"; return; fi

packagesNeeded='zsh'
if [ -x "$(command -v apk)" ];          then sudo apk add --no-cache $packagesNeeded
elif [ -x "$(command -v apt-get)" ];    then sudo apt-get install $packagesNeeded
elif [ -x "$(command -v dnf)" ];        then sudo dnf install $packagesNeeded
elif [ -x "$(command -v yum)" ];        then sudo yum install $packagesNeeded
elif [ -x "$(command -v zypper)" ];     then sudo zypper install $packagesNeeded
elif [ -x "$(command -v packman)" ];    then sudo pacman -S $packagesNeeded
elif [ -x "$(command -v brew)" ];       then sudo brew install $packagesNeeded
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; fi

if ! [ -f ~/config/dotfiles/zsh/.zshrc ]; then printf "\n${warning_color} File not found: ~/config/dotfiles/zsh/.zshrc ${default_color}\n" fi

if [ -f ~/.zshrc ]; then
    printf "\n${warning_color} zshrc file already exists! \n renaming ~/.zshrc to ~/.zshrc_OLD ${default_color}\n"
    mv ~/.zshrc ~/.zshrc_OLD
    ln -s ~/config/dotfiles/zsh/.zshrc ~/.zshrc
else
    ln -s ~/config/dotfiles/zsh/.zshrc ~/.zshrc
fi

printf "\n${highlight_color} Symlink created: ~/.zshrc  --->  ~/config/dotfiles/zsh/.zshrc ${default_color}\n"

# change the default shell for the current user
sudo chsh -s $(which zsh) $USER

# reload
zsh

### TODO
#rm -rf config/ && sudo apt remove zsh && rm .zshrc && cd ~ && git clone https://github.com/jckleiner/config.git && ./config/dotfiles/zsh/install-zsh.sh
# install fzf?