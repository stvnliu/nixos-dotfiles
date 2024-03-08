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
			gruvbox
		];
		colorschemes.gruvbox.enable = true;
		plugins = {
			alpha.enable = true;
			chadtree.enable = true;
			telescope.enable = true;
			oil.enable = true;
			treesitter.enable = true;
			luasnip.enable = true;
			lightline.enable = true;
			gitsigns.enable = true;
			barbar.enable = true;
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
