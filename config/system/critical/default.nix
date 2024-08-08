{
  constants,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./desktop.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./misc.nix
    ./networking.nix
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
      (lib.filterAttrs (_: lib.isType "flake")) inputs
    );
  };

  system.stateVersion = constants.system-version;
}
