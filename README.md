# Setup MacOs With Ansible

> A lot of the stuff here is taken from the great "Red Shirt Jeff"s Repository: https://github.com/geerlingguy/mac-dev-playbook


 1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).

 2. Install Ansible:
    TODO /opt/homebrew/bin not needed in path?
    a) Run the following command to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"`

    b) Upgrade Pip and install Ansible: sudo `pip3 install --upgrade pip && pip3 install ansible`

 3. Clone this repository to your home folder: `cd ~ && git clone https://github.com/jckleiner/config.git`

 4. TODO add your password to the playbook for casks. `nano ~/config/setup/macos-ansible/roles/homebrew/defaults/main.yml` 
    and add your password to `ansible_become_password`

 5. Run: `cd ~/config/setup/macos-ansible && ansible-playbook -v --ask-become-pass setup.yml`
    * `-v` to get more information from the commands
    * `--ask-become-pass` asks your password once

