{pkgs, ...}: {
  services.xserver = {
    enable = true;
    # 24.05 unstable
    dpi = 100;
    videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.
    displayManager = {
      sessionCommands = ''
        xset r rate 250 50
        ${pkgs.feh}/bin/feh --bg-scale ~/wallpaper.png
        ${pkgs.slstatus}/bin/slstatus &
        ibus start &
        mpris-proxy &
        udiskie &
      '';
    };
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
