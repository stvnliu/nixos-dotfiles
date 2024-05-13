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
}
