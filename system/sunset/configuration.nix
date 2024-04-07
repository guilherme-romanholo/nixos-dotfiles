{ inputs, outputs, lib, config, pkgs, ... }:

{
  networking.hostName = "sunset"; 

  imports =
    [ 
      # Hardware configuration
      ./hardware-configuration.nix
      # Global configs
      ../common/global
      # Optional 
      ../common/optional/cups.nix
      ../common/optional/hyprland.nix
      ../common/optional/virtualization.nix
      ../common/optional/docker.nix
      # System settings
      ../common/settings
      # User
      ../common/users/guilherme.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "23.11";

}
