{lib, pkgs, config, ...}:
let
	cfg = config.vscode;
in
{
	options = {
		vscode.enable = lib.mkEnableOption "Enables vscode support with extensions";
	};
	config = lib.mkIf cfg.enable {
		programs.vscode = {
			enable = true;
			package = pkgs.vscode.fhs;
		};
	};
}
