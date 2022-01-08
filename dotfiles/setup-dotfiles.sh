#!/bin/zsh
# Setup dotfiles and configs on the current machine
# If there will be too many symlinks in the future, consider using stow or a bare repo to manage your dotfiles

# TODO: move existing file with _backup suffix?
# TODO: make this cleaner



# CONFIG

# fix for "zsh compinit: insecure directories, run compaudit for list."
sudo chmod -R 755 /usr/local/share/zsh

# TODO 
# import/link iterm2 JSON, can it be done via terminal?

source ~/.zshrc