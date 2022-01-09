# Setup MacOs With Ansible

> Most of the stuff here is taken from Red Shirt Jeff's Repository: https://github.com/geerlingguy/mac-dev-playbook


 1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).

 2. Install Ansible:

    a) Run the following command to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"`

    b) Upgrade Pip and install Ansible: sudo `pip3 install --upgrade pip && pip3 install ansible`

 3. Clone this repository to your home folder: `cd ~ && git clone https://github.com/jckleiner/config.git`

 4. Run: `ansible-playbook -v --ask-become-pass ~/config/setup/macos-ansible/setup.yml`
    * `-v` to get more information from the commands
    * `--ask-become-pass` asks your password once


The downloaded `.dmg` files are stored in Homebrew cache.
`brew --cache` gives the folder where the packages are stored.

`brew cleanup` only cleans outdated package versions if you have the newest version installed,

To simulate a cleanup, i.e. see what would be removed, you may use the `-n` option: `brew cleanup -n`

## Manual Steps
    - Set default browser to Firefox: System Preferences > General

## TODO
 * install fonts
 * trash-cli with `npm install --global trash-cli`
 * fix theme git errors
 * Vagrant?
 * Parallels?
 * JDK for arm
 * All commands are executed with `become` (see inventory)?
 * Check if brew is installed, if not execute the brew install command
 * remove `.DS_Store`???

 * Add `System Preferences` to Dock
 * How does .zhistory work and why does separate terminal windows have their own history, when are they merged?

 * validation for dock and homebrew

 * a script (hammerspoon? or in .zprofile with skhd and yabai commands) which 
    1. creates workspaces if none exist
    2. opens all the used programs in the correct workspaces



 * Hold down CMD Q for 2 seconds to quit a program - see https://www.youtube.com/watch?v=uaJSjgVEhMQ
 * git - config, why does m1 wants passphrase and work mac won't???
 * Iterm2 - config, learn shortcuts, tmux? - https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles
 * Firefox - config, bookmarks, extensions, make it default browser
 * IntelliJ - config
 * Alfred - config
 * Maven - Has a dependency openjdk. Brew will also install Java 17
 * Snagit (Webiste)
 * SnippetsLab (AppStore)

 * Yabai dont open smaller windows in full screen, add all to the list?
 * Karabiner, laptop and external keyboard has different keyboard layouts
 

 * TODO fzf quit is ESC, lf quit is 'q' -> make LF quit also ESC
 * update readme, oh-my-zsh not needed 
 * Check this - https://unix.stackexchange.com/questions/30925/in-bash-when-to-alias-when-to-script-and-when-to-write-a-function
 * .zsh_history is empty, what's the difference history vs zsh_history?
 * TODO: where to put open apps like simon says, .profile, .zprofile
    - Apps which won't open automatically on startup
    - open -a 'Simon Says'
    - open -a 'Dozer'
    - https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

 *  TODO - git email and user config
    * git config --global user.name "John Doe"
    * it config --global user.email johndoe@example.com

### VsCode 
 * git push does not use ssh key
 * When opening a new terminal in the current place, the focus shits somewhere else?

### zsh
 * zsh (setup and configure)
    - `zsh --version` gives `zsh 5.8 (x86_64-apple-darwin21.0)` back. Is there an arm version?

# --------- Notes from earlier ---------

 1. Make sure the native Terminal is started (check with `arch`, must give “arm64” back)
 2. Install Homebrew (and add it to PATH manually, see “next step” section)
	`echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/kleiner/.zprofile`
    `eval "$(/opt/homebrew/bin/brew shellenv)"`

### Programs to start on startup
`launchctl list`

Docker -> https://stackoverflow.com/questions/54437744/how-to-start-docker-from-command-line-in-mac

### SSH Config
1. Create an .ssh folder
3. Copy your public and private key there
4. Create a ~/.ssh/config file (See https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use)
5. Global git settings user and email

Git is still asking for username/password with ~/.ssh/config present
https://stackoverflow.com/questions/10909221/why-is-github-asking-for-username-password-when-following-the-instructions-on-sc

 * Solution: change "https://..." to "git@github..." in `.git/config`

Here is an official answer to this:
> If Git prompts you for a username and password every time you try to interact with GitHub, you're probably using the HTTPS clone URL for your repository. Using an HTTPS remote URL has some advantages: it's easier to set up than SSH, and usually works through strict firewalls and proxies. 
> However, it also prompts you to enter your GitHub credentials every time you pull or push a repository. 
> You can configure Git to store your password for you. If you'd like to set that up, read all about setting up password caching.


### Clone Dotfiles/config Repository
1. Cloned dotfiles and put it in home folder

### Karabiner Elements
1. Karabiner Elements with homebrew (requires password)
2. Symlink the karabiner config: `ln -s ~/config/dotfiles/karabiner karabiner`
3. Karabiner picked up the config automatically after restart
4. TODO: Preferences >> Keyboard >> modifier keys >> which one to choose? (Still not sure)
5. TODO: when using the laptop, the modifiers change, fix that

### VsCode
3. TODO argv.json symlink?

### Git
* TODO - add email and name?
* Push changes to config repo


### Yabai
* See README in config/yabai (TODO - stack line not working)


### Fonts
* Installed Monaco Nerd Font


## —— System Settings ——
Use `defaults read > preferences` and do a change and then do `defaults read > preferences` again to see the difference

1. (TODO) Turn off bluetooth
2. Install Rosetta (an installation popup shows up when you try to open an “old” program)

### Finder 
* (TODO) View > Show Path Bar

### Keyboard
* Add Turkish Q Layout
* 

### Dock & Menu Bar (in System preferences)
* (ALL DONE) Preferences >
    * Minimise window using "scale effect"
    * enable “minimise windows into application icon”
    * disable “animate opening applications” 
    * enable “Automatically hide an show the dock”
    * disable “Show recent applications in Dock”
* (TODO) Spotlight > disable “show in menu bar”
* (TODO) Sound > show in menu bar AND "always"

### Display
* Displays > display settings > change the MacBook resolution to “scaled” and select the middle scale (the 3rd option there should be 5 options)
