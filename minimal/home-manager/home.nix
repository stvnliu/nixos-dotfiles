# Home Manager configuration referred to in ../flake.nix
{
	inputs,
	outputs,
	lib,
	config, 
	pkgs, 
	...
}: {
	imports = [
		./git.nix
		./nixvim.nix
		./jdk.nix
		./steam.nix
		./presets.nix
	];
	# nixpkgs config
	nixpkgs = {
		config = {
			allowUnfree = true;
			allowunfreePredicate = _: true;
		};
	};
	presets = {
		enable = true;
		presetName = "full";
	};
	# home directory files
	home = {
		username = "zhonghengl";
		file.".ssh/allowed_signers".text = 
		"* ${builtins.readFile /home/zhonghengl/.ssh/id_ed25519.pub}";
	};
	programs.home-manager.enable = true;
	systemd.user.services = {
		mpris-proxy = {
			enable = true;
		};
	};
	home.stateVersion = "23.11";
}
