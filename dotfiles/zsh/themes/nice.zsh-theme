# https://github.com/Parth/dotfiles/blob/master/zsh/prompt.sh

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# %m -> The hostname up to the first '.'
# %n -> $USERNAME
# %d -> Current working directory

# autoload -U colors loads the function 'colors' which is provided by zsh
# colors calls the function 'colors' which sets the names for colors, so we can call colors by name, like we do below
autoload -U colors && colors

# needed, enables command substitution in prompt
setopt PROMPT_SUBST


# TODO: this does not work --> 256 colors in the prompt can be used like so: %{$FG[240]%}<text>%{$reset_color%} 
# https://geoff.greer.fm/lscolors/  https://jonasjacek.github.io/colors/
# man zshmisc
# https://unix.stackexchange.com/questions/25319/256-colour-prompt-in-zsh


function git_current_branch() {
  # TODO: how to make this if cleaner?
  local is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi 
  
  # TODO when switched to commit
  # echo " %B%F{green}\uf417  $(git branch --show-current)%{$reset_color%}"
  
  echo " %B%F{green}\ufb2b  $(git branch --show-current)%{$reset_color%}"
}

# List staged files
# git diff --name-only --cached
# git diff --name-only --cached | wc -l | awk '{$1=$1};1'

# List unstaged files
# git ls-files -m
# git ls-files -m | wc -l | awk '{$1=$1};1'

# Branch Icon
# fb2b
# \ufb2b -> escape to unicode

function git_status_count() {
  local is_inside_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ "$is_inside_work_tree" != true ] ; then
    return
  fi

  # awk removes the whitespace which comes with wc
  # local num_status=$(git status --short | wc -l | awk '{$1=$1};1')
  #   if [ $num_status -gt 0 ]; then
  #     echo "%{$fg_bold[red]%}+$num_status%{$reset_color%}"
  # fi

  # awk removes the whitespace which comes with wc
  local count_unstaged=$(git ls-files -m | wc -l | awk '{$1=$1};1')
  local count_staged=$(git diff --name-only --cached | wc -l | awk '{$1=$1};1')

  # if [ $count_staged -gt 0 ]; then
  #     echo "%B%F{105}+$count_staged%{$reset_color%}"
  # fi

  local unstaged_promt="%B%F{red}-$count_unstaged%{$reset_color%}"
  local staged_promt="%B%F{105}+$count_staged%{$reset_color%}"

  if [ $count_unstaged -gt 0 ] && [ $count_staged -gt 0 ]; then
      echo $unstaged_promt $staged_promt
  elif [ $count_unstaged -gt 0 ]; then
      echo $unstaged_promt
  elif [ $count_staged -gt 0 ]; then
      echo $staged_promt
  fi
}

function last_exit_code() {
  if [ "$?" != 0 ] ; then
    echo "%B%F{red}[ %? ]%{$reset_color%} "
    # echo "%{$fg[red]%}[ %? ]%{$reset_color%} "
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

# disabled right prompt
#RPROMPT="$(vi_mode_prompt_info)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}"
