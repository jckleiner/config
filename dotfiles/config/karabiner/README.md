# Karabiner

Install Karabiner Elements (requires password)
  * brew install --cask karabiner-elements
After the installation, open it, it might not be visible with Alfred, so just use the command line.

Accept and give all permissions which it asks for.
This will probably change the keyboard layout. For instance on a standard Windows keyboard, KE will map CMD to the Windows button,
so to use the ALT key next to the space as the CMD key, you need to create the following simple modifications in KE:
  * left_option -> left_command
  * left_command -> left_option
  * right_option -> right_command
  * right_command -> fn

### F bindings
Function Keys -> enable checkbox at bottom "use all F keys for..."

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

### Event Viewer
You can also see keycodes and other usefull stuff with the build it Karabiner Event Viewer.
If Alfred can't find it, open it from the Applications folder. The next time Alfred will find it.

### Keycastr
To see which keys you pressed:
  * brew install --cask keycastr

### Shortcuts for opening programs
I use fn because it is considered a "modifier key" in KE and will not clash with other shortcuts from other apps.
  * TODO fn + p -> Preferences
  * TODO fn + s -> System Preferences
  * fn + c -> VsCode
  * fn + b -> Browser
  * fn + f -> Finder
  * fn + t -> Teams
  * fn + w -> Word
  * fn + p -> Postman
  * fn + k -> KeePass Client (KeePassXc)
  * fn + d -> Database Client (DBeaver)
  * fn + m -> Mail Client
  * fn + i -> IDE (IntelliJ)
  * fn + v -> VPN Client
  * fn + g -> Git Client (Sourcetree)

  * CTRLx2 -> Terminal


### TODO
  * ignore assets folder?
  * open terminal with 2 ctrl