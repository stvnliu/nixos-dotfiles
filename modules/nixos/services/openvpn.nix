{inputs, config, ...}:
{
	imports = [ inputs.sops-nix.nixosModules.sops ];
	sops.secrets = {
		"openvpn/usernm".owner = config.users.users.zhonghengl.name;
		"openvpn/passwd".owner = config.users.users.zhonghengl.name;
	};
	services.openvpn.servers = {
		nl = {
			autoStart = false;
			config = '' config /home/${config.users.users.zhonghengl.name}/openvpn/nl-free-1.ovpn '';
			updateResolvConf = true;
		};
	};
}
