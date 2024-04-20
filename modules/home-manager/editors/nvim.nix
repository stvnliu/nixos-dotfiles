{lib, config, pkgs, ...}:
let
	cfg = config.nvim;
in
{
	options = {
		nvim.enable = lib.mkEnableOption "Enables neovim with nixvim support.";
	};
	config = lib.mkIf cfg.enable {
		programs.nixvim = {
			enable = true;
			enableMan = true; # enables man pages for nixvim options
			vimAlias = true;
			viAlias = true;
			clipboard.register = "unnamedplus";
			clipboard.providers = {
				xclip.enable = true;
			};
			options = {
				number = true;
				relativenumber = true;
				shiftwidth = 8;
				completeopt = [ "menu" "menuone" "noselect" ];
				autoindent = true;
				undofile = true;
			};
			extraPlugins = with pkgs.vimPlugins; [
				nvim-web-devicons
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
					theme = "dashboard";
				};
				luasnip.enable = true;
				cmp = {
					enable = true;
				};
				chadtree.enable = true;
				telescope.enable = true;
				treesitter.enable = true;
				gitsigns.enable = true;
				airline.enable = true;
				lsp = {
					enable = true;
					servers = {
						nil_ls.enable = true;
						tsserver.enable = true;
						lua-ls.enable = true;
						bashls.enable = true;
						jsonls.enable = true;
						pylsp.enable = true;
						cssls.enable = true;
						java-language-server.enable = true;
					};
				};
			};
		};
	};
}
