{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    outputs.nixosModules.common
    outputs.nixosModules.desktops
    outputs.nixosModules.optional
    outputs.nixosModules.hardware
  ];

  # --- Common Modules --- #
  common.enable = true;

  # --- Desktops --- #
  gnome.enable = true;

  # --- Optional --- #
  docker.enable = true;
  libvirt.enable = true;
  printer.enable = true;

  # --- Hardware --- #
  uefi.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
  ];

  system.stateVersion = "24.05";
}
