{ config, pkgs, ... }:

{
	home.username = "tapsa";
	home.homeDirectory = "/home/tapsa";

	# Home Manager -versio
	home.stateVersion = "24.11";

	# Tänne voit myöhemmin lisätä käyttäjäkohtaisia paketteja
	home.packages = with pkgs; [
		htop
	];

	# Salli Home Managerin hallinnoida itseään
	programs.home-manager.enable = true;
}












