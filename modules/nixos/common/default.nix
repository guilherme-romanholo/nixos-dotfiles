{lib, ...}:
{
  imports = [
    ./localtime.nix
    ./nixconf.nix
    ./homemanager.nix
    ./user.nix
    ./audio.nix
  ];
  
  localtime.enable = lib.mkDefault true;
  nixconf.enable = lib.mkDefault true;
  homemanager.enable = lib.mkDefault true;
  user.enable = lib.mkDefault true;
  audio.enable = lib.mkDefault true;
}
