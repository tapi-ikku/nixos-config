{ config, pkgs, ... }:

{
	home.username = "tapsa";
	home.homeDirectory = "/home/tapsa";

	# Home Manager -versio
	home.stateVersion = "26.05";

	# Tänne voit myöhemmin lisätä käyttäjäkohtaisia paketteja
	home.packages = with pkgs; [
		htop
		git
		wget
		curl
		fastfetch
		vlc
	];

	# Salli Home Managerin hallinnoida itseään
	programs.home-manager.enable = true;

	programs.bash = {
		enable = true;
		shellAliases = {
			ll = "ls-l";
			siivoa = "nix-collect-garbage -d";
			paivita = "sudo nix flake update && sudo nixos-rebuild switch --flake .";
			miconf = "sudo micro /etc/nixos/configuration.nix";
		};
	};
}












