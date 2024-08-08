# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, userSettings, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #<nixos-hardware/asus/rog-strix/g713ie>
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/system/apps/steam.nix
      ../../modules/system/hardware/bluetooth.nix
      ../../modules/system/style/stylix.nix
      ../../modules/system/hardware/asus-utils.nix
      ../../modules/system/hardware/docker.nix
      ../../modules/system/shell/${userSettings.shell}.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  

   boot.loader.grub = {
     enable = true;
     device = "nodev";
     useOSProber = true;
     efiSupport = true;
   };

   networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
   networking.firewall.allowedTCPPorts = [ 57621 ];

  
  # Enable flakes and nix shell commands
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
   time.timeZone = "Africa/Cairo";
   time.hardwareClockInLocalTime = true;

  # ALlow unfree packages
   nixpkgs.config.allowUnfree = true;

  # Enable Home Manager
  home-manager = {
    extraSpecialArgs = { 
      inherit inputs;
      inherit userSettings;
    };
    users = {
      "panda" = import ./home.nix;
    };
    backupFileExtension = "backup";
  };

  # Stylix
 # stylix.enable = true;
 # stylix.image = /home/panda/Pictures/Wallpapers/moonman.png;
 # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/darkviolet.yaml";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Enable Plasma6 Desktop Environment
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  #services.desktopManager.plasma6.enable = true;
  #services.displayManager.defaultSession = "plasma";

  # Configure keymap in X11
  services.xserver.xkb.layout = "us,eg";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
   security.rtkit.enable = true;
   services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
     jack.enable = true;
     wireplumber.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.panda = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
     ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     git
     librewolf
     vesktop
     waybar # top bar
     vscode
     networkmanagerapplet
     mangohud
     grim # Taking screenshots
     slurp # Screenshots area selection
     lf
     gh
     neofetch
     wl-clipboard
     spotify
     mpv
     brave
     nh
     xwaylandvideobridge
   ];

   programs.hyprland = {
     enable = true;
     xwayland.enable = true;
   };

   # File Manager, enabling xfconf to apply preferences.
   programs.thunar = {
     enable = true;
    # plugins = with pkgs.xfce; [
    #   thunar-archive-plugin
    #   thunar-volman
    # ];
   };
   programs.xfconf.enable = true;

   environment.sessionVariables = {
     # Enable if cursor is invisible
     #WLR_NO_HARDWARE_CURSORS = "1";
     NIXOS_OZONE_WL = "1";
   };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libvdpau-va-gl
      ];
    };
    nvidia.modesetting.enable = true;
  };

  # To handle communication between displays
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Some services for file manager (thunar)
   services.gvfs.enable = true; # Enabling Mount, Trash and some other things.
   services.tumbler.enable = true; # Thumbnail support for images.


  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [ "Meslo" "FiraMono" ];
      })
    ];
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

