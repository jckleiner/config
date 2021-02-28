

### General
  - Workspaces: open 6 workspaces: Keyboard -> shorcuts -> mission control -> give them CMD + ", CMD + 1 and so on
  - Don't change the order of the workspaces: System Prefs > Mission Control > Automatically rearrange
  - Order Files in Grid: Right click on empty space in finder -> show view options -> snap to grid and adjust icon size / grid space
  - Disable file and workspace animations: Accessibility -> Display -> Reduce motion
  - Disable CMD + Space from keyboard -> shortcuts
  - Language Switch: CMD + Shift + Space
  - Show desktop -> f1
  - `git config --global user.email "your@email.com"`
  - `git config --global user.name "your name"`
  - remove pma_agent which blocks port 8000 `sudo /Library/Parallels/pma_agent.app/Contents/MacOS/pma_agent_uninstaller.app/Contents/Resources/UninstallAgentScript.sh`
  - TODO: add lock to touch bar, remove siri
  - Change keyboard shortcuts for screen capture to clipboard and to file
  - Turn off voice over keyboard shortcut
  - disable Service keyboard shorcut "Search manpage index..."
  - Order Top bar: Hold Command key -> move icons
  
  - homebrew
  - Docker
  - Lombok
  - Dbeaver
  - Tiles
  - install font consolas.ttf https://github.com/tsenart/sight/blob/master/fonts/Consolas.ttf
  https://github.com/tsenart/sight/blob/master/fonts/Consolas.ttf?raw=true
  - Itsycal install. Config: H:mm - EEEE, dd.MMMM
  - Postman
  - Alfred and configure CMD + Space
  - Giphy capture -> give screen recording permission
  - Snippet manager "Lepton": brew install --cask lepton
  - node
  - maven
  - lf
  - zsh
  - oh-my-zsh
  - FirstSpirit Launcher (make sure checkbox "use launcher" is activated)
  - keepassxc
  - slack
  - notion
  - anki

  - bartender?
  - hyperdock?

### Finder
  - View -> Show "path bar" and "status bar"

### NPM-Sass
  - Error: Node Sass does not yet support your current environment: 
    OS X 64-bit with Unsupported runtime (88)
      Solution: npm rebuild node-sass

### Lombok with Intellij
  1. Install Plugin
  2. Preferences -> Annotation processing -> on.
  3. Sometimes you need to switch to "obtain processors from project classpath" for your project in annotation processing tab3

### Java
Step 1: Install Java 11
  - https://adoptopenjdk.net/releases.html?variant=openjdk11
Step 2: After installation of Java 11. Confirm installation of all versions. Type the following command in your terminal.
  - /usr/libexec/java_home -V
Step 3: Edit .bash_profile (or zsh)
  - sudo nano ~/.bash_profile
Step 4: Add 11.0.1 as default. (Add below line to bash_profile file).
  - export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.1)
  - to switch to any version: export JAVA_HOME=$(/usr/libexec/java_home -v X.X.X)
  - Now Press CTRL+X to exit the bash. Press 'Y' to save changes.
Step 5: Reload bash_profile
  - source ~/.bash_profile
Step 6: Confirm current version of Java
  - java -version

### Sourcetree keeps asking for password
  - nano ~/.ssh/config
  Host bitbucket.adesso-group.com github.com anotherHost2.com
      IdentityFile ~/.ssh/id_rsa
      UseKeychain yes

   
### Firefox
  - Change theme to white: Preferences -> Extension and themes -> Light
  - Import bookmarks: Shift + Command + B -> Up/Down icon
  - Make Firefox the default browser: Preferences -> General
  - Open tab not at the end of the bar but after currently open tab: about:config -> 'curr' -> .insertAfterCurrent and .insertRelatedAfterCurrent true
  - Change lang to Eng
  - ABP

### VsCode
  - Import settings: CMD + , -> 'settings.json' -> paste new config and save
  - TODO: icon pack, all other extensions
  - code . in terminal: After installation, launch VS Code. Now open the Command Palette (F1 or shift+cmd+P on Mac) and type shell command to find the Shell Command: Install 'code' command in PATH command.
  - Squash empty folders into one path: "explorer.compactFolders": true
  - fix messed up graphics/colors of navigation area
    Shift+Cmd+P -> Preferences: Configure runtime args -> "disable-hardware-acceleration": true

### IntelliJ
  - If "cannot resolve symbol" meaning if it does not show import suggestions, even though the dependency is there:
    File | Invalidate Caches
  - Hide code coverage: Run -> Hide Coverage data
  - Code coverage expand lines: 
      System Preferences > editor > Color Scheme > General > Line Coverage
      Only check "Background" with the color you want, uncheck "Bold" and "Foreground"
      
