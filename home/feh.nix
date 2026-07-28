{ pkgs, ... }:

{
  home.packages = [
    pkgs.feh
  ];

  home.file.".config/feh/keys".text = ''
    scroll_left h
    scroll_right l
    scroll_up k
    scroll_down j

    zoom_in K
    zoom_out J

    next_img L
    prev_img H
  '';
}
