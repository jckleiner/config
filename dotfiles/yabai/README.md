# yabai

Source:
  * https://www.youtube.com/watch?v=JL1lz77YbUE
  * https://www.notion.so/Yabai-8da3b829872d432fac43181b7ff628fc

### Setup
 * yabai
 * skhd
 * hammerspoon
 * stackline

### Installing for M1 Macs
Followed the instructions in Installing yabai (from HEAD) https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD) without installing the scripting addition because that needs disabling the SIP.
* Created a Cert
* Installed Yabai with `brew install koekeishiya/formulae/yabai --HEAD` (brew install yabai was saying that ‘yabai is not found’ for some reason) and then signed it
* Opened preferences > Privacy > Accessibility > added the ‘yabai’ exec
* Symlink the config: `ln -s /Users/kleiner/config/dotfiles/yabai ~/.config/yabai`
* `brew services start yabai` and it was working
* `brew install jq`
* `brew install koekeishiya/formulae/skhd`
* `ln -s ~/config/dotfiles/skhd ~/.config/skhd`
* `brew services start skhd` (needs Accessibility permissions)


### Installing for Intel Macs
brew install koekeishiya/formulae/yabai
brew install jq
brew install koekeishiya/formulae/skhd
git clone git@github.com:koekeishiya/limelight.git
cd limelight
make

ln -s ~/develop/personal/config/dotfiles/yabai/bin/limelight /usr/local/bin/limelight

- create yabairc config
ln -s ~/develop/personal/config/dotfiles/yabai ~/.config/yabai
chmod +x  ~/.config/yabai/yabairc

- create skhd config
// needed for skhd commands
brew install chunkc
ln -s ~/develop/personal/config/dotfiles/skhd ~/.config/skhd
chmod +x  ~/.config/skhd/skhdrc

- create limelight config
ln -s ~/develop/personal/config/dotfiles/limelight ~/.config/limelight
chmod +x  ~/.config/limelight/limelightrc
// kill limelight before loading config
limelight --config ~/.config/limelight/limelightrc

- System preferences
less delay when switching spaces
disable "Automatically rearrange spaces..."


### Installing Stackline

1. Install hammerspoon: `brew install hammerspoon --cask`
2. Install stackline: follow the instructions here: https://github.com/AdamWagner/stackline

        # Get the repo
        git clone https://github.com/AdamWagner/stackline.git ~/.hammerspoon/stackline

        # Make stackline run when hammerspoon launches
        cd ~/.hammerspoon
        echo 'stackline = require "stackline"' >> init.lua
        echo 'stackline:init()' >> init.lua

        # Open hammerspoon console
        # Type `hs.ipc.cliInstall()` and hit return
        # Confirm that hs is available by entering the following in your terminal (shell):
          $ which hs
          /usr/local/bin/hs (/opt/homebrew/bin/hs for m1 macs)

For M1 macs with homebrew, there is 2 different steps:

1. https://github.com/AdamWagner/stackline/issues/82

Modify the following line in `conf.lua` (in `~/.hammerspoon/stackline/conf.lua`):

    c.paths.yabai                         = '/usr/local/bin/yabai'

to

    c.paths.yabai                         = '/opt/homebrew/bin/yabai'
""
2. https://github.com/Hammerspoon/hammerspoon/issues/2930:

When you open the hammerspoon console, type `hs.ipc.cliInstall("/opt/homebrew")` instead of `hs.ipc.cliInstall()`.
After this, you should be able to see icons if multiple windows are in a stack layout.

### Will automatically start Yabai when computer starts
`brew services start yabai`
### Restart/Stop yabai
`brew services restart/stop yabai`
### Will automatically start skhd when computer starts
`brew services start skhd`

### Some issues
  `skhd` not working after sleep because secure keyboard bla: https://github.com/koekeishiya/skhd/issues/48
    -> just locking screen and login again fixes it

### TODO
  * TRY: Open a program always in a given space: `yabai -m rule --add app="Finder" space=2` will open Finder and send it to space 2 automatically. Check also this: https://github.com/koekeishiya/yabai/blob/master/doc/yabai.asciidoc#rule
  * learn more about stacks
  * Mac notifications steals focus, check custom scripts to fix it
  * update yabairc, move unused scripts to bottom, clean everything which is not needed
  * why does hyper - w flash screen?
  * migrate notion page?
  * update this readme
  * update dotfiles script with skhd and yabai (+limelight?) stuff