# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			./xserver.nix
			./nvidia.nix
			./bootloader.nix
			./home-manager.nix
			./fonts.nix
			./packages.nix
		];
	nixpkgs.config.allowUnfree = true;
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};

# rtkit is optional but recommended
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;
	};

	networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Enable networking
	networking.networkmanager.enable = true;

# Set your time zone.
	time.timeZone = "Europe/Athens";

# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;
# Configure keymap in X11
	services.xserver = {
		enable = true;
		layout = "us";
		xkbVariant = "";
	};
	services.picom.enable = true;
	services.blueman.enable = true;
	services.gnome.gnome-keyring.enable = true;
	services.xserver.displayManager.sddm = {
		enable = true;
		theme = "where_is_my_sddm_theme";
	};
# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.zhonghengl = {
		isNormalUser = true;
		description = "Zhongheng Liu";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};

# List packages installed in system profile. To search, run:
# $ nix search wget
	

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
	services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
	environment.etc = {
		"wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
			bluez_monitor.properties = {
				["bluez5.enable-sbc-xq"] = true,
				["bluez5.enable-msbc"] = true,
				["bluez5.enable-hw-volume"] = true,
				["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
			}
		'';
	};
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?

}
