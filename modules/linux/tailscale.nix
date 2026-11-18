{ lib, ... }:

let
  proxy = "localhost:1055";
in
{
  systemd.user.services.tailscale-personal = {
    Unit = {
      Description = "Personal userspace Tailscale";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };
    Service = {
      UMask = "0077";
      ExecStart = lib.concatStringsSep " " [
        "/usr/sbin/tailscaled"
        "--tun=userspace-networking"
        "--port=0"
        "--state=%h/.local/share/tailscale-personal/tailscaled.state"
        "--statedir=%h/.local/share/tailscale-personal"
        "--socket=%t/tailscale-personal.sock"
        "--socks5-server=${proxy}"
        "--outbound-http-proxy-listen=${proxy}"
      ];
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "default.target" ];
  };

  home.sessionVariables = {
    HTTPS_PROXY = "http://${proxy}";
    NO_PROXY = lib.concatStringsSep "," [
      "localhost"
      "127.0.0.1"
      "::1"
      "anthropic.com"
      "claude.ai"
      "claude.com"
      "openai.com"
      "chatgpt.com"
      "googleapis.com"
      "google.com"
      "github.com"
      "githubusercontent.com"
      "nixos.org"
      "pypi.org"
      "pythonhosted.org"
      "npmjs.org"
      "crates.io"
      "huggingface.co"
      "hf.co"
    ];
  };
}
