{
  config,
  libs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # System flair and random stuff
    neofetch
    lolcat
    cmatrix

    android-file-transfer
    qbittorrent
    protonvpn-cli

    auto-cpufreq
    lxappearance
  ];
}
