# ------------ zsh Config ------------
# See '/etc/zshrc' for initial setup of zsh

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
alias ls='ls --color'
alias l='ls -lah'
alias ll='ls -lh'
alias grep='grep --color=always'
alias gss='git status --short --branch'
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

### Kubernetes
alias k="kubectl"

# mv will overwrite the existing file by default under MacOs
# make it interactive so it will ask before overwriting it
alias mv="mv --interactive"

alias azssh="/Users/kleiner/develop/tomtom/motown2-misc/scripts/azure/azssh.sh"

### Terragrunt
# alias tgp="terragrunt plan"
# alias tga="terragrunt apply"
# alias tgd="terragrunt destroy"

### trash-cli (Cross-platform Node.js version)
# https://github.com/sindresorhus/trash-cli, trash goes directyl to your bin (on MacOs)
# it uses macos-trash under the hood (https://github.com/sindresorhus/macos-trash).
# Note that aliases are used only in interactive shells, so using this alias should not interfere with scripts that expect to use rm.
# only if trash is installed
if [ -n "$(command -v trash)" ]; then
    # TODO
    # alias rm='echo "######### rm: This is not the command you are looking for, use trash instead #########"; false'
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

tgp() {
    terragrunt plan "$@"
}

tga() {
    if [[ "$PWD" == *"bootstrap-subscription"* ]]; then
        echo -e "\n**** You are in bootstrap-subscription! ****\n"
        return 1
    fi

    # if the first argument provided is "a", then auto approve
    if [[ "$1" == "a" ]]; then
        echo -e "\n**** Auto approve is ON! ****\n"
        terragrunt apply --auto-approve
    else
        terragrunt apply "$@"
    fi
}

