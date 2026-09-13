	description = "NixOS ja Home Manager - konfiguraatio";

	inputs = {
	# NixOS-pakettilähde
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		# Home Manager -syöte
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
			# Yhdistetään nykyinenjärjestelmäkonfiguraatio
				./configuration.nix

				# Yhdistetään Home Manager osaksi NixOS:ää
				home-manager.nixosModules.home-manager
				{
				home.manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = { inherit inputs; };
			    home-manager.users.tapsa = import ./home.nix;
			
				}
			];
		};
	};
 }	

