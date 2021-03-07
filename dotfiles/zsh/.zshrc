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
_cd_ls () { cd "$@" && ls -lh }
checkport () { sudo lsof -i:$1 }
listports () { sudo lsof -PiTCP -sTCP:LISTEN }
alias cd=_cd_ls
alias lf="lfcd"
alias l='ls -lah'
alias ll='ls -lh'
alias gss='git status -sb'
alias grep='grep --color=always'
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

# trash-cli - https://github.com/andreafrancia/trash-cli,
# Note that Bash aliases are used only in interactive shells, so using this alias should not interfere with scripts that expect to use rm.
alias rm='echo "######### This is not the command you are looking for #########"; false'
# trash goes to ~/.local/share/Trash/

# to be able to start vscode from the terminal, not needed when vscode is installed via brew
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

### TODO: where to put open apps like simon says, .profile, .zprofile
# Launch apps which are bugged
#open /Applications/Simon\ Says.app
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

# * other keybindings - https://github.com/Parth/dotfiles/blob/master/zsh/keybindings.sh
# * fzf - https://github.com/junegunn/fzf#key-bindings-for-command-line
# TODO how to automatically setup fzf without calling install and pressing Y?
#   .fzf.zsh is created after ./install was run
# TODO fzf quit is ESC, lf quit is 'q' -> make LF quit also ESC
# * z
# * .zsh_history is empty, what's the difference history vs zsh_history?
# * remove vscode and install it with brew install --cask visual-studio-code?
# * vscode dotfiles 
# * vscode terminal shortcut? 
#   -> how to copy key map and settings.json???
# * iterm2 config? https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles
# * ubar config? 
# * promt bold black? 
# * update readme, oh-my-zsh not needed 

# Env Variables
source $HOME/config/dotfiles/zsh/env-variables.sh
[ -f "$HOME/config/dotfiles/zsh/secret-env-variables.sh" ] && source "$HOME/config/dotfiles/zsh/secret-env-variables.sh"

# Theme
source $HOME/config/dotfiles/zsh/themes/nice.zsh-theme

# Plugins
#source $HOME/config/dotfiles/zsh/plugins/git.plugin.zsh


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Change defualt mapping from CTRL + T to CTRL + F
bindkey '^F' fzf-file-widget
# Change defualt mapping from ALT + C to CTRL + T
bindkey '^T' fzf-cd-widget

# up
function back_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N back_widget
bindkey "^b" back_widget