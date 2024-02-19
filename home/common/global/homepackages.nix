{ pkgs, ... }:

{

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [ 
    neovim
    neofetch
    duf
    ripgrep
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    swaybg
    ngrok
    webcord
    kdiskmark
  ];

}
