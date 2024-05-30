{
  config,
  libs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    thunderbird

    # Office suite for documents
    libreoffice-fresh
    obsidian

    # PDFs
    libsForQt5.okular

    pcmanfm

    paperwork
  ];
}
