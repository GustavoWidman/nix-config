{ ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services = {
    automatic-timezoned.enable = true;
    power-profiles-daemon.enable = true;
  };
}
