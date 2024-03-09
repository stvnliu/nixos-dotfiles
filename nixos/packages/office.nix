{config, libs, pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		firefox
		thunderbird

		# Office suite for documents
		libreoffice

		# PDFs
		libsForQt5.okular
	];
}
