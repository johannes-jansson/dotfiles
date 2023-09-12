{ config, pkgs, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    version = 2;
    efiSupport = true;
    enableCryptodisk = true;
  };
  
  boot.initrd = {
    luks.devices."root" = {
      device = "/dev/disk/by-uuid/811adfaa-f163-40e4-83c4-c38034f4a00e"; # UUID for /dev/nvme01np2 
      preLVM = true;
      keyFile = "/keyfile0.bin";
      allowDiscards = true;
    };
    secrets = {
      # Create /mnt/etc/secrets/initrd directory and copy keys to it
      "keyfile0.bin" = "/etc/secrets/initrd/keyfile0.bin";
    };
  };
  # Use latest kernel to avoid pulseaudio crashing
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "jaxos";
  # networking.wireless.enable = true;      # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Enables wireless support via NetworkManager.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  networking.useDHCP = false;
  networking.interfaces.wlp9s0.useDHCP = true;

  fonts = {
    fonts = with pkgs; [
      # hasklig
      (nerdfonts.override { fonts = [ "Hasklig" ]; })
    ];
    fontconfig.defaultFonts.monospace = [ "Hasklig" ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Stockholm";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1";
  };

  # Packages installed in system profile
  environment.systemPackages = with pkgs; [
    bash wget vim home-manager git zsh dropbox-cli docker-compose pinentry cachix # nvidia-offload
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.zsh.enable = true;
  programs.vim.defaultEditor = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Bluetooth for Xfce
  services.blueman.enable = true;

  # keyring
  services.gnome.gnome-keyring.enable = true;

  # Enable sound.
  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.enableAllFirmware = true;

  # Enable bluetooth.
  hardware.bluetooth = {
    enable = true;
  };

  # Enable the X11 windowing system.
  hardware.video.hidpi.enable = true;
  services.xserver = {
    enable = true;
    layout = "se(mac)";
    xkbOptions = "eurosign:e,caps:escape";
    dpi = 240;
    /* monitorSection = '' */
    /*   DisplaySize 344 215 */
    /* ''; */
    # Identifier "eDP-1"
    # Identifier "DP-1"
    # DisplaySize 609 432

    videoDrivers = [ "nvidia" ];

    # Enable touchpad support.
    libinput.enable = true;

    # Enable the Xfce Desktop Environment.
    desktopManager = {
      # default = "xfce";
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
    displayManager = {
      defaultSession = "xfce+i3";
      session = [
        {
          manage = "desktop";
          name = "plasma5+i3";
          start = ''exec env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11'';
        }
      ];
      lightdm = { 
        enable = true; 
        # background = /home/johannes/.background-image;
        # extraConfig = "background=/home/johannes/.background-image";
      };
    };
    # displayManager = {
    #   sddm.enable = true;
    #   defaultSession = "plasma5+i3";
    #   session = [
    #     {
    #       manage = "desktop";
    #       name = "plasma5+i3";
    #       start = ''exec env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11'';
    #     }
    #   ];
    # };
  };
  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
  # - You cannot use both services.xserver.displayManager.defaultSession option and legacy options (services.xserver.desktopManager.default and services.xserver.windowManager.default).

  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # Toggle experimental features on
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      '';
  };
  nix = {
    settings = {
      substituters = [
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };

  # hardware.keyboard.qmk.enable = true;

  # Allow unfree software, used for dropbox
  nixpkgs.config.allowUnfree = true;

  # Enable Docker.
  virtualisation.docker.enable = true;
  # virtualisation.docker.daemon.settings.log-driver = "json-file";

  systemd.user.services.dropbox = {
    description = "Dropbox";
    wantedBy = [ "graphical-session.target" ];
    environment = {
      QT_PLUGIN_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtPluginPrefix;
      QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
    };
    serviceConfig = {
      ExecStart = "${pkgs.dropbox.out}/bin/dropbox";
      ExecReload = "${pkgs.coreutils.out}/bin/kill -HUP $MAINPID";
      KillMode = "control-group"; # upstream recommends process
      Restart = "on-failure";
      PrivateTmp = true;
      ProtectSystem = "full";
      Nice = 10;
    };
  };

  # Allow flatpak :grimacing:
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Power saving cli
  services.tlp = {
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "BAT";
    };
  };
  #  services.power-profiles-daemon.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johannes = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker"];
  };

  # fileSystems."/home/johannes/storage" =
  #   { device = "/dev/disk/by-uuid/e1181b4e-e3b0-40a2-a5b3-db5554e1b62d";
  #     fsType = "ext4";
  #     options = [ "defaults" "user" "rw" "utf8" "noauto" "umask=000" ];
  #   };
}

