{pkgs, ...}: {
  home.packages = (with pkgs; [
    (python3.withPackages (p: with p; [
      requests
      epc lxml
      pysocks
      pymupdf
      markdown
      matplotlib
      pandas
      numpy
      python-lsp-server
    ]))
  ]);
}
