{config, libs, pkgs, ...}:
{
	imports = [
		./programs/zsh.nix
		./programs/steam.nix
		./programs/jdk.nix
	];
}
