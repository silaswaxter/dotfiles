{ config, pkgs, ... }:

let
  settings = import ./settings.nix;
  c = settings.colors;
in
{
  services.xserver.displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "silas";
      extraConfig = ''
        [greeter-theme]
        background-image = "${settings.wallpaper-login}"
        background-color = "${c.background}"

        window-color = "${c.surface}"

        text-color = "${c.foreground}"

        border-color = "${c.border}"
        border-width = 2px

        password-color = "${c.foreground}"
        password-background-color = "${c.surface}"
        password-border-color = "${c.muted}"

        error-color = "${c.error}"
      '';
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
