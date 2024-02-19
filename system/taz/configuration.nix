# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, outputs, lib, config, pkgs, ... }:

{
  networking.hostName = "taz"; 

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/global
      ../common/optional/openssh.nix
      ../common/optional/hyprland.nix
      ../common/optional/xserver.nix
      ../common/optional/docker.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  system.stateVersion = "23.11"; # Did you read the comment?

}
