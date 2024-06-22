{
  outputs,
  lib,
  config,
  userSettings,
  ...
}: {
  options = {
    homeconf.enable = lib.mkEnableOption "enable home configs";
  };

  config = lib.mkIf config.homeconf.enable {
    home = {
      username = userSettings.username;
      homeDirectory = "/home/${userSettings.username}";
    };
  };
}
