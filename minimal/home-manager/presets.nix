{config, lib, pkgs, ...}: {
    options = {
        presets.enable = lib.mkEnableOption "Enable package presets module";
        presets.presetName = lib.mkOption {
            default = "full";
            description = ''
                Name of desired preset.
                Must be one of the following:
                - full (default)
                    - imports everything under ./packages/
                - minimal
                    - imports only wm-components.nix and utils.nix
            '';
        };
    };
    config = lib.mkIf config.presets.enable {
        lib.mkIf (config.presets.presetName == "full") {
            imports = [
                ./packages/communications.nix
                ./packages/games.nix
                ./packages/misc.nix
                ./packages/multimedia.nix
                ./packages/office.nix
                ./packages/tex.nix
                ./packages/utils.nix
                ./packages/wm-components.nix
            ];
        };
        lib.mkIf (config.presets.presetName == "minimal") {
            imports = [
                ./packages/utils.nix
                ./packages/wm-components.nix
            ];
        };
    }
}