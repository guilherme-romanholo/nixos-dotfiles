{ inputs, ... }:


let
  gruvbox-theme = {
     slug = "gruvbox-dark";
     name = "Gruvbox Dark";
     palette = {
       base00 = "282828"; # ----
       base01 = "3c3836"; # ---
       base02 = "504945"; # --
       base03 = "665c54"; # -
       base04 = "bdae93"; # +
       base05 = "d5c4a1"; # ++
       base06 = "ebdbb2"; # +++
       base07 = "fbf1c7"; # ++++
       base08 = "fb4934"; # red
       base09 = "fe8019"; # orange
       base0A = "fabd2f"; # yellow
       base0B = "b8bb26"; # green
       base0C = "8ec07c"; # aqua/cyan
       base0D = "83a598"; # blue
       base0E = "d3869b"; # purple
       base0F = "d65d0e"; # brown
     };
   };
  dracula = {
     slug = "dracula";
     name = "Dracula";
     palette = {
       base00 = "282936"; #background
       base01 = "3a3c4e";
       base02 = "4d4f68";
       base03 = "626483";
       base04 = "62d6e8";
       base05 = "e9e9f4"; #foreground
       base06 = "f1f2f8";
       base07 = "f7f7fb";
       base08 = "ea51b2";
       base09 = "b45bcf";
       base0A = "00f769";
       base0B = "ebff87";
       base0C = "a1efe4";
       base0D = "62d6e8";
       base0E = "b45bcf";
       base0F = "00f769";
     };
   };
in
{

  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = gruvbox-theme;

}
