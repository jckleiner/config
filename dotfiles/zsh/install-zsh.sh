#!/bin/bash

# set colors used for logging
source $HOME/config/dotfiles/zsh/.log-colors.sh

function symlink_zshrc() {
    if ! [ -f ~/config/dotfiles/zsh/.zshrc ]; then printf "\n${tag_error} File not found: ~/config/dotfiles/zsh/.zshrc \n"; fi

    if [ -f ~/.zshrc ]; then
        printf "\n${tag_info} ~/.zshrc file already exists! Renaming ~/.zshrc to ~/.zshrc_OLD \n"
        mv ~/.zshrc ~/.zshrc_OLD
        ln -s ~/config/dotfiles/zsh/.zshrc ~/.zshrc
    else
        ln -s ~/config/dotfiles/zsh/.zshrc ~/.zshrc
    fi
    printf "\n${tag_success} Symlink created: ~/.zshrc  --->  ~/config/dotfiles/zsh/.zshrc \n"
}

# Check if zsh is already the default shell
if [ -n "$(echo $SHELL | grep zsh)" ]; then
    printf "\n${tag_info} zsh is already the default shell \n"
    symlink_zshrc
    exit 0; 
fi

### TODO
# if zsh is already default, do symlinking

# Determine which package manager to install the package with
packagesNeeded='zsh'
if [ -x "$(command -v apk)" ];          then sudo apk add --no-cache $packagesNeeded
elif [ -x "$(command -v apt-get)" ];    then sudo apt-get install $packagesNeeded
elif [ -x "$(command -v dnf)" ];        then sudo dnf install $packagesNeeded
elif [ -x "$(command -v yum)" ];        then sudo yum install $packagesNeeded
elif [ -x "$(command -v zypper)" ];     then sudo zypper install $packagesNeeded
elif [ -x "$(command -v packman)" ];    then sudo pacman -S $packagesNeeded
elif [ -x "$(command -v brew)" ];       then sudo brew install $packagesNeeded
else printf "\n${tag_error} FAILED TO INSTALL PACKAGE: Package manager not found.\n"; fi

symlink_zshrc

# change the default shell for the current user
sudo chsh -s $(which zsh) $USER

# reload
zsh

### TODO
#rm -rf config/ && sudo apt remove zsh && rm .zshrc && cd ~ && git clone https://github.com/jckleiner/config.git && ./config/dotfiles/zsh/install-zsh.sh
# install fzf?