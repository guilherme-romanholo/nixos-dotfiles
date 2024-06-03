{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    openssh.enable = lib.mkEnableOption "enable openssh";
  };

  config = lib.mkIf config.openssh.enable {
    # This setups a SSH server. Very important if you're setting up a headless system.
    # Feel free to remove if you don't need it.
    services.openssh = {
      enable = true;
      settings = {
        # Forbid root login through SSH.
        PermitRootLogin = "no";
        # Use keys only. Remove if you want to SSH using password (not recommended)
        PasswordAuthentication = true;
      };
    };
  };
}
