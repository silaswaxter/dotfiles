{ config, pkgs, ... }:

let
  dotfiles = "/home/silas/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  imports = [
    ./packages.nix
    ./theme.nix
    ./kitty.nix
    ./rofi.nix
    ./feh.nix
    ./i3.nix
    ./polybar.nix
  ];

  home.username = "silas";
  home.homeDirectory = "/home/silas";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  xdg.enable = true;

  home.file.".config/nvim".source          = link "config/nvim";
  home.file.".config/htop".source          = link "config/htop";
  home.file.".config/picom".source         = link "config/picom";
  home.file.".config/ranger".source        = link "config/ranger";
  home.file.".config/starship.toml".source = link "config/starship.toml";
  home.file.".config/zathura".source       = link "config/zathura";
}
