{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ ptyxis ];

  hm = {
    dconf.settings = {
      "org/gnome/Ptyxis" = {
        audible-bell = false;
        cursor-shape = "ibeam";
        default-profile-uuid = "bac829a014d298d84ca1c6dd66366c1b";
        font-name = "Fira Code 12";
        interface-style = "dark";
        profile-uuids = [ "bac829a014d298d84ca1c6dd66366c1b" ];
        restore-session = false;
        use-system-font = false;
      };

      "org/gnome/Ptyxis/Profiles/bac829a014d298d84ca1c6dd66366c1b" = {
        opacity = 0.85;
        palette = "dracula";
      };

    };
  };
}
