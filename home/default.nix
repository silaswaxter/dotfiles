{ config, pkgs, ... }:

let
  dotfiles = "/home/silas/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  imports = [
    ./theme.nix
    ./kitty.nix
    ./rofi.nix
  ];
  home.username = "silas";
  home.homeDirectory = "/home/silas";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  xdg.enable = true;

  home.file.".config/feh".source           = link "config/feh";
  home.file.".config/htop".source          = link "config/htop";
  home.file.".config/i3".source            = link "config/i3";
  # home.file.".config/kitty".source         = link "config/kitty";
  home.file.".config/nvim".source          = link "config/nvim";
  home.file.".config/picom".source         = link "config/picom";
  home.file.".config/polybar".source       = link "config/polybar";
  home.file.".config/ranger".source        = link "config/ranger";
  # home.file.".config/rofi".source          = link "config/rofi";
  home.file.".config/starship.toml".source = link "config/starship.toml";
  home.file.".config/zathura".source       = link "config/zathura";
}
