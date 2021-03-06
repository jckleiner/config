# https://github.com/Parth/dotfiles/blob/master/zsh/prompt.sh

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# %m -> The hostname up to the first '.'
# %n -> $USERNAME
# %d -> Current working directory

# autoload -U colors loads the function 'colors' which is provided by zsh
# colors calls the method 'colors' which sets the names for colors, so we can call colors by name, like we do below
autoload -U colors && colors

# needed, enables command substitution in prompt
setopt PROMPT_SUBST

# 256 colors in the prompt can be used like so: %{$FG[240]%}<text>%{$reset_color%} - https://geoff.greer.fm/lscolors/

function git_current_branch() {
  # TODO: how to make this if cleaner?
  local is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi 
  
  echo "%{$fg[green]%}$(git branch --show-current)%{$reset_color%}"
}

function git_status_count() {
  local is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi

  # awk removes the whitespace which comes with wc
  local num_status=$(git status --short | wc -l | awk '{$1=$1};1')

  if [ $num_status -gt 0 ]; then
      echo "%{$fg_bold[red]%}+$num_status%{$reset_color%}"
  fi
}

function last_exit_code() {
  if [ "$?" != 0 ] ; then
    echo "%{$fg[red]%}%?%{$reset_color%} "
  fi 
}

# If: 
#   1. Connected through SSH: print colored [$user_name - $host_machine]
#   2. Local, $_MAIN_USER global env is set and logged in on a different user than the $_MAIN_USER:  print [$user_name]
#   3. Local, $_MAIN_USER global env is set and logged in as $_MAIN_USER: do nothing
#   4. $_MAIN_USER is not set: print [$user_name]
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

  # display user and host when connected with ssh
  if [[ -n $SSH_CONNECTION ]]; then
    echo "[$user_name - $host_machine] "
  # display user if it is not the 'main' user
  elif [[ $_MAIN_USER != $USER ]]; then
    echo "[$user_name] "
  fi
}

_current_dir="%{$fg_bold[black]%}%d%{$reset_color%}"

PROMPT='
$(last_exit_code)$(_user_host)${_current_dir} $(git_current_branch) $(git_status_count)
%{%F{white}%}▶%{$reset_color%} '

PROMPT2='%{%F{red}%}◀%{$reset_color%} '

git_status_count

# disabled right prompt
#RPROMPT="$(vi_mode_prompt_info)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}"