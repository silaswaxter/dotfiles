{ config, pkgs, ... }:

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

  services.xserver.displayManager.lightdm = {
    enable = true;

	#    background = "/home/silas/images/wallpapers/tokyonight-wallpapers/tokyonight_original.png"
	#
	#    greeters.enso = {
	#    	enable = true;
	# blur = true;
	#    };
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
      day = 5500;
      night = 3700;
    };
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
