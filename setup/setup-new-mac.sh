#!/bin/zsh

# set colors used for logging
source $HOME/config/dotfiles/zsh/log-colors.sh

# start the script with -p to only install preferences
while getopts "p" opt; do
  case ${opt} in
    p )
        set_only_preferences=true
        ;;
    \? ) 
        echo "Usage: start-mac-setup.sh [-p]"
        ;;
  esac
done

printf "\n${tag_info} *** MAC SETUP SCRIPT ***\n"

function installHomebrew() {
    printf "\n${tag_info} Installing Homebrew...\n\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function installCliPrograms() {
    printf "\n${tag_info} Installing CLI Programs...\n\n"

    cli_programs=(
        tree
        lf
        wget
        python
        node
        maven
        nano
        bat
        fd
        neovim
        grip
        neofetch
        tmux
        terminal-notifier
        n
        z
        ansible
    )

    brew install ${cli_programs[@]}

    # Other packages

    # trash-cli (https://github.com/sindresorhus/trash). Cross-platform Node.js version
    # It uses macos-trash under the hood (https://github.com/sindresorhus/macos-trash). Which could also be installed with brew
    npm install --global trash-cli 

    # maven have openjdk-15 as a denepdency?
    # Maven should not download another jdk:
    # https://stackoverflow.com/questions/63336020/how-to-install-maven-with-brew-but-without-openjdk

    # zsh is already installed
    # brew upgrade zsh
    # Error: zsh not installed

    # TODO: make zsh your default shell -> and use your dotfiles from your repository.
    # TODO: nano syntax highlighting from dotfiles?

}

function installGuiPrograms() {
    printf "\n${tag_info} Installing GUI Programs...\n\n"
    
    # TODO: icons in menu bar?
    # TODO: firefox preferences / bookmarks?
    # TODO: click okay on mac security warning?

    # TODO: CONFIG
    # alfred

    gui_programs=(

        # General
        firefox
        google-chrome
        slack
        zoom # requires password
        discord
        keepassxc

        # Mac specific
        dozer
        itsycal
        alfred
        iterm2
        karabiner-elements # requires password
        yabai # this comes from a private cask, might not work, see readme
        skhd # this comes from a private cask, might not work, see readme

        # Development
        intellij-idea
        visual-studio-code
        alacritty
        sourcetree
        dbeaver-community
        postman
        pencil # An open-source, cross-platform GUI prototyping tool

    )

    brew install --cask ${gui_programs[@]}
   
    # TODO: virtualbox fails because permissions?
    #brew install --cask virtualbox
    # TODO: install extension pack?
    # TODO: install guest extensions?
    # Devices -> Insert guess addition CD image
}

# TODO install also monaco nerd font
function installConsolasFont() {
    cd ~/Downloads
    mkdir consolas
    cd consolas
    ## TODO find consolas font download link
    # wget https://github.com/tsenart/sight/blob/master/fonts/Consolas.ttf?raw=true
    #curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
    curl -O https://github.com/tsenart/sight/blob/master/fonts/Consolas.ttf?raw=true
    open Consolas.ttf
    # Press Intall font. That is all.
}

function setPreferences() {
    printf "\n${tag_info} Setting Preferences...\n\n"
    
    printf "\n${tag_info} Itsycal \n\n"
    defaults write com.mowglii.ItsycalApp.plist ClockFormat -string "H:mm - EEEE, dd.MMMM"
    defaults write com.mowglii.ItsycalApp.plist HideIcon -bool true
    defaults write com.mowglii.ItsycalApp.plist HighlightedDOWs -int 65

    # TODO:
    #   keybindings
    #   finder prefs
    #   dock prefs
}


if [ "$set_only_preferences" = true ]; then
    setPreferences
    exit 0
fi


installHomebrew && \
installCliPrograms && \
installGuiPrograms && \
setPreferences && \


# Java 11 - requires password
brew tap adoptopenjdk/openjdk && \
brew install --cask adoptopenjdk11 && \

#installConsolasFont

printf "\n${tag_success} DONE\n\n"
exit 0







