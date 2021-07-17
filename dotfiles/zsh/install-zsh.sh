#!/bin/bash

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

# symlink zshrc if it does not exist already
ls ~/config/dotfiles/zsh/.zshrc 1> /dev/null && ln -s ~/config/dotfiles/zsh/.zshrc ~/.zshrc

# change the default shell for the current user
sudo chsh -s $(which zsh) $USER

# reload
zsh
