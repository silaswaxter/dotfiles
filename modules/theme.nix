{ config, pkgs, ... }:

let
  settings = import ./settings.nix;
in
{
  services.xserver.displayManager = {
    lightdm = {
      background = toString settings.wallpaper;
      greeters.gtk = {
        enable = true;
        # theme = {
        #   package = catppuccin-gtk;
        #   name = "Catppuccin-Mocha-Standard-Blue-Dark";
        # };
        cursorTheme = {
          package = pkgs.catppuccin-cursors.mochaBlue;
          name = "catppuccin-mocha-blue-cursors";
        };
      };
    };
  };

  boot.plymouth = {
      theme = settings.plymouthTheme;

      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [ settings.plymouthTheme ];
        })
      ];
  };

  # NixOS Themeing 
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";

    cache.enable = true;

    plymouth.enable = false; # we have a custom theme above
      
    cursors = {
      enable = true;
      accent = "dark";
    };
  };

  # font packages
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
  ];
}
