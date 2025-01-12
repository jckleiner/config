# https://github.com/Parth/dotfiles/blob/master/zsh/prompt.sh

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# %m -> The hostname up to the first '.'
# %n -> $USERNAME
# %d -> Current working directory

# 'autoload -U colors' loads the function 'colors' which is provided by zsh
# colors calls the function 'colors' which sets the names for colors, so we can call colors by name, like we do below
autoload -U colors && colors

# needed, enables command substitution in prompt
setopt PROMPT_SUBST

# this does not work --> 256 colors in the prompt can be used like so: %{$FG[240]%}<text>%{$reset_color%}
# https://geoff.greer.fm/lscolors/  https://jonasjacek.github.io/colors/
# man zshmisc
# https://unix.stackexchange.com/questions/25319/256-colour-prompt-in-zsh

function git_current_branch() {
  # TODO: how to make this if cleaner?

  ############### TODO: check if in branch or in commit  ###############

  local is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi
  ############### TODO when switched to commit ###############
  ############### TODO make commit color different ###############
  echo " %B%F{green}\ufb2b  $(git branch --show-current)%{$reset_color%}"
}

function git_status_ahead_and_behind() {
  local is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi

  if [ -z "$(git remote -v)" ]; then
    echo "(remote missing)"
    return
  fi

  local current_branch=$(git branch --show-current)
  # check if remote branch exists
  git rev-list --left-right --count $current_branch...origin/$current_branch 1> /dev/null 2> /dev/null
  if [ $? -ne 0 ]; then
      echo "(remote branch missing)"
      return
  fi

  # count ahead
  local count_ahead=$(git rev-list --left-right --count $current_branch...origin/$current_branch | awk '{print $1}')
  local promt_ahead="%B%F{105}[\uf55c $count_ahead]%{$reset_color%}  "

  if [ "$count_ahead" -gt 0 ]; then
      echo $promt_ahead
  fi

  # count behind
  local count_behind=$(git rev-list --left-right --count $current_branch...origin/$current_branch 2> /dev/null | awk '{print $2}')
  local promt_behind="%B%F{red}[\uf544 $count_behind]%{$reset_color%}  "

  if [ "$count_behind" -gt 0 ]; then
      echo $promt_behind
  fi
}

function git_status_changed() {
  local is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi

  # awk removes the whitespace which comes with wc
  local count_changed=$(git status --short | wc -l | awk '{$1=$1};1')
  local promt_changed="%B%F{red}+$count_changed%{$reset_color%}  "

  if [ $count_changed -gt 0 ]; then
      echo $promt_changed
  fi
}

function last_exit_code() {
  if [ "$?" != 0 ] ; then
    echo "%B%F{red}[ %? ]%{$reset_color%} "
  fi
}

# https://unix.stackexchange.com/questions/9605/how-can-i-detect-if-the-shell-is-controlled-from-ssh
function is_ssh_connection() {
  p=${1:-$PPID}
  read pid name x ppid y < <( cat /proc/$p/stat )
  # or: read pid name ppid < <(ps -o pid= -o comm= -o ppid= -p $p)
  # echo "Is SSH : $pid $name";
  [[ "$name" =~ sshd ]] && { return 0; }
  [ "$ppid" -le 1 ]     && { return 1; }
  is_ssh_connection $ppid
}

# If:
#   1. Connected through SSH: print colored [$user_name - $host_machine]
#   2. Local, $_MAIN_USER global env is set and logged in on a different user than the $_MAIN_USER:  print [$user_name]
#   3. Local, $_MAIN_USER global env is set and logged in as $_MAIN_USER: do nothing
#   4. $_MAIN_USER is not set: print [$user_name]
function _user_host() {
  local user_name
  local user_name_color="blue"
  local host_machine="%{$FG[1]%}%m%{$reset_color%}"

  if [[ $USER = "root" ]]; then
    user_name_color="red"
  fi

  user_name="%{$fg_bold[$user_name_color]%}%n%{$reset_color%}"

  # TODO fix - With every enter -> "cat: /proc/99959/stat: No such file or directory"

  # # display an 'SSH' text, user and host when connected with ssh
  # # if [[ -n $SSH_CONNECTION ]]; then -> does not always work, when switching user for example
  # if is_ssh_connection; then
  #   # if [[ $USER = "root" ]]; then
  #   #   echo "${tag_root} ${tag_ssh} [$user_name - $host_machine] "; return;
  #   # fi
  #   echo "${tag_ssh} [$user_name - $host_machine] "
  # # display user if it is not the 'main' user
  # elif [[ $_MAIN_USER != $USER ]]; then
  #   echo "[$user_name - $host_machine] "
  # fi
}

function environment_id_prompt {
  if [[ -n "$TF_VAR_environment_id" ]] && [[ "$(pwd)" == *"va-platform"* ]]; then
    echo "($TF_VAR_environment_id) "
  else
    echo ""
  fi
}

color_dark_mode_bold="%{$fg_bold[magenta]%}"
color_light_mode_bold="%{$fg_bold[black]%}"
_current_dir="$color_dark_mode_bold%d%{$reset_color%}"

PROMPT='
$(last_exit_code)$(_user_host)${_current_dir} $(git_current_branch) $(git_status_changed)$(git_status_ahead_and_behind)$(environment_id_prompt)
%{%F{white}%}▶%{$reset_color%} '

# timestamp on the right - https://gist.github.com/zulhfreelancer/9c410cad5efa9c5f7c74cd0849765865
RPROMPT="[%D{%L:%M:%S} | %D{%f/%m}]"
