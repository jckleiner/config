#!/bin/sh

### See also:
# - https://github.com/geerlingguy/dotfiles/blob/master/.osx
# - https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# - https://macos-defaults.com/mission-control/mru-spaces.html#set-to-true-default-value

###############################################################################
# Keyboard Shortcuts                                                          #
###############################################################################

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

# Mission control > Show desktop (F1)
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
# Mission control > Show desktop (F1)
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

# Accessibility > Show accessibility controls: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:162:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
# Accessibility > Turn voice over on or off: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:59:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Mission control > Quick note: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:190:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Spotlight > Show finder search window: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:65:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Input sources > select previous input source: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:60:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Mission control > Mission Control: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:32:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:34:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Mission control > Application windows: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:33:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:35:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Mission control > Move left/right a space: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:80:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:82:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Display > increase/decrease display brightness: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:53:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:54:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:55:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:56:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# App Shortcuts > Show help menu: OFF
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:98:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist


###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
sudo nvram StartupMute=%01

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# System Prefs > Mission Control > disable "Automatically rearrange spaces"
defaults write com.apple.dock mru-spaces -bool false

# Use F keys as standard function keys. -g is needed
defaults write -g com.apple.keyboard.fnState -bool yes

# TODO Needs restart? Does not work even with restart
# https://github.com/sickcodes/osx-optimizer
sudo defaults write com.apple.Accessibility ReduceMotionEnabled -bool yes
sudo defaults write com.apple.universalaccess reduceMotion -int 1

# TODO - Keyboard layout
# Search for "Turkish"
# https://newbedev.com/change-osx-keyboard-layout-input-source-programmatically-via-terminal-or-applescript

# TODO - disable Service keyboard shorcut "Search manpage index..."


###############################################################################
# Screen                                                                      #
###############################################################################

# Save screenshots to Screenshots folder.
defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true


###############################################################################
# Finder                                                                      #
###############################################################################

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
# TODO does not work
defaults write com.apple.finder ShowPathBar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
# TODO needed?
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories
# TODO what is this?
# defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Set the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 34

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.15

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application icon
defaults write com.apple.dock minimize-to-application -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0


###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Don’t display the annoying prompt when quitting iTerm
# defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Install the Nice Dark theme for iTerm
open "${HOME}/config/dotfiles/iterm2/NiceDark.itermcolors"

###############################################################################
# Applications                                                                #
###############################################################################

# Itsycal
defaults write com.mowglii.ItsycalApp.plist ClockFormat -string "H:mm - EEEE, dd.MMMM"
defaults write com.mowglii.ItsycalApp.plist HideIcon -bool true
defaults write com.mowglii.ItsycalApp.plist HighlightedDOWs -int 65 # highligh Day Of Weeks (Saturday and Sunday)




# Ask the system to read the hotkey plist file and ignore the output. Likely updates an in-memory cache with the new plist values.
defaults read com.apple.symbolichotkeys.plist > /dev/null

# Run reactivateSettings to apply the updated settings.
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
