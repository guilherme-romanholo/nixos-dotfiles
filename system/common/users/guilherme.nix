{ pkgs, config, ... }:

{ 

   users.users = {
    guilherme = {
      # Change with passwd
      initialPassword = "password";
      # User priv
      isNormalUser = true;
      # User groups
      extraGroups = [ "wheel" "networkmanager" ];
      # Default user shell
      shell = pkgs.zsh;
      # Add your SSH public key(s) here, if you plan on using SSH to connect
      openssh.authorizedKeys.keys = [ ];
    };
  };

  home-manager = {
    users = {
      guilherme = import ../../../home/${config.networking.hostName}.nix;
    };
  };

}
