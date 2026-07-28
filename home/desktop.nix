{ config, pkgs, reloadPolybar, ... }:

let
  setWallpaper = pkgs.writeShellScript "set-wallpaper" ''
    ${pkgs.feh}/bin/feh --bg-fill ${config.home.homeDirectory}/dotfiles/wallpapers/clouds.png
  '';

  reloadDesktop = pkgs.writeShellScript "reload-desktop" ''
    ${reloadPolybar}
    ${setWallpaper}
  '';
in
{
  # Expose the path to other modules.
  _module.args.reloadDesktop = reloadDesktop;
}
