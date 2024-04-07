{ inputs, lib, config, pkgs, ... }: 

{

  imports = [
    ./common/global
    ./common/optional/hyprland
    ./common/optional/plasma5
  ];

  home.packages = with pkgs; [ 
    nmap
  ];

}
