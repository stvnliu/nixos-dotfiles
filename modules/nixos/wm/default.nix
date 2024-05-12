{lib, ...}: {
  imports = [./dwm/default.nix];
  dwm.enable = lib.mkDefault true;
}
