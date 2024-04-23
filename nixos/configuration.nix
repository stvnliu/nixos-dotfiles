{pkgs, inputs, config, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			../modules/nixos
			./specialisations
			../overlays/test-overlay.nix
		];
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.permittedInsecurePackages = [
		"electron-25.9.0"
	];
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};
	hardware.sane = {
		enable = true;
		extraBackends = with pkgs; [ 
			sane-airscan 
			#epkowa
			utsushi
		];
	};
	users.users.zhonghengl = {
		shell = pkgs.zsh;
	};
	programs.zsh.enable = true;
# rtkit is optional but recommended
	security.rtkit.enable = true;
	services = {
		auto-cpufreq.enable = true;
	};
	networking = {
		hostName = "nixos"; # Define your hostname.
		# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
		networkmanager.enable = true;
	};
# Set your time zone.
	time.timeZone = "Europe/Athens";

# Select internationalisation properties.
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;
# Configure keymap in X11
	
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.zhonghengl = {
		isNormalUser = true;
		description = "Zhongheng Liu";
		extraGroups = [ "networkmanager" "wheel" ];
	};
	
# Open ports in the firewall.
	networking.firewall.allowedTCPPorts = [ ];
	networking.firewall.allowedUDPPorts = [ ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
	environment = {
		systemPackages = with pkgs; [
			sublime
			devenv
		];
		variables = {
			FLAKE = "/home/${config.users.users.zhonghengl.name}/dotfiles";
			EDITOR = "nvim";
			VISUAL = "sublime";
		};
	};
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?

}
