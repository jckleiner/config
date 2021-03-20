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
  * right_command -> fn (fn is used because it is a modifier key and we need a modifier key for other stuff in this config)

### F bindings
Function Keys -> enable checkbox at bottom "use all F keys for..."

The quote key " and the < key might also be switched. This could be fixed with:
  * System Preferences -> Keyboard -> Change Keyboard Type
If not then you also need to change it with KE.

**link karabiner config**
ln -s ~/develop/personal/config/dotfiles/config/karabiner ~/.config/karabiner

### Hyper Key
  
  * `hyper == lshift + lctrl + lalt + lcmd`

Capslock is used as the `hyper` key, see `karabiner.json`:
  * pressed once: **Esc**
  * pressed with a another key: **lshift + lctrl + lalt + lcmd+ \<otherPressedKey\>**

skhd defines the `hyper` keyword which is mapped to `lshift + lctrl + lalt + lcmd`

### Event Viewer
You can also see keycodes and other usefull stuff with the build it Karabiner Event Viewer.
If Alfred can't find it, open it from the Applications folder. The next time Alfred will find it.

### Keycastr
To see which keys you pressed:
  * brew install --cask keycastr

### Shortcuts for opening programs
I use fn because it is considered a "modifier key" in KE and will not clash with other shortcuts from other apps. As far as I know a regular key like f18 can't be used as a modifier key.
  * Double tap left CTRL -> Iterm2
  * hyper + b -> Browser (new window)
  * hyper + t -> Teams (current instance, if exists)
  * fn + c -> VsCode
  * fn + f -> Finder
  * fn + w -> Word
  * fn + p -> Postman
  * fn + k -> KeePass Client (KeePassXc)
  * fn + d -> Database Client (DBeaver)
  * fn + m -> Mail Client
  * fn + j -> IDE (IntelliJ)
  * fn + v -> VPN Client
  * fn + g -> Git Client (Sourcetree)

### TODO
  * minimize currently open app with karabiner elements?
  * hyper + lcmd + b -> (new) Browser, needed?
  * update README when hyper key changes to use rcmd
  * another custom key: meh (shift + alt + ctrl)
  * ignore assets folder?
  * TODO fn + p -> Preferences
  * TODO fn + s -> System Preferences