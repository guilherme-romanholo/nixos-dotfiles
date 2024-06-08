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
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    outputs.nixosModules.common
    outputs.nixosModules.desktops
    outputs.nixosModules.optional
  ];

  wsl = {
    enable = true;
    defaultUser = userSettings.username;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    startMenuLaunchers = true;
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = "24.05";
}
