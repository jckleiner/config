# Setup MacOs With Ansible

> Most of the stuff here is taken from Red Shirt Jeff's Repository: https://github.com/geerlingguy/mac-dev-playbook

1. Add the following command to your `.zshrc` to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"`
2. Upgrade Pip: `sudo pip3 install --upgrade pip`
3. Install Ansible: `pip3 install ansible`
4. Test if it's working: `ansible-playbook hello_world.yml`
5. Run: `ansible-playbook -v --ask-become-pass setup.yml`
    * `-v` to get more information from the commands
    * `--ask-become-pass` asks your password once

The downloaded `.dmg` files are stored in Homebrew cache.
`brew --cache` gives the folder where the packages are stored.

`brew cleanup` only cleans outdated package versions if you have the newest version installed,

To simulate a cleanup, i.e. see what would be removed, you may use the `-n` option: `brew cleanup -n`


## TODO
 * All commands are executed with `become` (see inventory)?

 * Check if brew is installed, if not execute the brew install command
 * trash-cli with `npm install --global trash-cli`

 * remove `.DS_Store`???

 * zsh (setup and configure)
 * git - config
 * Iterm2 - config
 * Firefox - config, bookmarks, extensions
 * IntelliJ - config
 * Itsycal - config
 * Alfred - config
 * Maven - Has a dependency openjdk. Brew will also install Java 17
 * Snagit (AppStore)
 * SnippetsLab (AppStore)