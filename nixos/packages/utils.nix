{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		# Editors: vim and nvim
		neovim

		# helpers: wget and lshw
		wget
		lshw

		# file browser and volume
		#ranger
		mc
		pavucontrol
		hello # hello world NixOS test
		stow # dotfiles configuration
		fzf # fuzzy finder cli
		zoxide # fuzzy cd replacement

		gparted
		gimp

		flameshot

		htop
		bat
		eza
	];
}
