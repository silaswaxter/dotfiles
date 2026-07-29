{ pkgs, ... }:

let
  magnetic-catppuccin-gtk = pkgs.callPackage ../packages/magnetic-catppuccin-gtk.nix {};

  palette = import ../modules/palettes/catppuccin-mocha.nix;

  theme = {
    colors = palette;

    # Semantic colors
    accent = palette.mauve;
    background = palette.base;
    foreground = palette.text;

    attention-low = palette.yellow;
    attention-medium = palette.peach;
    attention-high = palette.red;

    surface = palette.surface0;
    border = palette.surface1;
  };
in
{
  # export
  _module.args.theme = theme;

  # dependencies
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
