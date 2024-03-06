{config, libs, pkgs, ...}:
{
	imports = [
		./programs/nixvim.nix
		./programs/zsh.nix
	];
}
