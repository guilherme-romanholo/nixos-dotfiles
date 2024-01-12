### Geração da configuração de hardware

- sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix

### Atualizando a configuração atual

- sudo nixos-rebuild switch --flake .
