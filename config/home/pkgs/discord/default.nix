{
  config,
  constants,
  pkgs,
  ...
}:

{
  # Install Vesktop
  environment.systemPackages = with pkgs; [ vesktop ];

  # Symlink settings files
  symlinker.file."${constants.user-home}/.config/vesktop/settings.json" = {
    source = "${constants.nix-config-path}/config/home/pkgs/discord/conf/settings.json";
    owner = constants.user;
  };

  symlinker.file."${constants.user-home}/.config/vesktop/settings/settings.json" = {
    source = "${constants.nix-config-path}/config/home/pkgs/discord/conf/inner_settings.json";
    owner = constants.user;
  };
}
