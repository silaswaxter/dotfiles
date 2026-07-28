{ config, pkgs, ... }:

let
  reloadPolybar = pkgs.writeShellScript "reload-polybar" ''
    ${pkgs.procps}/bin/pkill -x polybar || true

    while ${pkgs.procps}/bin/pgrep -x polybar >/dev/null; do
      ${pkgs.coreutils}/bin/sleep 0.01
    done

    if ${pkgs.xrandr}/bin/xrandr --query >/dev/null 2>&1; then
      for monitor in $(
        ${pkgs.xrandr}/bin/xrandr --query |
        ${pkgs.gawk}/bin/awk '/ connected/{print $1}'
      ); do
        MONITOR="$monitor" ${pkgs.polybar}/bin/polybar primary &
      done
    else
      ${pkgs.polybar}/bin/polybar primary &
    fi
  '';

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
