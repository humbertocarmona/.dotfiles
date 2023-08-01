# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  hardware = {
      pulseaudio.enable = false;
      opengl.enable = true;
      bluetooth.enable =true;
      nvidia.modesetting.enable = true;
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "gaia"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Fortaleza";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  console = {
    earlySetup = true;
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;


  # Configure console keymap
  console.keyMap = "br-abnt2";


  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.humberto = {
    isNormalUser = true;
    description = "Humberto Carmona";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    alacritty
    bash
    bat
    brave
    cargo
    dunst
    exa
    fd
    fishPlugins.done
    fishPlugins.forgit
    fishPlugins.fzf-fish
    fishPlugins.grc
    fishPlugins.hydro
    fzf
    gccgo13
    git
    glxinfo
    google-chrome
    gnupg
    grc
    grim
    htop
    insync
    jq
    julia
    kitty
    lazygit
    lf
    libsForQt5.bismuth
    libsForQt5.xdg-desktop-portal-kde
    libsForQt5.kgpg
    libnotify
    light
    lua53Packages.lua
    luajit
    luarocks
    lua53Packages.luasql-sqlite3
    mesa
    neovim
    networkmanagerapplet
    nodejs_20
    (python311.withPackages(ps: with ps;[
        pynvim
    ]))
    qbittorrent
    ripgrep
    rofi-wayland
    slurp
    sqlite
    stow
    stylua
    swww #wallpaper
    texlive.combined.scheme-full
    tmux
    trash-cli
    unzip
    vim
    vscode-fhs
    waybar
    (
      waybar.overrideAttrs (
         oldAttrs:{ 
            mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
	 }
      )
    )
    wget
    wl-clipboard
    wdisplays
    zip
    zotero
    zoxide
    zsh
  ];


#  environment.sessionVariables = {
#	WLR_NO_HARDWARE_CURSORS = "1";
#	NIXOS_OZONE_WL = "1";
#  };
  environment.variables.XCURSOR_SIZE="32";
  xdg.portal = {
  	enable = true;
	wlr.enable=true;
  	extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # bluetooth
  services.blueman.enable=true;
  fonts.fonts = with pkgs;[
  	roboto-mono
    fira-code
  ];
  services.xserver.libinput.mouse.naturalScrolling = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  #
  # enable fish shell as default shell	
  programs.fish.enable = true;
  # hyprland
  programs.hyprland = {
  	enable = true;
	xwayland.enable = true;
  };
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:
  
  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  #
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "23.05"; # Did you read the comment?

}
