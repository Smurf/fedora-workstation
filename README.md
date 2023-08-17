# Rawhide Workstation

This is the set of roles I personally use to configure my Fedora Rawhide environment.

## What's included

This is intended to be a batteries included workstation. 

* Common Applications
    - tcpdump, ncat, nmap, telnet
    - rsyslog
    - openvpn
    - ffmpeg
    - Google Chrome
* Neovim
    - Includes sensible defaults and plugins for yaml and python.
    - Config cloned from https://github.com/Smurf/nvim-config
* Development Tools
    - Development Tools group for access to make and other common compile tools.

## Via ansible-pull

```
ansible-pull -d /etc/local/ansible -C f38-minimal-release -U https://github.com/Smurf/fedora-workstation.git
```

## Via ansible-playbook

Run the ansible-playbook locally
```
ansible-playbook local.yml --become --ask-become-pass
```

### Intel AX Wifi Fixes

This playbook contains some fixes for connection stability issues on the Intel AX 200/210 series wifi chipsets.

This can be fixed by disabling the power managment features on the AX200/210 cards. This is built into the `workstation.yml` playbook with the `axwifi` tag.

```
ansible-playbook local.yml --become --ask-become-pass --tags axwifi
```
