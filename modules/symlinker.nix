{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.symlinker;

  symlinkOpts =
    { name, config, ... }:
    {
      options = {
        source = mkOption {
          type = types.path;
          description = "The source file to symlink.";
        };
        owner = mkOption {
          type = types.str;
          default = "root";
          description = "The owner of the symlink.";
        };
        group = mkOption {
          type = types.str;
          description = "The group of the symlink.";
        };
      };
      config = {
        group = mkDefault (if config.owner == "root" then "root" else "users");
      };
    };

  firstLine =
    name: cfg:
    (
      if cfg.owner == "root" then
        ''mkdir -p "$(dirname ${name})"''
      else
        ''${pkgs.su}/bin/su ${cfg.owner} -c 'mkdir -p "$(dirname ${name})"' ''
    );
  mkSymlinkScript = name: cfg: ''
    ${firstLine name cfg}
    ln -sfn "${cfg.source}" "${name}"
    chown -h "${cfg.owner}:${cfg.group}" "${name}"
  '';

in
{
  options.symlinker = {
    file = mkOption {
      default = { };
      type = with types; attrsOf (submodule symlinkOpts);
      description = "Attribute set of files to symlink.";
    };
  };

  config = {
    systemd.services.manage-symlinks = {
      description = "Manage custom symlinks";
      wantedBy = [ "multi-user.target" ];
      wants = [ "network.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        ${concatStringsSep "\n" (mapAttrsToList mkSymlinkScript cfg.file)}
      '';
    };
  };
}
