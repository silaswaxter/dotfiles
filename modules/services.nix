{ config, pkgs, ... }:

let
  settings = import ./settings.nix;
in
{
  # List services that you want to enable:
  services.openssh.enable = true;

  services.envfs.enable = true;

  services.xserver = {
    enable = true;

    windowManager.i3.enable = true;

    xkb.layout = "us";
    autoRepeatDelay = 130;
    autoRepeatInterval = 30;
  };

  services.xserver.displayManager = {
      lightdm = {
        enable = true;

        # enable redshift in one-shot mode so I don't get flashbanged
        extraSeatDefaults = ''
            greeter-setup-script=${pkgs.writeShellScript "lightdm-greeter-setup" ''
              ${pkgs.redshift}/bin/redshift -r -O ${toString settings.redshift.night}
            ''}
          '';
    };
  };

  services.picom.enable = true;

  services.snap.enable = true;

  services.redshift = {
    enable = true;
    brightness = {
      # Note the string values below.
      day = "1";
      night = "1";
    };
    temperature = {
      day = settings.redshift.day;
      night = settings.redshift.night;
    };

    extraOptions = [
      "-r"  # no fade
      "-P"  # reset gamma map (gamma ramp is additive--avoid innaccurate colors when set prior)
    ];
  }; 

  systemd.user.services.truple = {
    description = "Truple";
    wantedBy = [ "default.target" ];
  
    serviceConfig = {
      ExecStart = "${pkgs.appimage-run}/bin/appimage-run /home/silas/truple/Truple.AppImage";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
