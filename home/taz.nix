# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: 

{
  # Search for home.file

  # You can import other home-manager modules here
  imports = [
    ./common/global
    ./common/optional/hyprland
  ];

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [ 
    nmap
  ];

}
