{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.editors.vscode;
in {
  options.editors = {
    vscode.enable = lib.mkEnableOption "Enables vscode support with extensions";
  };
  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };
}
