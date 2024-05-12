{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
  services.displayManager.sddm = {
    enable = true;
    theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
  };
}
