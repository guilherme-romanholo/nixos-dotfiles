{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    outputs.nixosModules.common
    outputs.nixosModules.gnome
  ];

  # Enable gnome module
  gnome.enable = true;

  # Config hostname
  networking.hostName = systemSettings.hostname;

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = "23.11";
}
