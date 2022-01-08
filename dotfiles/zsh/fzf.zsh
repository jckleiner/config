# Setup fzf
# ---------

# Normally this file is generated (~/.fzf.[zsh|fish|bash]) when the fzf install script is executed (see the github readme):
  # To install useful key bindings and fuzzy completion:
  # $(brew --prefix)/opt/fzf/install

# Since I only use zsh, I can just source this file from .zshrc after installing fzf (with brew)
  # installs on Monterey (M1) with brew to:   /opt/homebrew/opt/fzf/
  # installs on MacOS X (Intel) with brew to: /usr/local/opt/fzf/

# fzf is in */homebrew/bin which is already in path, so this is not needed
# if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
# fi

# Auto-completion
# ---------------
# See examples: https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
# $- (dollar hyphen) bash parameter is used to get current option flags specified during the invocation, by the set built-in command or set by the bash shell itself.
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

