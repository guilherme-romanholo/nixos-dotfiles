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
  ];

  common.enable = true;

  home.packages = with pkgs; [neofetch];

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
