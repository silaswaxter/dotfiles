let
  palette = import ./palettes/catppuccin-mocha.nix;
in
{
  palette = palette;

  redshift = {
    day = 5500;
    night = 3700;
  };

  plymouthTheme = "hexagon_dots";

  wallpaper = ../wallpapers/clouds.png;
  wallpaper-login = ../wallpapers/clouds-blurred.png;

  colors = {
    background = palette.base;
    surface    = palette.surface0;

    foreground = palette.text;
    muted       = palette.subtext0;

    accent      = palette.mauve;
    secondary   = palette.blue;

    success     = palette.green;
    warning     = palette.yellow;
    error       = palette.red;

    border      = palette.mauve;
  };
}
