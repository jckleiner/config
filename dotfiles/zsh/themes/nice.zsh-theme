# Copy of AVIT ZSH Theme https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/avit.zsh-theme
# https://github.com/Parth/dotfiles/blob/master/zsh/prompt.sh

# 256 colors can be used like so: %{$FG[240]%}<code here>%{$reset_color%}

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# %m -> The hostname up to the first '.'
# %n -> $USERNAME

# autoload -U colors loads the function 'colors' which is provided by zsh
# colors calls the method 'colors' which sets the names for colors, so we can call colors by name, like we do below

# 

autoload -U colors && colors

etopt PROMPT_SUBST

export CLICOLOR=1
# LS colors, made with https://geoff.greer.fm/lscolors/
export LS_COLORS="di=34:ln=36:so=35:pi=33;40:ex=32:bd=1;33;40:cd=1;33;40:su=0;41:sg=30"
export LSCOLORS="exgxfxdacxDaDaxbadacex"
export GREP_COLOR="1;33"

typeset +H _current_dir="%{$fg_bold[black]%}%d%{$reset_color%}"

function git_current_branch() {
  # TODO: how to make this cleaner?
  is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi 
  
  echo "%{$fg[green]%}$(git branch --show-current)%{$reset_color%}"
}

function git_status_count() {
  is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi

  # awk removes the whitespace which comes with wc
  num_status=$(git status --short | wc -l | awk '{$1=$1};1')

  if [ $num_status -gt 0 ]; then
      echo "%{$fg_bold[red]%}+$num_status%{$reset_color%}"
  fi
}

function last_exit_code() {
  if [ "$?" != 0 ] ; then
    echo "%{$fg[red]%}%?%{$reset_color%} "
  fi 
}

function _user_host() {
  local user_name
  local user_name_color=black
  local host_machine="%{$FG[1]%}%m%{$reset_color%}"

  if [[ -n $SSH_CONNECTION ]]; then
    user_name_color="magenta"
  fi
  if [[ $USER = "root" ]]; then
    user_name_color="red"
  fi

  user_name="%{$fg_bold[$user_name_color]%}%n%{$reset_color%}"

  # show user and host when connected with ssh
  if [[ -n $SSH_CONNECTION ]]; then
    echo "[$user_name - $host_machine] "
  # show user if it is not the 'main' user defined in the .zshrc
  elif [[ "kleiner" != $USER ]]; then ## TODO define this in .zshrc?
    echo "[$user_name] "
  fi
}

# TODO: is PROMPT for zsh or oh-my-zsh?

PROMPT='
$(last_exit_code)$(_user_host)${_current_dir} $(git_current_branch) $(git_status_count)
%{%F{white}%}▶%{$reset_color%} '

PROMPT2='%{%F{red}%}◀%{$reset_color%} '

# disabled right prompt
#RPROMPT="$(vi_mode_prompt_info)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}"
