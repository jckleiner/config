#!/bin/zsh

# terminal text colors

# https://jonasjacek.github.io/colors/
highlight_color=$'\e[48;2;0;175;255m\e[38;2;255;255;255m' # white on DeepSkyBlue1
warning_color=$'\e[48;2;255;0;0m\e[38;2;255;255;255m' # white on red
default_color=$'\033[0m'

printf "\n${highlight_color}highlight_color${default_color}\n"
printf "\n${warning_color}warning_color${default_color}\n"
printf "\n${default_color}default_color${default_color}\n"

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

printf "\n${highlight_color} *** MAC SETUP SCRIPT *** ${default_color}\n"

function installHomebrew() {
    printf "\n${highlight_color}Installing Homebrew...${default_color}\n\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function installCliPrograms() {
    printf "\n${highlight_color}Installing CLI Programs...${default_color}\n\n"

    cli_programs=(
        tree
        lf
        wget
        python
        node
        maven
        nano
        trash-cli
        bat
        fd
        neovim
        grip
        neofetch
        tmux
    )

    brew install ${cli_programs[@]}

    # maven have openjdk-15 as a denepdency?
    # Maven should not download another jdk:
    # https://stackoverflow.com/questions/63336020/how-to-install-maven-with-brew-but-without-openjdk

    # zsh is already installed
    # brew upgrade zsh
    # Error: zsh not installed

    # TODO: make zsh your default shell -> and use your dotfiles from your repository.
    # TODO: nano syntax highlighting from dotfiles?

    # TODO: ansible

    # brew install httpd
    # brew install mariadb
}

function installGuiPrograms() {
    printf "\n${highlight_color}Installing GUI Programs...${default_color}\n\n"
    
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
        joplin
        anki
        keepassxc

        # Mac specific
        dozer
        itsycal
        alfred
        iterm2
        # TODO wants password?
        karabiner-elements
        yabai
        skhd

        # Development
        intellij-idea
        visual-studio-code
        alacritty
        sourcetree
        dbeaver-community
        docker
        postman

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
    printf "\n${highlight_color}Setting Preferences...${default_color}\n\n"
    
    printf "\n${highlight_color}Itsycal${default_color}\n\n"
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

printf "\n${highlight_color}DONE${default_color}\n\n"
exit 0







