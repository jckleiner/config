# lf file manager

### LS_COLORS / LFCOLORS
The colors of the files and directories you see is defined in a color scheme, which is stored in the `LS_COLORS` env-variable. You can override this variable in your `bashrc` or `zshrc` files.

OSX uses the `LFCOLORS` variable. 
Add the following snippet AFTER the `source $ZSH/oh-my-zsh.sh` line to override the themes LS_COLORS:

    # LS_COLORS for Linux (has no effect in Mac)
    export LS_COLORS="di=34:ln=36:so=35:pi=33;40:ex=32:bd=1;33;40:cd=1;33;40:su=0;41:sg=30>
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

    # The MAC equivalent of the LS_COLORS above (has no effect in Linux)
    export LSCOLORS="exgxfxdacxDaDaxbadacex"

* **TODO**: tree colors still not nice

### Modify existing user accounts
* **Change shell for an existing user**: `usermod -s /usr/bin/zsh myuser`

### LF File Manager (cross platform)
Doc: https://godoc.org/github.com/gokcehan/lf

Insallation Linux:
1. `wget https://github.com/gokcehan/lf/releases/download/r21/lf-linux-amd64.tar.gz`
2. `tar xvf lf-linux-amd64.tar.gz && chmod +x lf`
3. `sudo mv lf /usr/local/bin`
4. `rm -f ./lf-linux-amd64.tar.gz`

Insallation Mac:
1. `brew install lf`

Keys:
* Config for a user is under `~/.config/lf/lfrc`
* Move with vim keys or arrow keys
* Right arrow (or l) on a file opens the file with the default program
* By default there is no delete key assigned
* Edit: `e` (default vi)
* Rename: `r`
* Show file with less: `i`
* Copy: `y`
* Paste: `p`
* Cut: `d`
* Clear (selected items for cut etc.): `c`
* Mark: `spacebar`
* Un-mark: `u`
* Run command: `$`
* Bookmark current directory: `m` -> `<key>`
* Load Bookmarks: `'` -> `<key>`
* Remove Bookmarks: `"` -> `<key>`
* Show hidden files: `set hidden on`

How to write your own commands and map it to a key:
   cmd mkdir ${{
      set -f
      printf "Directory name: "
      read ans
      mkdir $ans
   }}
   map a mkdir

* **TODO**: mkdir, assign it to `m`
mkdir not working...
* **TODO**: reassign `m` to some other key

* **TODO**: reload lf after chmod because permission changes don't show up unless restarted?

* **TODO**: Move between terminal panes with CMD broke... left right not working

* **TODO**: lf does not open some files for instance .json
maybe write a custom open function?

* **TODO**: what is mapkey?
* **TODO**: in .zprofile you can change default stuff, like ZDOTFILES
* **TODO**: after a command, lf don't recognize the first key pressed?

rc runs each time a new shell is opened, 
profile runs once when you login to that shell