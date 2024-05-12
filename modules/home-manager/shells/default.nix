{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.shells;
in
  with lib; {
    imports = [
      ./zsh.nix
      ./starship
    ];
    options.shells = {
      enable = mkEnableOption "Enables the shell customisation module.";
      useZsh = mkOption {
        type = types.bool;
        default = true;
      };
    };
    config = mkIf cfg.enable {
      shell = {
        zsh.enable = cfg.useZsh;
        prompts.starship.enable = true;
      };
    };
  }
