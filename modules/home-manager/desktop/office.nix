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
    libreoffice
    obsidian

    # PDFs
    libsForQt5.okular

    pcmanfm

    paperwork
  ];
}
