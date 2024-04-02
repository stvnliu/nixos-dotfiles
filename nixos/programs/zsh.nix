{
	programs.zsh = {
		enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			cd = "z";
      ls = "exa";
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
			batmon = "watch -n0 upower -i /org/freedesktop/UPower/devices/battery_BAT1";
      nvim = "lvim"; # LunarVim as Neovim replacement
		};
		ohMyZsh = {
			enable = true;
			plugins = ["git" "z"];
			theme = "agnoster";
		};
	};
}
