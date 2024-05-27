# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  pkgs,
  lib,
  config,
  ...
}: {
  # List your module files here
  # my-module = import ./my-module.nix;
  imports = [
    ./fonts.nix
    ./grub.nix
    ./nvidia.nix
    ./sddm.nix
    ./utils.nix
    ./steam.nix
    ./i18n.nix
    ./xorg.nix
    ./nix-ld.nix
    ./services
    ./wm
  ];
  nvidiaModule = {
    enable = lib.mkDefault true;
    usePowersave = lib.mkDefault true;
  };
  steamModule = {
    enable = lib.mkDefault true;
    openFirewalls = lib.mkDefault true;
  };
}
