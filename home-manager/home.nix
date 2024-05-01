{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "test";
    homeDirectory = "/home/test";
  };

  home.packages = with pkgs; [ neofetch firefox ];

  programs.git = {
    enable = true;
    userName = "guilherme-romanholo";
    userEmail = "guilhermeromanholobofo@gmail.com";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
