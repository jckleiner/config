# terminal text colors

# https://jonasjacek.github.io/colors/
highlight_color=$'\e[48;2;0;175;255m\e[38;2;255;255;255m' # white on DeepSkyBlue1
warning_color=$'\e[48;2;255;0;0m\e[38;2;255;255;255m' # white on red
default_color=$'\033[0m'

printf "\n${highlight_color}highlight_color${default_color}\n"
printf "\n${warning_color}warning_color${default_color}\n"
printf "\n${default_color}default_color${default_color}\n"

function installHomebrew() {
    printf "\n${highlight_color}Installing Homebrew...${default_color}\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

printf "\n${highlight_color} *** MAC SETUP SCRIPT *** ${default_color}\n"

installHomebrew



