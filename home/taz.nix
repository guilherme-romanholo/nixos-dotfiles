{ inputs, lib, config, pkgs, ... }: 

{

  imports = [
    ./common/global
    ./common/optional/hyprland
  ];

  home.packages = with pkgs; [ 
    nmap
  ];

}
