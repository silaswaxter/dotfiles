{ config, pkgs, ... }:

{
  # A list of packages I want to always have
  home.packages = with pkgs; [
    git
    gh
    neovim
    starship

    arandr
    zathura
    feh

    pulsemixer
    htop
    imagemagick
    xclip
    wget
    python3
    file
    killall
    unzip
    ripgrep
  ];
}
