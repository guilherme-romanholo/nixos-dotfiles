{

  programs.zsh = {
    enable = true;
    autocd = true;

    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
  };

}
