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
			./programs.nix
		];
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];
	nixpkgs.config.allowUnfree = true;
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

# rtkit is optional but recommended
	security.rtkit.enable = true;
	services.upower.enable = true;
	services.printing = {
		enable = true;
		drivers = [];
	};
	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};
	services.avahi = {
		enable = true;
		nssmdns = true;
		openFirewall = true;
	};
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		#jack.enable = true;
	};
	services.udisks2.enable = true;
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
	i18n.inputMethod = {
		enabled = "fcitx5";
		fcitx5.addons = with pkgs; [ 
		fcitx5-mozc 
		fcitx5-gtk
		fcitx5-rime
		];
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

	services.openssh.enable = true;

# Open ports in the firewall.
networking.firewall.allowedTCPPorts = [ 80 ];
networking.firewall.allowedUDPPorts = [ ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
environment.etc = 
#let 
#	json = pkgs.formats.json {}; 
#in
{
	"wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
		bluez_monitor.properties = {
			["bluez5.enable-sbc-xq"] = true,
			["bluez5.enable-msbc"] = true,
			["bluez5.enable-hw-volume"] = true,
			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
		}
	'';
	#"pipewire/pipewire.d/92-low-latency.conf".source = json.generate "92-low-latency.conf" {
  	#	context.properties = {
    	#		default.clock.rate = 48000;
    	#		default.clock.quantum = 32;
    	#		default.clock.min-quantum = 32;
    	#		default.clock.max-quantum = 32;
  	#	};
	#};
};

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?

}