tgd() {
    if [[ "$PWD" == *"bootstrap-subscription"* ]]; then
        echo -e "\n**** You are in bootstrap-subscription! ****\n"
        return 1
    fi

    # if the first argument provided is "a", then auto approve
    if [[ "$1" == "a" ]]; then
        echo -e "\n**** Auto approve is ON! ****\n"
        terragrunt destroy --auto-approve
    else
        terragrunt destroy "$@"
    fi
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

gpu() {
    # TODO - find current branch of pwd and then git push upsteam
}

watch_for_file_changes() {
    # fail if fswatch is not installed
    if [ -z "$(command -v fswatch)" ]; then
        echo "fswatch is required but it's not installed."
        return 1
    fi

    if [ "$1" = "-h" ]; then
        echo -e "\nwatch_for_file_changes [folder_path]"
        echo -e "  folder_path: the path to watch for changes, defaults to current directory ('.')\n"
        return 1
    fi

    # use current dir if no argument is passed, otherwise use the argument
    local folder_path="."
    if [ -n "$1" ]; then
        folder_path="$1"
    fi
    
    echo "Watching for file changes in directory: '$folder_path'"

    fswatch . | xargs --replace={} echo -e "Changed: {}"
}

obsidian_symlink_config() {
    echo "Creating symlinks for Obsidian config files inside '$(pwd)'"

    # check if files exist already and ask user if they want to overwrite them
    if [ -f "app.json" ]; then
        echo -e "\napp.json already exists, do you want to overwrite it? (y/n)"
        read -r answer
        if [ "$answer" != "${answer#[Yy]}" ]; then
            echo "trashing app.json"
            trash app.json
        fi
    fi

    echo -e "\nCreating symlink 'app.json' which points to '~/config/dotfiles/obsidian/app.json'"
    ln -s ~/config/dotfiles/obsidian/app.json app.json

    # same for appearance.json
    if [ -f "appearance.json" ]; then
        echo -e "\nappearance.json already exists, do you want to overwrite it? (y/n)"
        read -r answer
        if [ "$answer" != "${answer#[Yy]}" ]; then
            echo "trashing appearance.json"
            trash appearance.json
        fi
    fi

    echo "Creating symlink 'appearance.json' which points to '~/config/dotfiles/obsidian/appearance.json'"
    ln -s ~/config/dotfiles/obsidian/appearance.json appearance.json

    # same for the snippets folder
    if [ -d "snippets" ]; then
        echo -e "\nsnippets folder already exists, do you want to overwrite it? (y/n)"
        read -r answer
        if [ "$answer" != "${answer#[Yy]}" ]; then
            echo "trashing snippets folder"
            trash snippets
        fi
    fi

    echo "Creating symlink 'snippets' which points to '~/config/dotfiles/obsidian/snippets'"
    ln -s ~/config/dotfiles/obsidian/snippets snippets
}

reload_zshrc() {
    source ~/.zshrc
}

git_print_config() {
    echo -e "\ngit config --list (with grep):"
    git config --list | grep -E 'init.defaultbranch|remote.origin.url|commit.template|branch.master.remote|user.name|user.email'
}

# Work related scripts - NOT COMMITTED IN GIT
source "$HOME/config/dotfiles/work_scripts/work_scripts_soft_link.sh"

# This is needed when installing nvm manually
# See https://github.com/nvm-sh/nvm#manual-install
export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# TODO move this to .zshprofile or equivalent
BREW_BIN="/usr/local/bin/brew"
if [ -f "/opt/homebrew/bin/brew" ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
fi

if type "${BREW_BIN}" &> /dev/null; then
    export BREW_PREFIX="$("${BREW_BIN}" --prefix)"
    for bindir in "${BREW_PREFIX}/opt/"*"/libexec/gnubin"; do export PATH=$bindir:$PATH; done
    for bindir in "${BREW_PREFIX}/opt/"*"/bin"; do export PATH=$bindir:$PATH; done
    for mandir in "${BREW_PREFIX}/opt/"*"/libexec/gnuman"; do export MANPATH=$mandir:$MANPATH; done
    for mandir in "${BREW_PREFIX}/opt/"*"/share/man/man1"; do export MANPATH=$mandir:$MANPATH; done
fi

# during npm install, I get this error
# [INFO] npm ERR! /opt/homebrew/opt/llvm@12/bin/../include/c++/v1/string.h:60:15: fatal error: 'string.h' file not found
# https://stackoverflow.com/questions/57746792/homebrews-llvm-fatal-error-stdio-h-file-not-found-on-macos
# LLVM_PATH="/opt/homebrew/opt/llvm@12" # or any other path
# LLVM_VERSION="12.0.0"
# export PATH="$LLVM_PATH:$PATH"
# export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
# export LD_LIBRARY_PATH="$LLVM_PATH/lib/:$LD_LIBRARY_PATH"
# export DYLD_LIBRARY_PATH="$LLVM_PATH/lib/:$DYLD_LIBRARY_PATH"
# export CPATH="$LLVM_PATH/lib/clang/$LLVM_VERSION/include/"
# export LDFLAGS="-L$LLVM_PATH/lib"
# export CPPFLAGS="-I$LLVM_PATH/include"
# export CC="$LLVM_PATH/bin/clang"
# export CXX="$LLVM_PATH/bin/clang++"

# export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kleiner/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# ------------ History ------------
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
# Increasing the history size from default 1000
# https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
# I still sometimes see that my history getting lost. Therefore I have a cron job to backup the history file
# see also https://unix.stackexchange.com/questions/568907/why-do-i-lose-my-zsh-history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
# I see that the default behaviour is that duplicated commands which are executed back to back are not stored. This is what I want.
# The default behaviour of zhs (in MacOs) is to keep the history of the current session in memory and write it to the history file only when the session ends. This means that if I have multiple zsh sessions open, I cannot acess the commands from the other session. To fix this, I need to disable shell sessions and enable shared history.
# This way, all the commands you write in any session will be appended to the history file immediately.
# https://apple.stackexchange.com/questions/427561/macos-zsh-sessions-zsh-history-and-setopt-append-history
export SHELL_SESSIONS_DISABLE=1
setopt SHARE_HISTORY
# Just to make sure that the history file is not lost again randomly, if I see this, I can restore it from /Users/kleiner/backup
if [[ $(wc -l < $HISTFILE) -lt 1500 ]]; then
    echo -e "\n ********* History file seems to be truncated *********\n"
fi
# To prevent history from recording duplicated entries (such as ls -l entered many times during single shell session), you can set the hist_ignore_all_dups option:
# I've tested this, seems to be working (https://unix.stackexchange.com/questions/603334/how-can-i-use-hist-ignore-dups-to-ignore-duplicate-lines-in-zsh-with-extended-hi)
setopt hist_ignore_all_dups