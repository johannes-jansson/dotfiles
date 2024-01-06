{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod1";
      bars = [{
        statusCommand = "i3status-rs /home/johannes/.config/i3status-rust/config-bottom.toml";
        position = "bottom";
        trayOutput = "primary";
        /* mode = "hide"; */
        /* modifier = "Mod1"; */
        fonts = {
          names = [ "Hasklig Light" ];
          size = 16.0;
        };
      }];

      # window.border = 0;

      /* gaps = { */
      /*   inner = 15; */
      /*   outer = 5; */
      /*   smartGaps = true; */
      /*   smartBorders = "on"; */
      /* }; */

      floating.modifier = "${modifier}";

      keybindings = lib.mkOptionDefault {
        "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun -theme dmenu";
        "${modifier}+c" = "exec ${pkgs.rofi}/bin/rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'";
        "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
        "${modifier}+Shift+x" = "exec systemctl suspend";

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+w" = "exec xflock4";
        "${modifier}+BackSpace" = "exec xfce4-session-logout";
        # change focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        # move focused window
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        # split in horizontal orientation
        "${modifier}+Shift+v" = "split h";
        # split in vertical orientation
        "${modifier}+v" = "split v";
        # enter fullscreen mode for the focused container
        "${modifier}+f" = "fullscreen toggle";
        # change container layout (stacked, tabbed, toggle split)
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        # toggle tiling / floating
        "${modifier}+Shift+space" = "floating toggle";
        # change focus between tiling / floating windows
        "${modifier}+space" = "focus mode_toggle";
        # focus the parent container
        "${modifier}+a" = "focus parent";
        # focus the child container
        #bindsym $mod+d focus child
        # reload the configuration file
        "${modifier}+Shift+c" = "reload";
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        "${modifier}+Shift+r" = "restart";

        "${modifier}+Mod4+1" = "workspace number 1";
        "${modifier}+Mod4+2" = "workspace number 2";
        "${modifier}+Mod4+3" = "workspace number 3";
        # "${modifier}+x" = "workspace number 4";
        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        # "${modifier}+Shift+x" = "move container to workspace number 4";
      };

      startup = [
        { command = "exec i3-msg workspace 1"; }
        { command = "exec --no-startup-id nm-applet --sm-disable"; }
        { command = "greenclip daemon"; }
        { command = "xrandr --setprovideroutputsource NVIDIA-G0 modesetting"; }
        { command = "setxkbmap"; }
        { command = "${pkgs.feh}/bin/feh --bg-scale ~/.background-image"; }
      ];
      /* assigns = { */
      /*   "1" = [{ class = "^Alacritty$"; }]; */
      /*   "2" = [{ class = "^firefox$"; }]; */
      /*   "3" = [{ class = "^Slack$"; }]; */
      /*   "5" = [{ class = "^Spotify$"; }]; */
      /* }; */
    };
  };
}

