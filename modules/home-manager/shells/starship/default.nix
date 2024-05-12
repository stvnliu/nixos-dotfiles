{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.shell.prompts.starship;
in
  with lib; {
    options = {
      shell.prompts.starship.enable = mkEnableOption "Enables starship prompts.";
      shell.prompts.starship.confPath = mkOption {
        type = types.path;
        default = ./presets/default.toml;
      };
    };
    config = {
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = builtins.fromTOML (builtins.readFile cfg.confPath);
      };
    };
  }
