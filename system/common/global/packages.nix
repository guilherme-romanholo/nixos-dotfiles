
{ pkgs, ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    firefox
    git
    gcc
  ];

  programs.zsh.enable = true;

}
