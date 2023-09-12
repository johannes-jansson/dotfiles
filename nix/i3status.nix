{ pkgs, lib, ... }:

{
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        blocks = [
        {
          block = "disk_space";
          path = "/";
          info_type = "available";
          interval = 60;
          warning = 20.0;
          alert = 10.0;
        }
        {
          block = "battery";
          interval = 10;
          warning = 20.0;
          critical = 10.0;
        }
        {
          block = "memory";
          format = " $icon $mem_total_used_percents.eng(w:2) ";
          format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
        }
        {
          block = "cpu";
          interval = 1;
        }
        { block = "sound"; }
        {
          block = "time";
          interval = 60;
          format = " $timestamp.datetime(f:'%a %d/%m %R') ";
        }
        ];
        settings = {
          theme =  {
            theme = "modern";
          };
        };
        icons = "awesome5";
        theme = "modern";
      };
    };
  };
}
