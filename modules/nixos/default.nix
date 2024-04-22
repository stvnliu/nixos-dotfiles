# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{pkgs, ...}:
{
# List your module files here
# my-module = import ./my-module.nix;
	imports = [
		./fonts.nix
		./grub.nix
		./nvidia.nix
		./sddm.nix
		./utils.nix
		./steam.nix
		./i18n.nix
		./x.nix
		./services
		./wm
	];
}
