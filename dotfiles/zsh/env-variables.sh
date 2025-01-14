#!/bin/bash

export PATH="$PATH:/Users/kleiner/.local/bin/:$HOME/go/bin/"

# Stop brew updating everything each time I want to install something
export HOMEBREW_NO_AUTO_UPDATE=1

# Liquibase
export LIQUIBASE_HOME=/opt/homebrew/opt/liquibase/libexec

# Brew change version of package
# brew unlink package
# brew link package@10

# Java Configuration
# See also: https://stackoverflow.com/questions/21964709/how-to-set-or-change-the-default-java-jdk-version-on-macos
# uses java 17 by default (java -version and mvn -v)
# here I can change the java version used on my machine. Both 17 and 21 are installed.
# TODO - switch does not work properly, maybe use sdkman?
# local java_version=21
# export JAVA_HOME=$(/usr/libexec/java_home -v "$java_version")
# export PATH="/opt/homebrew/opt/openjdk@$java_version/bin/java:$PATH"
export PATH="/opt/homebrew/Cellar/openjdk@21/21.0.4/bin/java:$PATH"
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@21/21.0.4/libexec/openjdk.jdk/Contents/Home"

# Racher Desktop
export PATH="$HOME/.rd/bin:$PATH"

# javahome() {
#   unset JAVA_HOME
#   export JAVA_HOME=$(/usr/libexec/java_home -v "$1");
#   java -version
# }

# alias j17='javahome 17'
# alias j21='javahome 21'

# where java

# fixes the "git_current_branch:14: character not in range" error which is only shown in the intellij terminal?
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# use nano as the default editor
export EDITOR=nano
export VISUAL="$EDITOR"

# man page for ls: "ls -G   Enable colorized output. This option is equivalent to defining CLICOLOR in the environment."
export CLICOLOR=1

############ FZF -  mostly copied from devinsideyou https://www.youtube.com/watch?v=tB-AgxzBmH8 ############
# for the optimal settings it requires: fd, bat, tree

# Makes the default command 'fzf':
#  -> use 'fd', which ignores patterns from your .gitignore, by default
#  -> search for only files (CTRL + F, default is files and directories)
#  -> include hidden files
#  -> exclude .git files in the .git directory

# ALT  + C (default) is mapped to CTRL + T
# CTRL + T (default) is mapped to CTRL + F

if [ -x "$(command -v fd)" ]; then
    export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden --exclude ".git"'
    export FZF_ALT_C_COMMAND='fd --type d --follow --exclude ".git" --color=never --hidden'
else
    # find does NOT ignore files in .gitignore
    export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/\.git/*" -not -path "*/\node_modules/*"'
    export FZF_ALT_C_COMMAND='find . -type d -not -path "*/\.git/*" -not -path "*/\node_modules/*"'
fi


# enable colorful file previews using 'bat'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if [ -x "$(command -v bat)" ]; then
    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
else
    export FZF_CTRL_T_OPTS="--preview 'head -n 50 {}'"
fi


# enable directory preview using 'tree'
if [ -x "$(command -v tree)" ]; then
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
fi

export FZF_CTRL_R_OPTS="--reverse --height 40%"
# export FZF_DEFAULT_OPTS='--no-height --color=fg+:#000000,bg+:#d1d1d1,gutter:-1,pointer:#bc0d65,info:#bc0d65,hl:#bc0d65,hl+:#bc0d65' # For light themes
export FZF_DEFAULT_OPTS='--no-height --color=fg+:#000000,bg+:#ffffff,gutter:-1,pointer:#ff7881,info:#ff7881,hl:#ff7881,hl+:#ff7881' # For dark themes

#######################################################################################################################

# Bat Themes - use 'bat --list-themes' to see all themes
# export BAT_THEME="GitHub"     # For light terminal themes
export BAT_THEME="ansi"         # For dark terminal themes

# lf icons requires a nerd font to be used in the terminal
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

# Default colors are fine atm, uncomment if you want to adjust
# LS colors, made with https://geoff.greer.fm/lscolors/
# for *nix
#export LS_COLORS="di=34:ln=36:so=35:pi=33;40:ex=32:bd=1;33;40:cd=1;33;40:su=0;41:sg=30"
# for macOs
#export LSCOLORS="exgxfxdacxDaDaxbadacex" # TODO: tree colors still not nice with this color scheme

# grep highlight color can be changed like this, default is red
# export GREP_COLOR='1;30;40'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# export LANG=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# HOMEBREW_PREFIX is different on arm64 and intel macs
# homebrew_prefix: "{{ (ansible_machine == 'arm64') | ternary('/opt/homebrew', '/usr/local') }}"
# ▶ echo $HOMEBREW_PREFIX
# /opt/homebrew

# Some options in GNU grep are not working in MacOs's grep that's why installed GNU grep with brew.
# Some gnu commands are installed with a 'g' prefix with brew. For example 'ggrep', 'ssed'
# This makes it so that the installed GNU grep can be just called 'grep'
#   MacOs's grep -V: grep (BSD grep, GNU compatible) 2.6.0-FreeBSD
#   Brew's grep -V: grep (GNU grep) 3.10
export PATH="$HOMEBREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
