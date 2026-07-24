{ config, pkgs, ... }:

{
  home.username = "silas";
  home.homeDirectory = "/home/silas";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  xdg.enable = true;

  xdg.configFile."kitty".source = ../config/kitty;
}
