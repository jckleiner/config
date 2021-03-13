# Karabiner

Install Karabiner Elements (requires password)
  * brew install --cask karabiner-elements
After the installation, open it, it might not be visible with Alfred, so just use the command line.

Accept and give all permissions which it asks for.
This will probably change the keyboard layout. For instance on a standard Windows keyboard, KE will map CMD to the Windows button,
so to use the ALT key next to the space as the CMD key, you need to create 2 simple modifications in KE. 
  * left_option -> left_command 
  * left_command -> left_option

The quote key " and the < key might also be switched. This could be fixed with:
  * System Preferences -> Keyboard -> Change Keyboard Type
If not then you also need to change it with KE.

**link karabiner config**
ln -s ~/develop/personal/config/dotfiles/config/karabiner ~/.config/karabiner



**TODO**
  * ignore automatic_backups?