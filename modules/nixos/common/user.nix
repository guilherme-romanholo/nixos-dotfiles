{
  lib,
  pkgs,
  config,
  userSettings,
  ...
}: {
  options = {
    user.enable = lib.mkEnableOption "enable user";
  };

  config = lib.mkIf config.user.enable {
    # System users
    users.users = {
      ${userSettings.username} = {
        initialPassword = "password";
        isNormalUser = true;
        # User groups
        extraGroups = ["wheel"];
        # Default shell
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
        # Add your SSH public key(s) here, if you plan on using SSH to connect
        openssh.authorizedKeys.keys = [];
      };
    };
  };
}
