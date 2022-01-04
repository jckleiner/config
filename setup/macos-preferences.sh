#!/bin/sh

### See also:
# - https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# - https://macos-defaults.com/mission-control/mru-spaces.html#set-to-true-default-value

# Mission control > switch to desktop 1: CMD+1
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 118 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>49</integer>
        <integer>18</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Mission control > switch to desktop 2: CMD+2
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 119 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>50</integer>
        <integer>19</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Mission control > switch to desktop 3: CMD+3
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 120 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>51</integer>
        <integer>20</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Mission control > switch to desktop 4: CMD+4
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 121 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>52</integer>
        <integer>21</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Mission control > switch to desktop 5: CMD+5
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 122 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>53</integer>
        <integer>22</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Mission control > switch to desktop 6: CMD+6
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 123 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>54</integer>
        <integer>23</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Mission control > switch to desktop 7: CMD+"
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 124 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>34</integer>
        <integer>18</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Input sources > select next source in input menu: Shift+CMD+Space
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 61 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>32</integer>
        <integer>49</integer>
        <integer>1179648</integer>
      </array>
    </dict>
  </dict>
"

# Show desktop (F1)
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 36 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>122</integer>
        <integer>8388608</integer>
      </array>
    </dict>
  </dict>
"
# Show desktop (F1)
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 37 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>122</integer>
        <integer>8519680</integer>
      </array>
    </dict>
  </dict>
"

# Accessibility > Show accessibility controls: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:162:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
# Accessibility > Turn voice over on or off: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:59:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Quick note: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:190:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Spotlight > Show finder search window: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:65:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Input sources > select previous input source: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:60:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Mission Control: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:32:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:34:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Application windows: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:33:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:35:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Mission control -> Move left/right a space: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:80:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:82:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Display -> increase/decrease display brightness: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:53:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:54:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:55:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:56:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# App Shortcuts -> Show help menu: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:98:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# TODO Needs restart? Does not work even with restart
# https://github.com/sickcodes/osx-optimizer
defaults write com.apple.Accessibility ReduceMotionEnabled -bool yes

# Use F keys as standard function keys. -g is needed
defaults write -g com.apple.keyboard.fnState -bool yes

# TODO disable spotlight indexing?
# https://github.com/sickcodes/osx-optimizer

# TODO - put screenshots into folder

# TODO - Keyboard layout
# Search for "Turkish"
# https://newbedev.com/change-osx-keyboard-layout-input-source-programmatically-via-terminal-or-applescript

# System Prefs > Mission Control > disable "Automatically rearrange spaces"
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock

# Ask the system to read the hotkey plist file and ignore the output. Likely updates an in-memory cache with the new plist values.
defaults read com.apple.symbolichotkeys.plist > /dev/null

# TODO - Disable the Option-Space key combination for non-breaking spaces, with karabiner

# TODO - disable Service keyboard shorcut "Search manpage index..."

# Run reactivateSettings to apply the updated settings.
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u


# TODO - git email and user config
# git config --global user.name "John Doe"
# git config --global user.email johndoe@example.com