{config, pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		wget
		firefox
		dmenu
		st
		neofetch
		lshw
		libreoffice
		ranger
		pavucontrol
		vscode-with-extensions
		(where-is-my-sddm-theme.override {
		 themeConfig.General = {
		 background = "./login.jpg";
		 backgroundMode = "fill";
		 };
		 })
		neovim
		hello
        	stow
		fzf
		zoxide
	];
}
