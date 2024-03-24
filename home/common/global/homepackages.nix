{ pkgs, ... }:

{

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [ 
    neofetch
    duf
    ripgrep
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    swaybg
    ngrok
    webcord
  ];

}
