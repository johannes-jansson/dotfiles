{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "jixos";
  # networking.wireless.enable = true;      # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Enables wireless support via NetworkManager.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  networking.useDHCP = false;
  networking.interfaces.enp61s0.useDHCP = true;
  networking.interfaces.wlp62s0.useDHCP = true;
  
  # Allow dropbox
  # networking.firewall = {
  #   allowedTCPPorts = [ 17500 ];
  #   allowedUDPPorts = [ 17500 ];
  # };

  fonts = {
    fonts = with pkgs; [ hasklig ];
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
    bash wget vim home-manager git zsh dropbox-cli docker-compose pinentry
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
  # warning: The option `services.gnome3.gnome-keyring.enable' defined in `/etc/nixos/configuration.nix' has been renamed to `services.gnome.gnome-keyring.enable'
  services.gnome.gnome-keyring.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    extraConfig = "
      load-module module-switch-on-connect
    ";
  };

  # Enable bluetooth.
  hardware.bluetooth = {
    enable = true;
    # extraConfig = "
    #   [General]
    #   Enable=Source,Sink,Media,Socket
    # ";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "se(mac)";
    xkbOptions = "eurosign:e,caps:escape";

    # Enable touchpad support.
    libinput.enable = true;

    # Enable the KDE Desktop Environment.
    # displayManager.sddm.enable = true;
    # desktopManager.plasma5.enable = true;

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
    windowManager.i3.enable = true;
    displayManager.defaultSession = "xfce+i3";
  };
  # - You cannot use both services.xserver.displayManager.defaultSession option and legacy options (services.xserver.desktopManager.default and services.xserver.windowManager.default).

  # Enable Docker.
  virtualisation.docker.enable = true;

  # Enable dropbox
  nixpkgs.config.allowUnfree = true;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johannes = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker"];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

