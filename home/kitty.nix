{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # General
      mouse_hide_wait = 0.25;
      enable_audio_bell = false;
      confirm_os_window_close = 1;

      # Cursor
      cursor_shape = "block";
      cursor_blink_interval = 0;
      shell_integration = "no-cursor";

      scrollback_lines = 2000;


      # Window
      draw_minimal_borders = "yes";
      window_border_width = "0px";
      #                       t r b l
      window_padding_width = "2 6 6 2";
      placement_strategy = "center";

      # Font
      font_family = "FiraCode Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 10.0;
      disable_ligatures = "never";

      # Theme-overrides 
      background_opacity = "0.85";
    };

    keybindings = {
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+c" = "copy_to_clipboard";

      "ctrl+shift+equal" = "change_font_size all +2.0";
      "ctrl+shift+minus" = "change_font_size all -2.0";
    };
  };
}
