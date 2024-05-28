{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./vscode.nix
  ];
  programs.nixvim = import ./nixvim;
  home.packages = with pkgs; [ripgrep fd];
}
