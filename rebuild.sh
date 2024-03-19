sudo nixos-rebuild switch --flake ~/.dotfiles#system

nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles#user
