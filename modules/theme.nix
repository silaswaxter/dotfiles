{ config, pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [
  #   catppuccin-gtk
  #   papirus-icon-theme
  #   catppuccin-cursors
  # ];
  #
  # services.xserver.displayManager.lightdm.greeters.enso = {
  #   theme = {
  #     package = catppuccin-gtk;
  #     name = "Catppuccin-Mocha-Standard-Blue-Dark";
  #   };
  #
  #   iconTheme = {
  #     package = papirus-icon-theme;
  #     name = "Papirus-Dark";
  #   };
  #
  #   cursorTheme = {
  #     package = catppuccin-cursors.mochaDark;
  #     name = "Catppuccin-Cursors";
  #   };
  # };

  # font packages
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
  ];
}
