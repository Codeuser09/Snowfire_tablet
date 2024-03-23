{ pkgs, ... }:

{
  # Python packages
  home.packages = with pkgs.python3Packages; [
      pandas
      numpy
      matplotlib
      #tensorflow #maybe later
      distro
      pip
  ];
}
