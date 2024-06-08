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
  docker.enable = true;
  libvirt.enable = true;
  printer.enable = true;

  # --- Bootloader --- #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = "24.05";
}
