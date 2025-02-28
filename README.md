# Dotfiles
This readme has long been neglected, and is now a work in progress. 

## Nix + home-manager
To apply changes, run `home-manager switch`. 

### Packages not managed by HomeManager
- Docker - installed system wide for NixOS, and as a graphical service for macOS. 

## NixOS
NixOS configuration resides in the `nixos` folder.
To apply changes, run `sudo nixos-rebuild switch`. 

### Note to self next time NixOS UEFI boot entry breaks:
1. Run rEFInd from a live USB to boot into the installation.
2. Run `sudo nixos-rebuild --install-bootloader boot`. 

## Other dotfiles
- zsh - dotfile linked by home-manager.
- NeoVIM - plugins handled by plug. Linked by home-manager.
- Tmux - no pure dotfile here since I want home-manager to handle plugins. "extraConfig" in `nix/tmux.nix` reads like a tmux dotfile though.
- Git - dotfile linked by home-manager.
- Kitty - dotfile linked by home-manager.
- pgcli - dotfile linked by home-manager.
