#!/bin/bash

# terminal text colors

# https://jonasjacek.github.io/colors/
highlight_color=$'\e[48;2;0;175;255m\e[38;2;255;255;255m' # white on DeepSkyBlue1
warning_color=$'\e[48;2;255;0;0m\e[38;2;255;255;255m' # white on red
default_color=$'\033[0m'

printf "\n${highlight_color}highlight_color${default_color}\n"
printf "\n${warning_color}warning_color${default_color}\n"
printf "\n${default_color}default_color${default_color}\n"

function installHomebrew() {
    printf "\n${highlight_color}Installing Homebrew...${default_color}\n\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function installCommandlinePrograms() {
    printf "\n${highlight_color}Installing Commandline Programs...${default_color}\n\n"

    brew install python
    brew install tree
    brew install wget
    brew install lf
    brew install zsh
    # TODO: make zsh your default shell -> and use your dotfiles from your repository.
    brew install node
    brew install maven

    brew install nano
    # TODO: nano syntax highlighting from dotfiles?

    # consolas font
    # wget https://github.com/tsenart/sight/blob/master/fonts/Consolas.ttf?raw=true

    # Java 11
    # wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.10%2B9/OpenJDK11U-jdk_x64_mac_hotspot_11.0.10_9.pkg 

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

    # Programs
    brew install --cask firefox
    brew install --cask google-chrome
    brew install --cask slack
    brew install --cask notion
    brew install --cask anki
    brew install --cask keepassxc
    
    # Mac specific programs
    brew install --cask hyperdock
    brew install --cask tiles
    brew install --cask itsycal
    brew install --cask alfred
    
    # Developer GUI programs 
    brew install --cask intellij-idea
    brew install --cask visual-studio-code
    brew install --cask sourcetree
    brew install --cask iterm2
    brew install --cask dbeaver-community
    brew install --cask docker
    brew install --cask postman
   
    # TODO: virtualbox fails because permissions?
    #brew install --cask virtualbox
}
function installConsolasFont() {
    brew install cabextract
    cd ~/Downloads
    mkdir consolas
    cd consolas
    ## TODO find consolas font download link
    curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
    cabextract PowerPointViewer.exe
    cabextract ppviewer.cab
    open CONSOLA*.TTF
    # Press Intall font. That is all.
}

printf "\n${highlight_color} *** MAC SETUP SCRIPT *** ${default_color}\n"

installHomebrew
installCommandlinePrograms
installGuiPrograms
#installConsolasFont







