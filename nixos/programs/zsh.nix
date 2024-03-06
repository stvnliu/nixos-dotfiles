{
	programs.zsh = {
		enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
		};
		ohMyZsh = {
			enable = true;
			plugins = ["git"];
			theme = "robbyrussell";
		};
	};
}
