{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./nixvim
    ./vscode.nix
  ];
}
