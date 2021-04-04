# yabai

Source:
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

## Some issues
  `skhd` not working after sleep because secure keyboard bla: https://github.com/koekeishiya/skhd/issues/48
    -> just locking screen and login again fixes it

### TODO

  * learn more about stacks
  * Mac notifications steals focus, check custom scripts to fix it
  * update yabairc, move unused scripts to bottom, clean everything which is not needed
  * why does hyper - w flash screen?
  * migrate notion page?
  * update this readme
  * update dotfiles script with skhd and yabai (+limelight?) stuff