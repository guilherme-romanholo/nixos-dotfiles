{
  outputs,
  lib,
  config,
  pkgs,
  userSettings,
  ...
}: {
  options = {
    zsh.enable = lib.mkEnableOption "enable zsh";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      bat
    ];

    programs.eza = {
      enable = true;
      icons = true;
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    home.sessionVariables.DIRENV_LOG_FORMAT = "";

    programs.zsh = {
      enable = true;
      autocd = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }

        {
          name = "powerlevel10k-config";
          src = ./.;
          file = "p10k.zsh";
        }
      ];

      shellAliases = {
        nixos-switch = "sudo nixos-rebuild switch --flake ~/.dotfiles";
        dots = "z ~/.dotfiles";
        cat = "bat --theme=gruvbox-dark";
        cd = "z";
        vim = "nvim";
        gs = "git status";
      };
    };
  };
}
