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

  system.stateVersion = "23.11";
}
