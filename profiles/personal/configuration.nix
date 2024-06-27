{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../general
    outputs.nixosModules.desktops
    outputs.nixosModules.optional
  ];

  # --- Desktops --- #
  gnome.enable = true;

  # --- Optional --- #
  printer.enable = true;

  system.stateVersion = "24.05";
}
