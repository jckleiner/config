
The downloaded `.dmg` files are stored in Homebrew cache.
`brew --cache` gives the folder where the packages are stored.

`brew cleanup` only cleans outdated package versions if you have the newest version installed,

To simulate a cleanup, i.e. see what would be removed, you may use the `-n` option: `brew cleanup -n`

## TODO
 
 * Alfred - config, with applescript? Has separate .plist files, see `cd "~/Library/Application Support/Alfred/Alfred.alfredpreferences/preferences/"`
 * Hold down CMD Q for 2 seconds to quit a program - see https://www.youtube.com/watch?v=uaJSjgVEhMQ
 * Yabai dont open smaller windows in full screen, add all to the list?
 * Reorganize folders in this repo?
 * Harddrive plug error when unplugging the laptop from dock?
 * Karabiner, laptop and external keyboard has different keyboard layouts
 * top bar config
 * fix theme git errors
 * how to install yabai with --HEAD?
 * Short way to install and setup only zsh on the current machine
 * Vagrant?
 * MS Word one time licence?
 * seems cool: 
    - xbar
    - keyboard-maestro
    - see: https://www.youtube.com/watch?v=MyZ8Rq9iI14&t=260s
 * Parallels?
 * All commands are executed with `become` (see inventory)?
 * remove `.DS_Store`???
 * Add `System Preferences` to Dock
 * How does .zhistory work and why does separate terminal windows have their own history, when are they merged?

 * validation for dock and homebrew, needed?

 * a script (hammerspoon? or in .zprofile with skhd and yabai commands) which 
    1. creates workspaces if none exist
    2. opens all the used programs in the correct workspaces

 * git - config, why does m1 wants passphrase and work mac won't???
 * Firefox - config, bookmarks, extensions, make it default browser
 * IntelliJ - config, extensions?
 * Maven - Has a dependency openjdk. Brew will also install Java 17
 * Snagit (Webiste)
 * SnippetsLab (AppStore)

 * TODO fzf quit is ESC, lf quit is 'q' -> make LF quit also ESC
 * update readme, oh-my-zsh not needed 
 * Check this - https://unix.stackexchange.com/questions/30925/in-bash-when-to-alias-when-to-script-and-when-to-write-a-function
 * .zsh_history is empty, what's the difference history vs zsh_history?
 * TODO: where to put open apps like simon says, .profile, .zprofile
    - Apps which won't open automatically on startup
    - open -a 'Simon Says'
    - open -a 'Dozer'
    - https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout


### iTerm2
 * iTerm2 loses focus after splitting panes.
 * Iterm2 - config, learn shortcuts, tmux? - https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles
 * How to enable `General > Preferences > Load preferences from a custom URL` programatically???
 * tmux so when quitting, the session is not lost?


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


### Karabiner Elements
1. Karabiner Elements with homebrew (requires password)
TODO restart karabiner in command line?
3. Karabiner picked up the config automatically after restart
4. TODO: Preferences >> Keyboard >> modifier keys >> which one to choose? (Still not sure)
5. TODO: when using the laptop, the modifiers change, fix that


### Yabai
* See README in config/yabai (TODO - stack line not working)


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

## Manual Steps
 * Restart the machine
 * Set default browser to Firefox: System Preferences > General

### Yabai
See yabai readme

### SSH Config and git
1. Create a `.ssh` folder: `mkdir ~/.ssh` (TODO permissions?)
3. Copy your public and private key there
4. Create a `~/.ssh/config` file (See https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use)
5. Global git settings user and email
   * `git config --global user.name "John Doe"`
   * `git config --global user.email johndoe@example.com`

Git is still asking for username/password with `~/.ssh/config` present?
(https://stackoverflow.com/questions/10909221/why-is-github-asking-for-username-password-when-following-the-instructions-on-sc)

 * Solution: change "https://..." to "git@github..." in `.git/config` for that repository

Here is an official answer to this:
> If Git prompts you for a username and password every time you try to interact with GitHub, you're probably using the HTTPS clone URL for your repository. Using an HTTPS remote URL has some advantages: it's easier to set up than SSH, and usually works through strict firewalls and proxies. 
>
> However, it also prompts you to enter your GitHub credentials every time you pull or push a repository. 
>
> You can configure Git to store your password for you. If you'd like to set that up, read all about setting up password caching.

### OpenJDK and Maven
 * Download and install Azul Zulu openjdk 11 (arm64 `.dmg` file) - https://www.azul.com/downloads/?version=java-11-lts&os=macos&package=jdk (see also: https://stackoverflow.com/questions/68358505/how-to-compile-openjdk-11-on-an-m1-macbook)
 * `maven --version` shows openjdk 17, which was installed from homebrew as a dependency. 

   `brew info openjdk` gives this output:

         ==> Caveats
         For the system Java wrappers to find this JDK, symlink it with
         sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

         openjdk is keg-only, which means it was not symlinked into /opt/homebrew,
         because macOS provides similar software and installing this software in
         parallel can cause all kinds of trouble.

         If you need to have openjdk first in your PATH, run:
         echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc

         For compilers to find openjdk you may need to set:
         export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

So, `brew install openjdk@17` installs the openjdk 17 but does NOT link it (meaning symlink it into `/Library/Java/JavaVirtualMachines`)

 > For the system Java wrappers to find this JDK, symlink it with
 >
 > `sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk`

When only Zulu JDK 11 was installed and openjdk@17 was not symlinked yed, `java --version` outputs 'Java 11'. 
After the symlink, `java --version` outputs 'Java 17'. `mvn --version` outputs 'Java 17' in both cases because it is pointing to its dependency propbably.

So, if Java 17 is needed, just symlink it like above. IntelliJ can then automatically detect that JDK 17.

 * You could also use the java bin in the brew package : `export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"`, `java --version` outputs openjdk 17.0.1. But probably this is not the proper way to do it.

### IntelliJ
 * Import all settings: `File > Manage IDE Settings > Import Settings`
 * The font is sometimes NOT imported and IntelliJ sticks to its default font for some reason. This can be fixed either by manually selecting the correct font again or deleting the `editor-font.xml` file in `~/Library/Application Support/JetBrains/IdeaIC2021.3/options`. This forces IntellJ to use the correct fonts configured in `.../options/editor.xml`
 * Select a JDK. Generally IntelliJ will detect the available JDK's