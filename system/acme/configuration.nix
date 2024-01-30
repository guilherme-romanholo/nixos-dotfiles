# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      guilherme = import ../../home/acme/home.nix;
    };
  };

  networking.hostName = "taz-workstation"; # Define your hostname.

  system.stateVersion = "23.11"; # Did you read the comment?

}
