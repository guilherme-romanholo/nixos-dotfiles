{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fonts.enable = lib.mkEnableOption "enable home fonts";
  };

  config = lib.mkIf config.fonts.enable {
    home.packages = with pkgs; [
      (nerdfonts.override {fonts = ["FiraCode"];})
    ];
  };
}
