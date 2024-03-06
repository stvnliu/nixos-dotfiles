{config, libs, pkgs, ...}:
{
	imports = [
		./packages/communications.nix
		./packages/development.nix
		./packages/multimedia.nix
		./packages/utils.nix
		./packages/wm-components.nix
		./packages/misc.nix
		./packages/tex.nix
	];
}
