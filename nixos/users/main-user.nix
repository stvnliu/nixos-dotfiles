{lib, config, pkgs, ...}:
{
    options = {
        main-user.enable = lib.mkEnableOption "Enable user module";
        main-user.userName = lib.mkOption {
            default = "zhonghengl";
            description = ''
                Username
            '';
        };
    };
    config = lib.mkIf config.main-user.enable {
        programs.zsh.enable = true;
	users.users.${config.main-user.userName} = {
            isNormalUser = true;
            initialPassword = "070124.Lzh";
            description = "Main user";
            home = "/home/${config.main-user.userName}";
            extraGroups = ["networkmanager" "wheel" "lp"];
            shell = pkgs.zsh;
        };
    };

}
