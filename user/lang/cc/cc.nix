{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # CC
      gcc
      gnumake
      cmake
      autoconf
      automake
      libtool
      rocmPackages.llvm.clang-tools-extra
  ];
}
