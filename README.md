<h1>Rawhide Workstation</h1>

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
* Snapshots (if using btrfs)
    - Uses snapper and grub-btrfs to dynamically update grub boot menu with bootable snapshots
* Development Tools
    - Development Tools group for access to make and other common compile tools.

## Basic Workstation sans Snapshots

To setup a workstation without snapshots run the `workstation.yml` playbook.

```
ansible-playbook workstation.yml --become --ask-become-pass
```

## Configuring Snapshots (BTRFS required)

> **NOTE:** Currently this is configured for a 500GB (**not** GiB) drive ala Samsung Evo 850. Please edit the `qgroups` role to suit your drive.

Once confident qgroups are configured properly to configure snapshots run the `snapshot-setup.yml` playbook.

```
ansible-playbook snapshot-setup.yml --become --ask-become-pass
```

### Intel 11th Gen Xe and AX Wifi Fixes

This playbook contains some fixes for the 11th gen Intel laptop CPUs with Xe graphics or AX 200/210 series wifi chipsets.

#### Wifi Unstable

This can be fixed by disabling the power managment features on the AX200/210 cards. This is built into the `workstation.yml` playbook with the `axwifi` tag.

```
ansible-playbook workstation.yml --become --ask-become-pass --tags axwifi
```

#### Non-TB Docks not working

The Intel Xe graphics on the 11th gen laptop CPUs has issues with displayport MST making non-thunderbolt USB C docks not work. To run this fix use the `i915` tag with the `workstation.yml` playbook.

```
ansible-playbook workstation.yml --become --ask-become-pass --tags i915
```
