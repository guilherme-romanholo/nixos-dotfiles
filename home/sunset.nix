# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: 

{

  # You can import other home-manager modules here
  imports = [
    ./common
  ];

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [ 
    discord 
  ];

}
