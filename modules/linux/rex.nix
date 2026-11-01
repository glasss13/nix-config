{ hostname }:
{ lib, ... }:

{
  programs.rex.enable = true;

  # Let the official Rex module add its SSH terminal fallback.
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # Preserve the existing alias on black when adopting ~/.ssh/config.
    matchBlocks = lib.optionalAttrs (hostname == "black") {
      kalshi-aws = {
        hostname = "18.116.213.64";
        user = "ec2-user";
        forwardAgent = true;
      };
    };
  };

  services.rex = {
    enable = true;
    allowAnonymous = false;
    extraListen = [];
    tailscale = {
      enable = true;
      hostname = "rex-${hostname}-mglass";
      allowTailnetMembers = false;
      advertiseTags = [];
      # Enroll interactively once; keep credentials out of Nix.
      authKeyFile = null;
    };
  };

  # Package/config updates must not interrupt existing terminal sessions.
  systemd.user.services.rex.Unit.X-SwitchMethod = "keep-old";
}
