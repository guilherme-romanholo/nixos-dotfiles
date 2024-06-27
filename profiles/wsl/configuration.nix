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
    inputs.nixos-wsl.nixosModules.wsl
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

  system.stateVersion = "24.05";
}
