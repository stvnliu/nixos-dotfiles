{
	programs.zsh = {
		enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			ls = "exa";
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
			batmon = "watch -n0 upower -i /org/freedesktop/UPower/devices/battery_BAT1";
		};
		ohMyZsh = {
			enable = true;
			plugins = ["git"];
			theme = "agnoster";
		};
	};
}
