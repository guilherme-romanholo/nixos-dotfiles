{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
  ];

  programs.eza = {
    enable = true;
    icons = true;
    enableAliases = true;
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
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }

      {
        name = "powerlevel10k-config";
        src = ../files/p10k_conf;
        file = "p10k.zsh";
      }
    ];

    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      dots = "z ~/.dotfiles";
      cat = "bat";
      cd = "z";
      vim = "nvim";
    };
  };

}
