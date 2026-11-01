{ ... }:

{
  services.rex = {
    enable = true;
    tailscale = {
      enable = true;
      # systemd supplies the short hostname and user when the service starts.
      hostname = "rex-%l-%u";
    };
  };
}
