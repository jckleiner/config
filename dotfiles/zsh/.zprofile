# ~/.profile: executed by the command interpreter for login shells.
# TODO: when to use .profile, .zsh_profile etc.

open -a 'Itsycal'

eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
