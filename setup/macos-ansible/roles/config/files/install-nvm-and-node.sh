### Install NVM and NODE manually

# NVM
# it might be problematic to install nvm via homebrew, that's why installing it manually
# see https://github.com/nvm-sh/nvm#manual-install
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# Installs the latest version of node
nvm install node # "node" is an alias for the latest version

# Not sure but this might be needed so the command node is accessible in further steps
#source "$HOME/.zshrc"