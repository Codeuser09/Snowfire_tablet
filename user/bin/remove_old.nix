{ pkgs, userSettings, ... }:

let
  myRemoveOldScript = ''
  #!/usr/bin/env bash

  sudo nix-collect-garbage -d
  sudo /run/current-system/bin/switch-to-configuration boot
  '';
in
{
  home.packages = [
    (pkgs.writeScriptBin "remove_old" myRemoveOldScript)
  ];
}
