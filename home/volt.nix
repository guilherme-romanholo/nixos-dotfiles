{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.common
    outputs.homeManagerModules.optional
  ];

  # --- Common --- #
  common.enable = true;

  # --- Optional --- # 

  home.packages = with pkgs; [neofetch firefox];

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
