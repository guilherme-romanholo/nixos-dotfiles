{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.wsl
    outputs.nixosModules.common
    outputs.nixosModules.desktops
    outputs.nixosModules.optional
    outputs.nixosModules.hardware
  ];

  # --- Common Modules --- #
  common.enable = true;

  wsl = {
    enable = true;
    defaultUser = userSettings.username;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    startMenuLaunchers = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
  ];

  system.stateVersion = "24.05";
}
