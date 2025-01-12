#!/bin/bash


# name, space
function move_window() {
    echo
    window_ids=$(yabai -m query --windows | jq --arg appname "$1" '.[] | select(.app == $appname) | .id')

    for window_id in $window_ids; do
        echo "moved '$1' with id $window_id to space $2"
        yabai -m window "$window_id" --space "$2"
    done
}

move_window "Firefox" "1"
move_window "Microsoft Outlook" "1"

move_window "Code" "2"

move_window "IntelliJ IDEA" "3"

move_window "Obsidian" "4"
move_window "OpenLens" "4"

move_window "Sourcetree" "5"
