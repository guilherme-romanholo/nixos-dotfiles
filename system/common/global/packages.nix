
{ pkgs, ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    firefox
    git
    libsForQt5.qt5.qtgraphicaleffects
  ];

  programs.zsh.enable = true;

}
