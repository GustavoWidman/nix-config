{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-flatpak,
      ...
    }:
    let
      inherit (self) outputs;
      constants = {
        user = "r3dlust";
        shell = "zsh";
        user-home = "/home/${constants.user}";
        nix-config-path = "${constants.user-home}/.nix";
        system-version = "24.05";
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs constants;
        };
        modules = [
          # nix-flatpak.nixosModules.nix-flatpak

          ./config
          ./modules/symlinker.nix
        ];
      };
    };
}
