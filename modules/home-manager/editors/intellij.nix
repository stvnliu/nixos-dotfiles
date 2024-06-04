{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    jetbrains.idea-community-bin
  ];
}
