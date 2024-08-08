{ pkgs, ... }:

{
  imports = [ ./critical ];

  environment.systemPackages = with pkgs; [
    # system-wide packages should go here
    # stuff like drivers, codecs, etc...
    file
  ];
}
