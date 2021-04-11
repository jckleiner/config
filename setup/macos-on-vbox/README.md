# Install MacOs X on Vbox

## Requirements

* Virtualbox should be already installed

Get the main installation script from https://github.com/myspaghetti/macos-virtualbox.
This script creates a macOS virtual machine guest on VirtualBox with unmodified macOS installation files downloaded directly from Apple servers.

Works on macOS, CentOS 7, and Windows. Should work on most modern Linux distros.

* run `./macos-guest-virtualbox.sh`

This will download many files to the working directory. You will also be asked to press enter in certain parts of the installation.

Make sure the following packages are installed and that their path is in the PATH variable:

> bash coreutils dmg2img gzip unzip wget xxd virtualbox


## If Something Fails
Delete the `~/Virtualbox/MacOs` files and start the script again. Say `yes` when the script asks if it should delete certain vbox files.


## After the Successful Installation
Setup the OS (language, keyboard preferences etc.).

Remove temporary files: `./macos-guest-virtualbox.sh prompt_delete_temporary_files`. This will delete most of the downloaded files.


## MacOs Specific Things

* `brew install coreutils`
* `brew install dmg2img`
* `brew install wget`

### Use GNU gzip instead of Apple gzip
Apple gzip was already installed on the system. But the script requires GNU gzip to be in PATH. 

1. `brew install gzip` This will install GNU gzip to BREW-Cellar.
2. Update PATH `sudo nano /etc/paths` and add the path to the GNU gzip at the top of the file
