{
  outputs,
  lib,
  config,
  userSettings,
  ...
}: {
  options = {
    git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = userSettings.gituser;
      userEmail = userSettings.email;
    };
  };
}
