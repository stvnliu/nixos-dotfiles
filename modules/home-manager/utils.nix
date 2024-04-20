{config, libs, pkgs, ...}:
{
	home.packages = with pkgs; [
		tree
		# helpers: wget and lshw
		wget
		lshw

		# file browser and volume
		#ranger
		mc
		pamixer
		hello # hello world NixOS test
		#stow # dotfiles configuration
		fzf # fuzzy finder cli

		gparted
		udiskie
		gimp

		flameshot

		htop
		bat
		eza

		trash-cli
		xclip

		xlockmore
	];
}
