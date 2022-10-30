## How to install
## How to update nixos
sudo -i sh -c 'nix-channel --update && nix-env -iA nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'

Or rather:
Check that you're on the latest channel:
$ sudo nix-channel --list
nixos https://nixos.org/channels/nixos-20.09

$ sudo nix-channel --remove nixos
$ sudo nix-channel --add https://nixos.org/channels/nixos-21.11 nixos

Update:
$ sudo nix-channel --update

Rebuild:
$ sudo nixos-rebuild switch

## How to update homemanager

Just home-manager switch after above is done