### iTerm2 
  - shortcut for opening a new terminal / focusing existing: `iTerm2 -> Preferences -> Keys -> Hotkey -> CTRL + ALT + T`
  - Preferences -> Profiles -> Colors -> Light Background
  - Shortcuts:
    ⌘ + up/left/down/right  -> move between windows and tabs
    ⌘ + D                   -> Split pane vertically
    ⌘ + shift + D           -> Split pane horizontally
    ctrl + ⌘ + T            -> Open Terminal / toggle open terminal window

### Open a terminal in Finder
  `Keyboard -> Shortcuts -> Services -> new iTerm2 window here -> CMD + Shift + 1
  Select a file or folder, press shortcut`

### Open files with .xyz file endings with a particular app (i.e. vscode)
  Right click on file -> get info -> open with change -> select program -> click 'change all'

### Enable syntax higlighting for vi and nano 
  **vim**
  `echo "syntax on" >> ~/.vimrc`

  **nano**
  `brew install nano`
  Brew will install many files for different formats under `/usr/local/share/nano`

  We can inclide ALL syntax highlight colors for our user:
  * `nano ~/.nanorc`
  * add `include "/usr/local/share/nano/*.nanorc"`


  **change syntax highlighting colors for nano**

  Go to the `/usr/share/nano` (Linux) or `/usr/local/share/nano` (Mac) directory and check out the `*.nanorc` files there. For example, to change the comment color in PHP, edit `/usr/share/nano/php.nanorc` and change:

      color brightblue start="/\*" end="\*/"
          to
      color red start="/\*" end="\*/"

  Which files to import can be controlled in `~/.nanorc` for an individual user.

### Mac Fuckedup Keyboard layout, switch `"` and `<` 
  The fix for this is to run the Keyboard Setup Assistant again. Sometimes there is a button for "Change Keyboard Type" visible in "System Preferences/Keyboard".

  1. If not, you can try trashing the file `/Library/Preferences/com.apple.keyboardtype.plist` and restarting your machine.
  2. Before restarting try opening Terminal and type: `sudo open /System/Library/CoreServices/KeyboardSetupAssistant.app/Contents/MacOS/KeyboardSetupAssistant`

### EN-US keyboard layout on MAC
  The tilde `~` is normally below the escape key. But for some reason, on a Mac, that is next to Shift. The button on the laptop's keyboard, where `~` normally is, on Mac it writes `§`.
  To use the original US layout on an EXTERNAL EU Keyboard (big enter): `keyboard -> change keyboard type -> american layout`

### Apache Server (MAC)
  I've installed apache somehow, I dont remember how.

  Normally the DocumentRoot is `/usr/local/var/www`
  But I've changed it to: `DocumentRoot "/Users/kleiner/develop/"` (Listen 80)

  ```
  /Users/kleiner/develop/index.html -> This is called on 'localhost:80'
  /usr/local/etc/httpd/conf.d/vhosts.conf -> has all the local endpoints like phpmyadmin (8008), typo3 (7007)
  ```

  Apache CONF: `/usr/local/etc/httpd/httpd.conf`

  To have launchd start httpd now and restart at login: `brew services start httpd`

  Or, if you don't want/need a background service you can just run: `apachectl start`

  Start/Stop APACHE:
  * `sudo apachectl start`
  * `sudo apachectl restart`
  * `sudo apachectl stop`

  Error Log: `tail -f /usr/local/var/log/httpd/error_log`

### Phpmyadmin
  root:root
  Downloaded and extracted phpmyadmin to `/Users/kleiner/develop/phpmyadmin/`. I did not install anything else on the system with brew.

#### How to access remote server or a different port with local phpMyAdmin client? 
  By default phpmyadmin accesses localhost (port 3306)
  
  1. Go to phpmyadmin dir (default: `/etc/phpmyadmin/config.inc.php`, in my case: `/Users/kleiner/develop/phpmyadmin/`)
  2. There is a `config.sample.inc.php`, either rename or create a copy it with the name `config.inc.php`
  3. Add the following lines (when you login, at the top left it says `localhost:3306` now. Before it was just `localhost`)
  
  ```php
    /* 
      IMPORTANT: don't add $cfg['Servers'][$i]['port']
      add the port number after the host name, if non given it will be 3306
    */
    $i++;
    $cfg['Servers'][$i]['host'] = 'HostName:port'; //provide hostname and port if other than default
    $cfg['Servers'][$i]['user'] = 'userName';   //user name for your remote server
    $cfg['Servers'][$i]['password'] = 'Password';  //password
    $cfg['Servers'][$i]['auth_type'] = 'config'; // keep it as config
  ``` 


### MySQL 5.7 (default port 3306)
  root:root
