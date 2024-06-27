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
  printer.enable = true;

  # --- Hardware --- #
  grub.enable = true;
  grub.disk = "/dev/vda";

  environment.systemPackages = with pkgs; [
    neovim
  ];

  system.stateVersion = "24.05";
}
