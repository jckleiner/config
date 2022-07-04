# ------------ zsh Config ------------
# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# display hidden files when tab completion
_comp_options+=(globdots)

# Case insensitive completion, also completes if word matched from the middle for instance
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# ------------ Env Variables ------------
# brew
#   - Monterey (M1): /opt/homebrew/
#   - MacOs X (Intel): /usr/local/
eval "$(/opt/homebrew/bin/brew shellenv 2> /dev/null)"
eval "$(/usr/local/bin/brew shellenv 2> /dev/null)"

# defining colors and tags for logging
source $HOME/config/dotfiles/zsh/log-colors.sh

source $HOME/config/dotfiles/zsh/env-variables.sh
# put secret variables which you don't want to commit into secret-env-variables.sh
[ -f "$HOME/config/dotfiles/zsh/secret-env-variables.sh" ] && source "$HOME/config/dotfiles/zsh/secret-env-variables.sh"

# ------------ Theme ------------
source $HOME/config/dotfiles/zsh/themes/nice.zsh-theme

# ------------ Plugins ------------
# if you have any, put it in the plugins folder and source it here
#source $HOME/config/dotfiles/zsh/plugins/git.plugin.zsh

# ------------ z ------------
[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh

# ------------ fzf ------------
# Required packages: tree, fd, bat
[ -f $HOME/config/dotfiles/zsh/fzf.zsh ] && source $HOME/config/dotfiles/zsh/fzf.zsh
# fzf.zsh defines 3 keybindings, changing the binds here:
#  - CTRL + R       Search History
#  - **<TAB>        Autocomplete
#  - CTRL + T       Find files     Changing it to CTRL + F --- (F for Files)
#  - ALT + C        Find folders   Changing it to CTRL + T --- (T for Tree)
bindkey '^F' fzf-file-widget
bindkey '^T' fzf-cd-widget

# ------------ Aliases and Functions ------------
### TODO sometimes '_cd_ls: maximum nested function level reached; increase FUNCNEST?'
_cd_ls () { cd "$@" && ls -lh }
checkport () { sudo lsof -i:$1 }
listports () { sudo lsof -PiTCP -sTCP:LISTEN }
# alias cd=_cd_ls
alias lf="lf"
# alias lf="lfcd" # TODO errors
alias l='ls -lah'
alias ll='ls -lh'
alias grep='grep --color=always'
alias gss='git status -sb'
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

### Minifabric
# Expose endpoints: -e 9000
alias mfu="minifab up"
alias mfe="minifab explorerup"
alias mfd="minifab down"
alias mfc="minifab cleanup"
alias mfdc="minifab down && minifab cleanup"

### Docker - TODO
alias dcu="docker-compose up -d"
alias dcd="docker-compose down --remove-orphans"
alias dcdu="docker-compose down --remove-orphans && docker-compose up -d"

# mv will overwrite the existing file by default under MacOs
# make it interactive so it will ask before overwriting it
alias mv="mv -i"

### trash-cli (Cross-platform Node.js version)
# https://github.com/sindresorhus/trash-cli, trash goes directyl to your bin (on MacOs)
# it uses macos-trash under the hood (https://github.com/sindresorhus/macos-trash).
# Note that aliases are used only in interactive shells, so using this alias should not interfere with scripts that expect to use rm.
# only if trash is installed
if [ -n "$(command -v trash)" ]; then 
    alias rm='echo "######### rm: This is not the command you are looking for, use trash instead #########"; false'
fi

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

# to be able to start vscode from the terminal, not needed when vscode is installed via brew
# code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# back widget
function back_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N back_widget
bindkey "^b" back_widget

# Fuzzy search a list of the most recently committed to branches (including remote branches)
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --reverse --height 40% -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# TODO docker kill?
dk() {}

# TODO docker kill all?
dka() {}

# a fancy 'docker ps'
dps() {
    # $1 - first argument, $2 - second argument and so on...
    # TODOs
    #  - \t{{.Size}}

    # You can also adjusting docker ps format with a config file
    # See: https://devdojo.com/bobbyiliev/how-to-change-the-docker-ps-output-format

    # Default - when no arguments passed. Taken from https://stackoverflow.com/questions/46173298/how-to-sort-or-order-results-docker-ps-format
    # command docker ps --format "{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}" \

    local color_column_1="\033[38;2;78;78;78m"
    local color_column_2="\033[38;2;95;135;175m"
    local color_column_3="\033[00m\033[38;2;95;175;135m"
    local color_column_4="\033[00m\033[38;2;175;135;215m"

    # TODO make this cleaner

    # \t{{.Networks}}

    if [[ "$@" == "a" ]]; then
        command docker ps --all --format "{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}" \
            | (echo -e "CONTAINER_ID\tNAMES\tIMAGE\tPORTS\tSTATUS" && cat) \
            | awk '{printf "\033[1;32m%s\t\033[01;38;5;95;38;5;196m%s\t\033[00m\033[1;34m%s\t\033[01;90m%s %s %s %s %s %s %s\033[00m\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10;}' \
            | column -s$'\t' -t \
            | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}'
    else
    # For Light Theme:
    # {printf "\033[38;2;78;78;78m%s\t\033[38;2;95;135;175m%s\t\033[00m\033[38;2;95;175;135m%s\t\033[00m\033[38;2;175;135;215m%s %s %s %s %s %s %s\033[00m\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10;}
        command docker ps --format "{{.ID}}\t{{.Names}}\t{{.Networks}}\t{{.Ports}}" \
            | (echo -e "CONTAINER_ID\tNAMES\tNETWORKS\tPORTS" && cat) \
            | awk '{printf "\033[38;2;255;255;255m%s\t\033[38;2;163;180;255m%s\t\033[00m\033[38;2;95;175;135m%s\t\033[00m\033[38;2;219;184;255m%s %s %s %s %s %s %s\033[00m\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10;}' \
            | column -s$'\t' -t \
            | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}'
    fi
}

#export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
