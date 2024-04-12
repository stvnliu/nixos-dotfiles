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
		enableMan = true; # enables man pages for nixvim options
		vimAlias = true;
		viAlias = true;
		clipboard.register = "unnamedplus";
		clipboard.providers = {
			xclip.enable = true;
			xsel.enable = true;
		};
		options = {
			number = true;
			relativenumber = true;
			shiftwidth = 8;
		};
		extraPlugins = with pkgs.vimPlugins; [
			gruvbox
		];
		highlight = {
			Normal.ctermbg = "none";
		};
		colorschemes.gruvbox.enable = true;
		plugins = {
			alpha = {
				enable = true;
				iconsEnabled = true;
			};
			chadtree.enable = true;
			telescope.enable = true;
			treesitter.enable = true;
			gitsigns.enable = true;
			airline.enable = true;
			lsp = {
				enable = true;
				servers = {
					tsserver.enable = true;
					lua-ls.enable = true;
					bashls.enable = true;
					jsonls.enable = true;
					pylsp.enable = true;
				};
			};
		};
	};
}
