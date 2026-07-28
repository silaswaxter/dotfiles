{ config, pkgs, ... }:

{
  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Flakes clones its dependencies through the git command,
    # so git must be installed first
    git

    # desktop
    lightdm
    redshift
    (pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    })
    pulsemixer

    # utils
    appimage-run
    wget
    python3
    file
    htop
    unzip
    ripgrep
  ];

  programs.steam = {
    enable = true;
  };

  programs.nix-ld.enable = true;
  
  programs.nix-ld.libraries = with pkgs; [
    fuse # Provides libfuse.so.2
    libgbm
    glib
    gtk3
    atk
    at-spi2-atk
    at-spi2-core
    cairo
    pango
    gdk-pixbuf
    dbus
    nspr
    nss
    expat
    libdrm
    mesa
    libxkbcommon
    libx11
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrandr
    libxcb
    libxi
    libxtst
    libxrender
    libxscrnsaver
    alsa-lib
    cups
  ];

  environment.variables.EDITOR = "nvim";
}
