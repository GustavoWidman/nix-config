{ pkgs, ... }:

{
  imports = [
    ./zsh
    ./git
    ./code
    ./discord
    ./firefox
    ./docker
    ./ptyxis
  ];

  environment.systemPackages = with pkgs; [
    postman
    jetbrains.datagrip
    dconf2nix
  ];

  # services = {
  #   flatpak = {
  #     enable = true;
  #     remotes = [
  #       {
  #         name = "flathub";
  #         location = "https://flathub.org/repo/flathub.flatpakrepo";
  #       }
  #     ];
  #     # update.onActivation = true;
  #     update.auto = {
  #       enable = true;
  #       onCalendar = "daily";
  #     };
  #   };
  # };
}
