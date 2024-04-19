{pkgs, ...}:
{
	imports = [ <home-manager/nixos> ];
	config = {
		home-manager.users.zhonghengl = {
			home.stateVersion = "23.11";
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
		};
		systemd.user.services = {
			mpris-proxy = {
				enable = true;
			};
		};
	};
}
