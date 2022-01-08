#!/bin/bash

# set colors used for logging
source $HOME/config/dotfiles/zsh/log-colors.sh

printf "\n ${color_success}Success${color_default}";
printf "\n ${color_info}Info${color_default}";
printf "\n ${color_warning}Warning${color_default}";
printf "\n ${color_error}Error${color_default}";
printf "\n ${color_default}Default${color_default}";

printf "\n ${tag_success} some success...";
printf "\n ${tag_info} some info...";
printf "\n ${tag_warning} some warning...";
printf "\n ${tag_error} some error...";



# printf "\n whoami: ";
# whoami

# printf '\n echo $SHELL: ';
# echo $SHELL

# printf '\n echo $USER: ';
# echo $USER

# printf "\n sudo whoami: ";
# sudo whoami

# printf '\n sudo echo $SHELL: ';
# sudo echo $SHELL

# printf '\n sudo echo $USER: ';
# sudo echo $USER