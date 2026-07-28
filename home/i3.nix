{ config, pkgs, reloadDesktop, ... }:

{
  imports = [
    ./desktop.nix
  ];

  home.packages = with pkgs; [
    feh
    rofi
    kitty
    brave
    discord
    steam
    brightnessctl
    wireplumber
    zathura
  ];

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";

      fonts = {
        names = [ "FiraCode Nerd Font Medium" ];
        size = 10.0;
      };

      terminal = "${pkgs.kitty}/bin/kitty";

      startup = [
        {
          command = "${reloadDesktop}";
          always = true;
          notification = false;
        }
      ];

      bars = [];

      keybindings = {
        # i3 meta
        "Mod4+Shift+r" = "restart";
        "Mod4+Shift+q" = "kill";

        # Applications
        "Mod4+Return" = "exec ${pkgs.rofi}/bin/rofi -show run";

        "Mod4+a"        = "workspace number 1; exec --no-startup-id ${pkgs.kitty}/bin/kitty";
        "Mod4+s"        = "workspace number 2; exec --no-startup-id ${pkgs.brave}/bin/brave";
        "Mod4+d"        = "workspace number 3; exec --no-startup-id ${pkgs.kitty}/bin/kitty ranger";
        "Mod4+Shift+p"  = "exec ${config.home.homeDirectory}/.i3/float-app.sh -s 0.7 ${pkgs.kitty}/bin/kitty pulsemixer";
        "Mod4+Shift+d"  = "workspace number 4; exec --no-startup-id ${pkgs.discord}/bin/discord";
        "Mod4+Shift+s"  = "workspace number 7; exec --no-startup-id ${pkgs.steam}/bin/steam";

        # Audio
        "XF86AudioRaiseVolume" =
          "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" =
          "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" =
          "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        # Brightness
        "XF86MonBrightnessUp" =
          "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
        "XF86MonBrightnessDown" =
          "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";

        # Window controls
        "Mod4+Shift+f"  = "fullscreen toggle";
        "Mod4+space"    = "floating toggle";
        "Mod4+Tab"      = "split toggle";

        # Move focused container
        "Mod4+Ctrl+1" = "move container to workspace number 1";
        "Mod4+Ctrl+2" = "move container to workspace number 2";
        "Mod4+Ctrl+3" = "move container to workspace number 3";
        "Mod4+Ctrl+4" = "move container to workspace number 4";
        "Mod4+Ctrl+5" = "move container to workspace number 5";
        "Mod4+Ctrl+6" = "move container to workspace number 6";
        "Mod4+Ctrl+7" = "move container to workspace number 7";
        "Mod4+Ctrl+8" = "move container to workspace number 8";
        "Mod4+Ctrl+9" = "move container to workspace number 9";
        "Mod4+Ctrl+0" = "move container to workspace number 10";

        # Move focused container and switch
        "Mod4+Shift+1" = "move container to workspace number 1; workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2; workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3; workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4; workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5; workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6; workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7; workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8; workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9; workspace number 9";
        "Mod4+Shift+0" = "move container to workspace number 10; workspace number 10";

        # Focus
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";

        # Move
        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";

        # Workspaces
        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace number 10";

        # Workspace/output
        "Mod4+Shift+Ctrl+h" = "move workspace to output left";
        "Mod4+Shift+Ctrl+j" = "move workspace to output down";
        "Mod4+Shift+Ctrl+k" = "move workspace to output up";
        "Mod4+Shift+Ctrl+l" = "move workspace to output right";

        # Mode bindings
        "Mod4+r" = "mode resize";
        "Mod4+Delete" = "mode system";
      };

      modes = {
        system = {
          h = "exec systemctl hibernate, mode default";
          e = "exec i3-msg exit, mode default";
          r = "exec systemctl reboot, mode default";
          s = "exec systemctl suspend, mode default";
          "Shift+s" = "exec shutdown now, mode default";
          Escape = "mode default";
        };

        resize = {
          h = "resize shrink width 5 px or 5 ppt";
          j = "resize shrink height 5 px or 5 ppt";
          k = "resize grow height 5 px or 5 ppt";
          l = "resize grow width 5 px or 5 ppt";
          Return = "mode default";
          Escape = "mode default";
        };
      };

      window = {
        commands = [
          {
            command = "move to workspace number 7";
            criteria.class = "^steam$";
          }
          {
            command = "move to workspace number 8";
            criteria.class = "^Overwatch$";
          }
          {
            command = "layout tabbed";
            criteria.class = "^Brave-browser$";
          }
          {
            command = "layout tabbed";
            criteria.class = "^Zathura$";
          }
          {
            command = "focus";
            criteria.urgent = "latest";
          }
        ];
      };

      floating = {
        modifier = "Mod4";
        border = 1;
      };

      defaultWorkspace = "workspace number 1";

      colors = {
        focused = {
          border = "#7aa2f7";
          background = "#1a1b26";
          text = "#c0caf5";
          indicator = "#7aa2f7";
          childBorder = "#7aa2f7";
        };

        focusedInactive = {
          border = "#414868";
          background = "#1a1b26";
          text = "#c0caf5";
          indicator = "#414868";
          childBorder = "#414868";
        };

        unfocused = {
          border = "#414868";
          background = "#1a1b26";
          text = "#c0caf5";
          indicator = "#414868";
          childBorder = "#414868";
        };

        urgent = {
          border = "#f7768e";
          background = "#f7768e";
          text = "#1a1b26";
          indicator = "#f7768e";
          childBorder = "#f7768e";
        };
      };

      window = {
        titlebar = false;
        border = 1;
      };
    };
  };

  home.file.".i3/float-app.sh" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash

      usage="$(basename "$0") [-h] [-s n] <application_name>

      Launches a floating application, sleeps for the specified amount of time
      (waiting for the focus to switch), then toggles the window's floating state.

      where:
          -h  show this help text
          -s  sleep time in seconds before floating the application (default: 1)"

      sleep_time=1

      while getopts ':hs:' option; do
        case "$option" in
          h)
            echo "$usage"
            exit
            ;;
          s)
            sleep_time=$OPTARG
            ;;
          :)
            printf "missing argument for -%s\n" "$OPTARG" >&2
            echo "$usage" >&2
            exit 1
            ;;
          \?)
            printf "illegal option: -%s\n" "$OPTARG" >&2
            echo "$usage" >&2
            exit 1
            ;;
        esac
      done

      shift $((OPTIND - 1))

      "$@" &
      sleep "''${sleep_time}s"
      ${pkgs.i3}/bin/i3-msg "floating toggle"
    '';
  };
}
