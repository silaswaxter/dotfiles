# Catch-all system configuration. All the underlying things that you ussually setup
# when installing Linux for the first time.
# ---
{ config, pkgs, lib, ... }:

let
  settings = import ./settings.nix;
in
{
  # Dependencies
  environment.systemPackages = with pkgs; [
    sbctl # for working with secure boot keys and stuff
  ];

  # Bootloader.
  boot = {
    plymouth.enable = true;

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader = {
      systemd-boot = {
        enable = lib.mkForce false;
        configurationLimit = 10;
      };

      efi.canTouchEfiVariables = true;
    };
  };

  # Networking
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "America/Phoenix";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."silas" = {
    isNormalUser = true;
    description = "silas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Set Geoclue as the default location provider
  location.provider = "geoclue2";
  services.geoclue2 = {
    enable = true;
    geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
  };

}
