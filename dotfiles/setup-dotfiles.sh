#!/bin/zsh
# Setup dotfiles and configs on the current machine
# If there will be too many symlinks in the future, consider using stow or a bare repo to manage your dotfiles

# TODO: move existing file with _backup suffix?
# TODO: make this cleaner

# DOTFILES
ls ~/config/dotfiles/zsh/.zshrc 1> /dev/null && ln -s ~/config/dotfiles/zsh/.zshrc ~/.zshrc
ls ~/config/dotfiles/zsh/.profile 1> /dev/null && ln -s ~/config/dotfiles/zsh/.profile ~/.profile

# CONFIG
ls ~/config/dotfiles/config/lf/lfrc 1> /dev/null && ln -s ~/config/dotfiles/config/lf/lfrc ~/.config/lf/lfrc
#ln -s ~/config/dotfiles/config/iterm2/

source ~/.zshrc