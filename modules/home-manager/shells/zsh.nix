{pkgs, config, ...}:
{
	config = {
		programs.zsh = {
			enable = true;
			syntaxHighlighting.enable = true;
			shellAliases = {
				ls = "exa";
				cat = "bat";
				ll = "ls -l";
				osupdate = "nh os switch";
				homeupdate = "nh home switch -- --impure";
				batmon = "watch -n0 upower -i /org/freedesktop/UPower/devices/battery_BAT1";
			};
			dirHashes = {
				docs = "$HOME/Documents";
				dl = "$HOME/Downloads";
				dev = "$HOME/devel";
				screen = "$HOME/Pictures/Screenshots";
			};
			oh-my-zsh = {
				enable = true;
				plugins = ["git"];
				theme = "agnoster";
			};
		};
	};
}
