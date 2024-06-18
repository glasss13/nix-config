{ homeDirectory, stateVersion, user, ... }:
{ lib, pkgs, config, ... }:

{
  imports = [
    (import ../../modules/darwin/home-manager.nix { inherit homeDirectory stateVersion user config pkgs lib; })
    (import ../../modules/shared { inherit config pkgs; })
    (import ../../modules/shared/cachix { inherit pkgs lib; })
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Setup user, packages, programs
  nix = {
    package = pkgs.nix;
    settings.trusted-users = [ "@admin" "${user}" ];

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    # Turn this on to make command line easier
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # Load configuration that is shared across systems
  # environment.systemPackages = with pkgs; [
  #   # emacs-unstable
  # ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });

  # Enable fonts dir
  fonts.fontDir.enable = true;

  system = {
    stateVersion = 4;

    defaults = {
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;

        # 120, 90, 60, 30, 12, 6, 2
        KeyRepeat = 2;

        # 120, 94, 68, 35, 25, 15
        InitialKeyRepeat = 15;

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };
      menuExtraClock = {
        ShowAMPM = false;
        ShowDate = 1;
        Show24Hour = true;
        ShowSeconds = true;
        ShowDayOfWeek = true;
        ShowDayOfMonth = true;
      };

      # Get the dock out of the way as much as possible
      dock = {
        autohide = true;
        show-recents = false;
        launchanim = false;
        orientation = "right";
        tilesize = 16;
        autohide-delay = 1000.0;
      };

      finder = {
        ShowPathbar = true;
        AppleShowAllFiles = true;
        # Default to searching in current folder
        FXDefaultSearchScope = "SCcf";
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        _FXShowPosixPathInTitle = false;
      };

      trackpad = {
        Clicking = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
