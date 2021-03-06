# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# display hidden files when tab completion
_comp_options+=(globdots)

# Case insensitive completion, also completes if word matched from the middle for instance
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

# Aliases and functions
_cd_ls () { cd "$@" && ls }
checkport () { sudo lsof -i:$1 }
listports () { sudo lsof -PiTCP -sTCP:LISTEN }
alias cd=_cd_ls
alias lf="lfcd"
alias l='ls -lah'
alias ll='ls -lh'
alias gss='git status -sb'
alias grep='grep --color=always'
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"


# to be able to start vscode from the terminal, not needed when vscode is installed via brew
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

### TODO: where to put open apps like simon says, .profile, .zprofile
# Launch apps which are bugged
#open /Applications/Simon\ Says.app
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

# TODO 
# * symlink script
# * script to install dotfiles on pc, like the mac setup
# * add some plugings to see if it works
# * fzf, keybindings - https://github.com/Parth/dotfiles/blob/master/zsh/keybindings.sh
# * trash-cli
# * z
# * .zsh_history is empty, what's the difference history vs zsh_history?

# relative paths not working?
# Env Variables
source $HOME/config/dotfiles/zsh/env-variables.sh
[ -f "$HOME/config/dotfiles/zsh/secret-env-variables.sh" ] && source "$HOME/config/dotfiles/zsh/secret-env-variables.sh"

# Theme
source $HOME/config/dotfiles/zsh/themes/nice.zsh-theme

# Plugins
#source $HOME/config/dotfiles/zsh/plugins/git.plugin.zsh
