{ pkgs, ... }:

let
  magnetic-catppuccin-gtk = pkgs.callPackage ../packages/magnetic-catppuccin-gtk.nix {};
in
{
  home.packages = with pkgs; [
    dconf
  ];

  catppuccin = {
    enable = true;

    flavor = "mocha";
    accent = "mauve";

    cursors = {
      enable = true;
      accent = "dark";
    };
  };

  gtk = {
    enable = true;

    theme = {
      package = magnetic-catppuccin-gtk;
      name = "Catppuccin-Mauve-Dark";
    };
  };
}
