{config, lib, pkgs}:{
    home.packages = with pkgs; [
        fzf
        zoxide
        gimp
        flameshot
        htop
        bat
        eza
    ];
}