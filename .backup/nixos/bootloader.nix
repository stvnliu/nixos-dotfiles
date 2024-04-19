{config, pkgs, ...}: 
{
	boot.supportedFilesystems = [ "ntfs" ];
	#fileSystems."/mnt/winsys" = {
	#	device = "/dev/nvme0n1p5";
	#	fsType = "ntfs-3g";
	#	options = [ "rw" "uid=1000" ];
	#};
	#fileSystems."/mnt/windata" = {
	#	device = "/dev/nvme0n1p3";
	#	fsType = "ntfs-3g";
	#	options = [ "rw" "uid=1000" ];
	#};
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot";
		};
		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = true;
			configurationLimit = 10;
			theme = pkgs.stdenv.mkDerivation {
				pname = "distro-grub-themes";
				version = "3.1";
				src = pkgs.fetchFromGitHub {
					owner = "AdisonCavani";
					repo = "distro-grub-themes";
					rev = "v3.1";
					hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
				};
				installPhase = "cp -r customize/nixos $out";
			};
		};
	};
}
