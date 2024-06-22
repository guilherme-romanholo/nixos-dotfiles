{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    outputs.nixosModules.common
    outputs.nixosModules.desktops
    outputs.nixosModules.optional
  ];

  # --- Common Modules --- #
  common.enable = true;

  # --- Desktops --- #
  gnome.enable = true;

  # --- Optional --- #
  printer.enable = true;

  # --- Bootloader --- #
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = "24.05";
}
