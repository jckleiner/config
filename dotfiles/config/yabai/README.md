# yabai

checkout:
  * https://www.youtube.com/watch?v=JL1lz77YbUE
  * https://www.notion.so/Yabai-8da3b829872d432fac43181b7ff628fc

brew install koekeishiya/formulae/yabai
brew install jq
brew install koekeishiya/formulae/skhd
git clone git@github.com:koekeishiya/limelight.git
cd limelight
make

ln -s ~/develop/personal/config/dotfiles/config/yabai/bin/limelight /usr/local/bin/limelight

- create yabairc config
ln -s ~/develop/personal/config/dotfiles/config/yabai ~/.config/yabai
chmod +x  ~/.config/yabai/yabairc

- create skhd config
// needed for skhd commands
brew install chunkc
ln -s ~/develop/personal/config/dotfiles/config/skhd ~/.config/skhd
chmod +x  ~/.config/skhd/skhdrc

- create limelight config
ln -s ~/develop/personal/config/dotfiles/config/limelight ~/.config/limelight
chmod +x  ~/.config/limelight/limelightrc
// kill limelight before loading config
limelight --config ~/.config/limelight/limelightrc

- System preferences
less delay when switching spaces
disable "Automatically rearrange spaces..."

// Will automatically start Yabai when computer starts
brew services start yabai
// STOP yabai
brew services stop yabai
// Will automatically start skhd when computer starts
brew services start skhd


### TODO
  * StackLine?
  * how does full screen work?
  * ignore 
      * firefox download popup
      * intellij, tip of the day, preferences etc.
  * does resizing work?
  * Copy his config
  * copy his scripts
  * setup everything