#!/bin/zsh
# Setup dotfiles and configs on the current machine
# If there will be too many symlinks in the future, consider using stow or a bare repo to manage your dotfiles

# TODO: move existing file with _backup suffix?
# TODO: make this cleaner

# DOTFILES
ls ~/config/dotfiles/zsh/.zshrc 1> /dev/null && ln -s ~/config/dotfiles/zsh/.zshrc ~/.zshrc
ls ~/config/dotfiles/zsh/.profile 1> /dev/null && ln -s ~/config/dotfiles/zsh/.profile ~/.profile

# ..Code/User folders do not exist if code isn't installed yet
# TODO check if folders/files already exist, then take a backup etc.
mkdir -p ~/Library/Application\ Support/Code/User/
ln -s ~/config/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/config/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# CONFIG
ls ~/config/dotfiles/config/lf/lfrc 1> /dev/null && ln -s ~/config/dotfiles/config/lf/lfrc ~/.config/lf/lfrc
#ln -s ~/config/dotfiles/config/iterm2/

# fix for "zsh compinit: insecure directories, run compaudit for list."
sudo chmod -R 755 /usr/local/share/zsh

# TODO 
# import/link iterm2 JSON, can it be done via terminal?

source ~/.zshrc