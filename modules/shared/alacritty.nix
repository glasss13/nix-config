{ lib, pkgs, ... }:

{
  enable = true;
  settings = {
    terminal = {
      shell = {
        program = "/bin/zsh";
        args = [ "-l" ];
      };
    };
    cursor = {
      style = "Block";
    };

    window = {
      decorations = "None";
      opacity = 1.0;
      padding = {
        x = 4;
        y = 4;
      };
    };

    font = {
      normal = {
        family = "FiraCode Nerd Font";
        style = "Regular";
      };
      size = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.hostPlatform.isLinux 10)
        (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin 14)
      ];
    };

    colors = {
      primary = {
        background = "0x282b33";
        foreground = "0xc5cfdf";
      };

      normal = {
        black = "0x3f4350";
        red = "0xdf5460";
        green = "0xa4e174";
        yellow = "0xd08f51";
        blue = "0x51adf8";
        magenta = "0xcb7ed9";
        cyan = "0x5ecddd";
        white = "0xbabfc9";
      };

      bright = {
        black = "0x707681";
        red = "0xde5460";
        green = "0xa3e174";
        yellow = "0xd08f51";
        blue = "0x51adf8";
        magenta = "0xcb7ed9";
        cyan = "0x5ecddc";
        white = "0xfefefe";
      };
    };
  };
}
