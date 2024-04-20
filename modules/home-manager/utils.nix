{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
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
