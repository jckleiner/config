# Basic auto/tab complete, include hidden files:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Use lf to switch directories
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
# bind it to ctrl-o
#bindkey -s '^o' 'lfcd\n'

# Aliases
alias lf="lfcd"
alias l='ls -lah'
alias grep='grep --color=always'

# to be able to start vscode from the terminal, not needed when vscode is installed via brew
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

### TODO: where to put open apps like simon says, .profile, .zprofile
# Launch apps which are bugged
#open /Applications/Simon\ Says.app
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout


# relative paths not working?
# Env Variables
source /Users/kleiner/develop/personal/config/dotfiles/zsh/env-variables.sh
source /Users/kleiner/develop/personal/config/dotfiles/zsh/secret-env-variables.sh

# Theme
source /Users/kleiner/develop/personal/config/dotfiles/zsh/themes/nice.zsh-theme

# Plugins