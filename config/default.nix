{ ... }:

{
  imports = [
    # System-wide packages and configuration
    ./system

    # User-specific packages and configuration
    ./home
  ];
}
