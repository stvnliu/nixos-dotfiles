{config, libs, pkgs, ...}:
{
	imports = [
		./programs/nixvim.nix
		./programs/zsh.nix
		./programs/steam.nix
		./programs/jdk.nix
	];
}
