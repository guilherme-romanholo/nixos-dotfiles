{ pkgs, ... }:

{

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [ 
    neovim
    kitty
    neofetch
  ];

}
