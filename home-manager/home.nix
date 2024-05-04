# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
	inputs,
	outputs,
	lib,
	config,
	pkgs,
	...
}: {
# You can import other home-manager modules here
	imports = [
		../modules/home-manager
		./spicetify.nix
# If you want to use modules your own flake exports (from modules/home-manager):
# outputs.homeManagerModules.example

# Or modules exported from other flakes (such as nix-colors):
# inputs.nix-colors.homeManagerModules.default

# You can also split up your configuration and import pieces of it here:
# ./nvim.nix
	];
	nixpkgs = {
# You can add overlays here
		overlays = [
# Add overlays your own flake exports (from overlays and pkgs dir):
			outputs.overlays.additions
			outputs.overlays.modifications
			outputs.overlays.unstable-packages

# You can also add overlays exported from other flakes:
# neovim-nightly-overlay.overlays.default

# Or define it inline, for example:
# (final: prev: {
#   hi = final.hello.overrideAttrs (oldAttrs: {
#     patches = [ ./change-hello-to-hi.patch ];
#   });
# })
		];
# Configure your nixpkgs instance
		config = {
# Disable if you don't want unfree packages
			allowUnfree = true;
# Workaround for https://github.com/nix-community/home-manager/issues/2942
			allowUnfreePredicate = _: true;
		};
	};

# TODO: Set your username
	home = {
		username = "zhonghengl";
		homeDirectory = "/home/zhonghengl";
	};
	home.file.".ssh/allowed_signers".text =
		"* ${builtins.readFile /home/zhonghengl/.ssh/id_ed25519.pub}";
	programs.git = {
		enable = true;
		userName = "Zhongheng Liu";
		userEmail = "z.liu@outlook.com.gr";
		extraConfig = {
			push.autoSetupRemote = true;
			commit.gpgsign = true;
			gpg.format = "ssh";
			gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
			user.signingkey = "~/.ssh/id_ed25519.pub";
			credential.helper = "${
				pkgs.git.override { withLibsecret = true; }
			}/bin/git-credential-libsecret";
		};
	};
# Add stuff for your user as you see fit:
# programs.neovim.enable = true;
# home.packages = with pkgs; [ steam ];

# Enable home-manager and git
	programs.home-manager.enable = true;

# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	home.stateVersion = "23.11";
}
