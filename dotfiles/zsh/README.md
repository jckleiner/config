# zsh, oh-my-zsh

Oh My ZSH is a plugin that runs on top of ZSH. It provides a default config for ZSH (`~/.zhrc` file) and also provides themes and other features.
Keep in mind, if you create a new user, the user should have a home directory. Else the zsh configurator will not start.

- In order for Oh-My-Zsh to work, Zsh must be installed.
  - Please run `zsh --version` to confirm.
  - Expected result: `zsh 5.4.2` or more recent
- Additionally, Zsh should be set as your default shell.
  - Please run `echo $SHELL` from a new terminal to confirm.
  - Expected result: `/usr/bin/zsh` or similar

## Install ZSH and make it the default shell

1. Install Zsh with the package manager of your choice, _e.g._:
   - `sudo apt install zsh`
   - for mac: `brew install zsh`
2. Make it the default for the current user: `sudo chsh -s $(which zsh) $USER`
   - See the current users shell: `sudo cat /etc/passwd | grep $USER` or `echo $SHELL`
   - Note that this will not work if Zsh is not in your authorized shells list (`/etc/shells`) or if you don't have permission to use `chsh`.
4. Log out and log back in again to use your new default shell.
5. Test that it worked with `echo $SHELL`. Expected result: `/bin/zsh` or similar. `zsh --version` should be `zsh 5.4.2` or more recent

https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

## Install oh-my-zsh

This will install and change the shell to ZSH for the current user.

* curl must be installed: `apt-get install curl`
* git must be installed: `apt-get install git`
* zsh must be installed: `apt-get install zsh`

1. **Install oh-my-zsh with curl**: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

   **Install oh-my-zsh with wget**: `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

**Change the shell to zsh manually**

1. `usermod -s /usr/bin/zsh myuser`
2. Control: `grep myuser /etc/passwd`

**ZSH Theme**

0. Clone the config repo -> move the nice theme to `~/.oh-my-zsh/themes/`
1. `nano ~/.zshrc`
2. Change theme to to my custom theme `nice` (or `avit`, `dst`)

**Change Colors of a Theme** - https://jonasjacek.github.io/colors/
1. Open theme: `nano ~/.oh-my-zsh/themes/dst.zsh-theme`
2. To add any of the 255 colors type this color code before the text: `%F{208}`

**Reload**: `. ~/.zshrc`

**Add Plugins**:
1. `git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`
2. `nano ~/.zshrc` find `plugins=(git)`
3. append to `plugins=(git zsh-autosuggestions)`
4. add also `export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=152`
5. reload `. ~/.zshrc`

### LS_COLORS / LFCOLORS
The colors of the files and directories you see is defined in a color scheme, which is stored in the `LS_COLORS` env-variable. You can override this variable in your `bashrc` or `zshrc` files.

OSX uses the `LFCOLORS` variable.
Add the following snippet AFTER the `source $ZSH/oh-my-zsh.sh` line to override the themes LS_COLORS:

    # LS_COLORS for Linux (has no effect in Mac)
    export LS_COLORS="di=34:ln=36:so=35:pi=33;40:ex=32:bd=1;33;40:cd=1;33;40:su=0;41:sg=30>
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

    # The MAC equivalent of the LS_COLORS above (has no effect in Linux)
    export LSCOLORS="exgxfxdacxDaDaxbadacex"

**`autoload colors`**
zsh provies/sets a function called `colors` which defines some color properties and also sets names for many colors.
`autoload colors && colors` allows you to call colors by their name. 

Autoload tells zsh to look for a file in `$FPATH/$fpath` containing a function definition, instead of a file in `$PATH/$path` containing a script.
See https://stackoverflow.com/questions/30840651/what-does-autoload-do-in-zsh for more info.

The autoload feature is not available in `bash`, but it is in `ksh` (korn shell) and `zsh`.

### (AI) LSCOLORS details

> AI generated, might be wrong!

On macOS, the environment variable controlling the color output of `ls` is `LSCOLORS`, not `LS_COLORS`. The `LSCOLORS` variable uses a sequence of pairs of letters, where the first letter of each pair sets the color of the foreground and the second letter sets the color of the background.

The order of file types in `LSCOLORS` is:

1. Directory
2. Symbolic link
3. Socket
4. Pipe
5. Executable
6. Block special
7. Character special
8. Executable with setuid bit set
9. Executable with setgid bit set
10. Directory writable to others, with sticky bit
11. Directory writable to others, without sticky bit

Each pair of letters corresponds to one of these file types. For example, to set the color of symbolic links to blue, you would set the third and fourth letters of `LSCOLORS` to the code for blue.

The letter codes are:

- a: Black
- b: Red
- c: Green
- d: Brown
- e: Blue
- f: Magenta
- g: Cyan
- h: Light grey
- A: Bold black, usually shows up as dark grey
- B: Bold red
- C: Bold green
- D: Bold brown, usually shows up as yellow
- E: Bold blue
- F: Bold magenta
- G: Bold cyan
- H: Bold light grey; looks like bright white
- x: Default foreground or background

To make symbolic links blue, you could set `LSCOLORS` like this:

```bash
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
```

In this example, `gxBx` sets the color for symbolic links (the second file type). The first `x` (default foreground) is for the text color and the `B` (bold red) is for the background color. You can adjust these as needed for your preference and terminal color scheme.

### Modify existing user accounts
* **Change shell for an existing user**: `usermod -s /usr/bin/zsh myuser`

### fzf
   TODO document simple use cases


**TODO**: 
   * execute certain things only if the current machine is a mac? Make zshrc platform independent
   * git show changed / committed
   * git show difference upbranch?
   * git won't show checkout as branch