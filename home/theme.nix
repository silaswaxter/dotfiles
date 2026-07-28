{ pkgs, ... }:

{
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
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Mocha-Mauve-Standard-Dark";
    };
  };
}
