{
	description = "Your new nix config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix.url = "github:Mic92/sops-nix";
	};
	outputs = {
		self,
		nixpkgs,
		home-manager,
		...
	} @ inputs: let
	inherit (self) outputs;
# Supported systems for your flake packages, shell, etc.
	systems = [
		"aarch64-linux"
		"i686-linux"
		"x86_64-linux"
		"aarch64-darwin"
		"x86_64-darwin"
	];
# This is a function that generates an attribute by calling a function you
# pass to it, with each system as an argument
	forAllSystems = nixpkgs.lib.genAttrs systems;
	in {
# Your custom packages
# Accessible through 'nix build', 'nix shell', etc
		packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
# Formatter for your nix files, available through 'nix fmt'
# Other options beside 'alejandra' include 'nixpkgs-fmt'
		formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

# Your custom packages and modifications, exported as overlays
		overlays = import ./overlays {inherit inputs;};
		#nixosModules = import ./modules/nixos;
		#homeManagerModules = import ./modules/home-manager;
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs outputs;};
				modules = [
					./nixos/configuration.nix
				];
			};
		};
		homeConfigurations = {
			"zhonghengl@nixos" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
					extraSpecialArgs = {inherit inputs outputs;};
				modules = [
					./home-manager/home.nix
					inputs.nixvim.homeManagerModules.nixvim
				];
			};
		};
	};
}
