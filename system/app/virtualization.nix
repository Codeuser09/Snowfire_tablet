{ config, pkgs, lib, ... }:

{
  lib.virtualisation.libvirtd.enable = true;
  lib.programs.dconf.enable = true; # virt-manager requires dconf to remember settings
  lib.environment.systemPackages = with pkgs; [ virt-manager ];
}
