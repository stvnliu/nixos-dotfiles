{lib, ...}:
{
	imports = [
		./development.nix
		./jdk.nix
		./misc.nix
		# ./nix-ld.nix
		# ./steam.nix
		./tex.nix
		./utils.nix
		# ./zsh.nix
		./gtk.nix
		./desktop
		./editors
		./terminals
		./shells
		#./wm
	];
	config = {
		editors = {
			neovim.enable = true;
			vscode.enable = true;
		};
		shells = {
			enable = true;
			useZsh = true;
		};
	};
}
