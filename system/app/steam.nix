{ pkgs, lib, config, ... }:

{
#  hardware.opengl.driSupport32Bit = true;

#  programs.steam = {
#  enable = true;
#  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
#  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#  };
#  environment.systemPackages = [ pkgs.steam ];
}
