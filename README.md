### NixOS Dotfiles Refactor with Modules

#### Features to add
- AwesomeWM
- Rofi
- GTKLock
- Mpd and Ncmpcpp
- Sops
- Impermanence
- Disko
- Devenv

#### How to install?

1) Install NixOS from [oficial site](https://nixos.org/download/)
2) Make a shell with git: `nix-shell -p git`
3) Clone this repo into .dotfiles (in your home): `git clone https://github.com/guilherme-romanholo/nixos-dotfiles.git .dotfiles`
4) Create yout hardware configuration: `nixos-generate-config --show-hardware-configuration > .dotfiles/modules/nixos/hardware/hardware-configuration.nix`
5) Edit flake.nix user and system settings
6) Enter .dotfiles and rebuild system: `sudo nixos-rebuild boot --flake .#your-hostname`
7) Reboot your machine

