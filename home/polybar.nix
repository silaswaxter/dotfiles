{ config, pkgs, ... }:

let
  polybarPkg = pkgs.polybar.override {
    i3Support = true;
    pulseSupport = true;
  };

  reloadPolybar = pkgs.writeShellScript "reload-polybar" ''
    ${pkgs.procps}/bin/pkill -f '/bin/polybar primary' || true

    while ${pkgs.procps}/bin/pgrep -x polybar >/dev/null; do
      ${pkgs.coreutils}/bin/sleep 0.01
    done

    for monitor in $(
      ${pkgs.xrandr}/bin/xrandr --query |
      ${pkgs.gawk}/bin/awk '/ connected/{print $1}'
    ); do
      MONITOR="$monitor" ${polybarPkg}/bin/polybar primary &
    done
  '';

  networkBase = {
    type = "internal/network";
    interval = 5;

    format-connected-prefix = "  ";
    format-connected = "<label-connected>";

    format-disconnected-prefix = "  ";
    format-disconnected = "<label-disconnected>";
    format-disconnected-foreground = "\${colors.red}";
    label-disconnected = "disconnected";
  };
in
{
  # export the reload polybar script
  _module.args.reloadPolybar = reloadPolybar;

  # dependencies
  home.packages = with pkgs; [
  ];

  services.polybar = {
    enable = true;

    package = polybarPkg;

    # do nothing, we start via desktop interface.
    script = "";

    config = {
      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };

      "bar/primary" = {
        monitor = "\${env:MONITOR:}";
        width = "100%";
        height = "24pt";
        radius = 0;

        background = "\${colors.base}";
        foreground = "\${colors.text}";
        line-size = "3pt";
        border-size = "0pt";

        font-0 = "FiraCode Nerd Font";

        module-margin = 1;
        modules-left = "xworkspaces";
        modules-center = "i3";
        modules-right = "wlan pulseaudio battery date";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
      };

      "module/tray" = {
        position = "none";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        format-volume-prefix = "  ";
        format-volume = "<label-volume>";
        label-volume = "%percentage%%";

        format-muted-prefix = "  ";
        format-muted-foreground = "\${colors.peach}";
        label-muted = "muted";
      };

      "module/battery" = {
        type = "internal/battery";

        battery = "BAT1";
        adapter = "ACAD";

        ramp-capacity-0 = " ";
        ramp-capacity-1 = " ";
        ramp-capacity-2 = " ";
        ramp-capacity-3 = " ";
        ramp-capacity-4 = " ";

        ramp-capacity-0-foreground = "\${colors.red}";
        ramp-capacity-1-foreground = "\${colors.peach}";
        ramp-capacity-2-foreground = "\${colors.yellow}";
        ramp-capacity-3-foreground = "\${colors.text}";
        ramp-capacity-4-foreground = "\${colors.text}";

        label-discharging = "%percentage%%";
        format-discharging = "<ramp-capacity> <label-discharging>";

        animation-charging-0 = " ";
        animation-charging-1 = " ";
        animation-charging-2 = " ";
        animation-charging-3 = " ";
        animation-charging-4 = " ";
        animation-charging-framerate = 750;

        label-charging = "%percentage%%";
        format-charging = "<animation-charging> <label-charging>";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%A, %D %I:%M%P";
        label = "%date%";
      };

      "network-base" = networkBase;

      "module/wlan" = networkBase // {
        interface-type = "wireless";
        label-connected = "%essid%";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        pin-workspaces = true;

        label-active-underline = "\${colors.peach}";
        label-active = "%name%";
        label-active-padding = 1;

        label-urgent-background = "\${colors.red}";
        label-urgent = "%name%";
        label-urgent-padding = 1;

        label-occupied = "%name%";
        label-occupied-padding = 1;

        label-empty = "%name%";
        label-empty-padding = 1;
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = true;

        label-mode-background = "\${colors.red}";
        label-mode = "%mode%";
        label-mode-padding = 4;

        format = "<label-mode>";
      };
    };
  };
}
