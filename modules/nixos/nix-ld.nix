{ pkgs, self, options, ... }:
{
# Enable nix ld
	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = options.programs.nix-ld.libraries.default ++ (with pkgs; [ ncurses ]);
}
