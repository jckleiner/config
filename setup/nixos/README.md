## NixOs

### Installation

Using the nixos-plasma iso, after we booted into the system we need to partition out drive using `gparted`.
1. Open gparted -> right click on drive -> create new partition table -> `msdos` for BIOS, probably `gpt` for UEFI but check it again
2. Right click partition -> new -> Create as: "Primary partition", File System: "linux-swap", label: "swap", adjust size: 2 GB (for a 20 GB drirve)
2. Right click the unallocated partition -> new -> Create as: "Primary partition", File System: "ext4", label: "msdos"
3. Make partition bootable: click apply changes (green tick at the top), right click ext4 -> Manage Flags -> set `boot` flag
4. `sudo mount /dev/disk/by-label/msdos /mnt`
5. Generate a config file: `sudo nixos-generate-config --root /mnt`
6. Edit the config file: `sudo nano /mnt/etc/nixos/configuration.nix`
7. `sudo nixos-install`
8. If on a VirtualBox VM: power of the VM -> settings -> drive -> remove nixos optical boot drive
9. Rebuild the system after changing the config file: `sudo nixos-rebuild switch`


### Configuration 
  - TODO

### TODOs 
  - bspwm (and sxhkd), polybar, dmenu install/config on nixos