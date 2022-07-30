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
    - By default the fn key (has a globe icon on the keyboard) opens the input source selection screen, which is super annoying
    - You can change that: "System Preferences > Keyboard > Keyboard > Press (Globe) to: Do Nothing"

For Laptop Keyboard (since the most left key is fn and not control):
  * fn -> left_control
  * left_control -> fn

### Config Changes
Changes saved in `karabiner.json` are immediately applied.
Also if you change something over the Karabiner GUI, it will also adjust the `karabiner.json`

### Event Viewer
You can also see keycodes and other usefull stuff with the build it Karabiner Event Viewer.
If Alfred can't find it, open it from the Applications folder. The next time Alfred will find it.

### Multiple keyboards (laptop and external)
You can set custom modifications for different devices. 
For instance having different mappings for a particular USB keyboard and others for your laptops keyboard.
To see which devices there are: `Karabiner-EventViewer > Devices`

I've configured different key mappings for my USB keyboard and the laptops keyboard:

My USB Keyboard:
  "product_id": 35,
  "vendor_id": 1130,
  "transport": "USB"

Macbook keyboard:
  "product_id": 834,
  "vendor_id": 1452

### F-Key bindings
System Preferences > Keyboard > Keyboard > Function Keys -> enable checkbox at bottom "use F1, F2, etc. keys as standard function keys"
When this option is selected, press the fn key to use the special features printed on each F key:
  - fn + F1   decrease brightness
  - fn + F2   increase brightness
  - ...
  - fn + F6   do not disturb (its buggy on m1 macs? does not work)
  - ...
  - fn + F10  mute
  - fn + F11  decrease volume
  - fn + F12  increase volume

### " and the <
The quote key " and the < key might also be switched. This could be fixed with:
  * System Preferences -> Keyboard -> Change Keyboard Type
If not then you also need to change it with KE.

### Link karabiner config
`ln -s ~/develop/personal/config/dotfiles/karabiner ~/.config/karabiner`

### Hyper Key
  * `hyper == lshift + lctrl + lalt + rcmd`

Capslock is used as the `hyper` (skhd) key, see `karabiner.json`:
  * pressed once: **Esc**
  * pressed with a another key: **lshift + lctrl + lalt + rcmd+ \<otherPressedKey\>**

skhd defines its own `hyper` keyword which is mapped to `shift + ctrl + alt + cmd`



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
  * fn + F1   decrease brightness
  * fn + F2   increase brightness
  * ...
  * fn + F6   do not disturb (its buggy on m1 macs? does not work)
  * ...
  * fn + F10  mute
  * fn + F11  decrease volume
  * fn + F12  increase volume

### TODO
  * minimize currently open app with karabiner elements? Hyper - x?
  * hyper + lcmd + b -> (new) Browser, needed?
  * another custom key: meh (shift + alt + ctrl)
  * ignore assets folder?
  * TODO fn + p -> Preferences
  * TODO fn + s -> System Preferences