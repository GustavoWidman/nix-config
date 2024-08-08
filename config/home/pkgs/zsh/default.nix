{ pkgs, constants, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    bat
    zsh-autosuggestions
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;

    autosuggestions = {
      enable = true;
    };

    ohMyZsh = {
      enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.${constants.user}.shell = pkgs.zsh;

  # Symlink .zshrc and custom zsh theme for both me and root
  symlinker.file."${constants.user-home}/.oh-my-zsh/custom/themes/r3dlust.zsh-theme" = {
    source = "${constants.nix-config-path}/config/home/pkgs/zsh/conf/r3dlust.zsh-theme";
    owner = constants.user;
  };

  symlinker.file."${constants.user-home}/.zshrc" = {
    source = "${constants.nix-config-path}/config/home/pkgs/zsh/conf/.zshrc";
    owner = constants.user;
  };

  symlinker.file."/root/.oh-my-zsh/custom/themes/r3dlust.zsh-theme" = {
    source = "${constants.nix-config-path}/config/home/pkgs/zsh/conf/r3dlust.zsh-theme";
    owner = "root";
  };

  symlinker.file."/root/.zshrc" = {
    source = "${constants.nix-config-path}/config/home/pkgs/zsh/conf/.zshrc";
    owner = "root";
  };

  # Also symlink nanorc and root nanorc (might move this to a different file later)
  symlinker.file."/etc/nanorc" = {
    source = "${constants.nix-config-path}/config/home/pkgs/zsh/conf/nanorc";
    owner = "root";
  };

  symlinker.file."/root/.nanorc" = {
    source = "${constants.nix-config-path}/config/home/pkgs/zsh/conf/root-nanorc";
    owner = "root";
  };
}
