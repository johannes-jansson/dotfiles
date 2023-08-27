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
          alias = "/";
          info_type = "available";
          unit = "GB";
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
          display_type = "memory";
          format_mem = "{mem_used_percents}";
          format_swap = "{swap_used_percents}";
        }
        {
          block = "cpu";
          interval = 1;
        }
        { block = "sound"; }
        {
          block = "time";
          interval = 60;
          format = "%a %d/%m %R";
        }
        ];
        settings = {
          theme =  {
            name = "modern";
          };
        };
        icons = "awesome5";
        theme = "modern";
      };
    };
  };
}
