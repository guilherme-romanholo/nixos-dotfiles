{ config, ... }:

{

  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" ];
  };

}
