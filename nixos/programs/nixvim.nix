{ pkgs, lib, ... }:
let
nixvim = import (builtins.fetchGit {
		url = "https://github.com/nix-community/nixvim";
# If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
		ref = "nixos-23.11";
		});
in
{
	imports = [
		nixvim.nixosModules.nixvim
	];

	programs.nixvim = {
		enable = true;
		options = {
			number = true;
			relativenumber = true;
			shiftwidth = 8;
		};
		extraPlugins = with pkgs.vimPlugins; [
			tokyonight-nvim
			nerdtree
		];
		colorschemes.tokyonight.enable = true;
		plugins = {
			nerdtree.enable = true;
		};
	};
}
