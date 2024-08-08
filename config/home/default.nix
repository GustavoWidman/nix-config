{
  inputs,
  outputs,
  constants,
  lib,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    # Make the "hm" module available,
    # so that we can make some files edit both system-wide and user-specific
    # This is a bit of a hack, but it makes sure we can do whatever we want,
    # whenever we want, wherever we want
    (lib.modules.mkAliasOptionModule [ "hm" ] [
      "home-manager"
      "users"
      constants.user
    ])

    ./pkgs
    ./confs/gnome.nix
  ];

  # Saw this on the gh, no clue what it does
  # system.extraDependencies = collectFlakeInputs inputs.home-manager;

  users.users.${constants.user} = {
    isNormalUser = true;
    description = constants.user;
    extraGroups = [
      "wheel"
      "audio"
      "uucp"
      "video"
      "networkmanager"
      "docker"
      "input"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "home-manager-backup";
    extraSpecialArgs = {
      inherit inputs outputs constants;
    };
  };

  hm = {
    home = {
      stateVersion = constants.system-version;

      username = constants.user;
    };

    systemd.user.startServices = "sd-switch";
    programs.home-manager.enable = true;
  };
}
