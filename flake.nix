{   description = "NixOS ja Home Manager - konfiguraatio";


	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	               

       home-manager.url = "github:nix-community/home-manager/master";
       home-manager.inputs.nixpkgs.follows = "nixpkgs";
			};
			
	outputs = {self,nixpkgs,home-manager, ... }@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
						modules = [
				{
				nix.settings = {
					substituters = [ "https://cosmic.cachix.org/" ];
					trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
				};
			}
		
			./configuration.nix
			./hardware-configuration.nix
					
				home-manager.nixosModules.home-manager
				{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = { inherit inputs; };
			    home-manager.users.tapsa = import ./home.nix;
		    	}
		   ];
		};
	};
  }
  
  	

