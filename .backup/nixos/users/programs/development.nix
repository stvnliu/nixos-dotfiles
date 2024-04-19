{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		nodejs
		python3
		vscode-with-extensions
	];
}
