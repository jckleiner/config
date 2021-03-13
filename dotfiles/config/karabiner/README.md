# Karabiner

Install Karabiner Elements (requires password)
  * brew install --cask karabiner-elements
After the installation, open it, it might not be visible with Alfred, so just use the command line.

Accept and give all permissions which it asks for.
This will probably change the keyboard layout. For instance on a standard Windows keyboard, KE will map CMD to the Windows button,
so to use the ALT key next to the space as the CMD key, you need to create the following simple modifications in KE:
  * left_option -> left_command 
  * left_command -> left_option

The quote key " and the < key might also be switched. This could be fixed with:
  * System Preferences -> Keyboard -> Change Keyboard Type
If not then you also need to change it with KE.

**link karabiner config**
ln -s ~/develop/personal/config/dotfiles/config/karabiner ~/.config/karabiner

### Hyper Key
Capslock is used as the `hyper` key:
  * pressed once: **Esc**
  * pressed with a another key: **SHIFT+CTRL+OPTION+CMD+ \<otherPressedKey\>**

Not sure why `hyper` works in skhd, where is that word defined?

### Keycastr
To see which keys you pressed:
  * brew install --cask keycastr

### TODO
  * ignore automatic_backups and assets?
  * open terminal with 2 ctrl
  * open programs, maybe not with o but mapping right_cmd to f18 and using that to open programs?
    * f18 + c -> VsCode
    * TODO f18 + p -> Preferences
    * TODO f18 + s -> System Preferences
    * f18 + b -> Browser
    * f18 + f -> Finder
    * f18 + t -> teams
    * f18 + w -> Word
    * f18 + p -> Postman
    * f18 + k -> KeePass Client (KeePassXc)
    * f18 + d -> Database Client (DBeaver)
    * f18 + m -> Mail Client
    * f18 + i -> IDE (IntelliJ)
    * f18 + v -> VPN Client
    * f18 + g -> Git Client (Sourcetree)