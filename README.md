# Rawhide Workstation

This is the set of roles I personally use to configure my Fedora Rawhide environment.

## What's included

This is intended to be a batteries included workstation. 

* Common Applications
    - tcpdump, ncat, nmap, telnet
    - openvpn
    - ffmpeg
    - Google Chrome
* Vanilla Kernel
    - Increases stability without sacrificing compabibility
* Neovim
    - Includes sensible defaults and plugins for yaml and python.
    - Config cloned from https://github.com/Smurf/nvim-config
* Snapshots (if using btrfs)
    - Uses snapper and grub-btrfs to dynamically update grub boot menu with bootable snapshots
* Development Tools
    - Development Tools group for access to make and other common compile tools.

## Basic Workstation sans Snapshots

First edit the `default_user` variable in `workstation.yml` to reflect the user to be configured.

Once the `default_user` is set run the `workstation.yml` playbook.

```
ansible-playbook workstation.yml --become --ask-become-pass
```

### DP Alt Mode and AX Wifi Fixes

This playbook contains some fixes for DP Alt mode issues with certain dock and CPU combos and connection stability issues on the Intel AX 200/210 series wifi chipsets.

#### Wifi Unstable

This can be fixed by disabling the power managment features on the AX200/210 cards. This is built into the `workstation.yml` playbook with the `axwifi` tag.

```
ansible-playbook workstation.yml --become --ask-become-pass --tags axwifi
```

#### Non-TB Docks not working

Some docks and laptop combos have issues with displayport MST making non-thunderbolt USB C docks not work. To run this fix use the `i915` tag with the `workstation.yml` playbook.

```
ansible-playbook workstation.yml --become --ask-become-pass --tags i915
```
