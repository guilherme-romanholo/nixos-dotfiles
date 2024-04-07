# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: 

{

  imports = [
    ./common/global
    ./common/optional/hyprland
    ./common/optional/plasma5
    ./common/optional/vscode.nix
  ];

  home.packages = with pkgs; [ 
    discord 
  ];

}
