{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.vitals
    pkgs.gnomeExtensions.clipboard-indicator
    pkgs.gnomeExtensions.steal-my-focus-window
  ];

  services.flatpak.enable = true;

  hm =
    { lib, ... }:
    with lib.hm.gvariant;
    {
      dconf.settings = {
        # Keybindings
        "org/gnome/desktop/wm/keybindings" = {
          switch-applications = [ ];
          switch-applications-backward = [ ];
          switch-windows = [ "<Alt>Tab" ];
          switch-windows-backward = [ "<Shift><Alt>Tab" ];
        };

        # Custom keybindings
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Control><Alt>t";
          command = "ptyxis --new-window";
          name = "Open Terminal (ptyxis)";
        };

        # Background
        "org/gnome/desktop/background" = {
          color-shading-type = "solid";
          picture-options = "zoom";
          picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
          picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
          primary-color = "#241f31";
          secondary-color = "#000000";
        };

        # Interface Settings
        "org/gnome/desktop/interface" = {
          clock-format = "24h";
          color-scheme = "prefer-dark";
          enable-hot-corners = false;
          font-hinting = "full";
          show-battery-percentage = true;
        };

        # Privacy Settings
        "org/gnome/desktop/privacy" = {
          old-files-age = mkUint32 30;
          recent-files-max-age = -1;
          remove-old-temp-files = true;
          remove-old-trash-files = true;
        };

        # Shell Settings & Configuration
        "org/gnome/shell" = {
          enabled-extensions = [
            "blur-my-shell@aunetx"
            "clipboard-indicator@tudmotu.com"
            "steal-my-focus-window@steal-my-focus-window"
            "Vitals@CoreCoding.com"
          ];
          favorite-apps = [
            "firefox.desktop"
            "vesktop.desktop"
            "org.gnome.Ptyxis.desktop"
            "code.desktop"
            "org.gnome.Nautilus.desktop"

            # Nu uh, we're on nix, downloading packages isnt that easy buddy
            # "org.gnome.Software.desktop"
          ];
          welcome-dialog-last-shown-version = "46.0";
        };

        "org/gnome/shell/extensions/blur-my-shell" = {
          settings-version = 2;
        };

        "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
          brightness = 0.6;
          sigma = 30;
        };

        "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
          blur = false;
          brightness = 0.6;
          pipeline = "pipeline_default_rounded";
          sigma = 30;
          static-blur = true;
          style-dash-to-dock = 0;
        };

        "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
          pipeline = "pipeline_default";
        };

        "org/gnome/shell/extensions/blur-my-shell/overview" = {
          pipeline = "pipeline_default";
        };

        "org/gnome/shell/extensions/blur-my-shell/panel" = {
          blur = false;
          brightness = 0.6;
          pipeline = "pipeline_default";
          sigma = 30;
        };

        "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
          pipeline = "pipeline_default";
        };

        "org/gnome/shell/extensions/blur-my-shell/window-list" = {
          brightness = 0.6;
          sigma = 30;
        };

        "org/gnome/shell/extensions/clipboard-indicator" = {
          cache-size = 256;
          clear-history = [ "<Shift><Super>v" ];
          history-size = 200;
          keep-selected-on-clear = false;
          move-item-first = true;
          next-entry = [ ];
          prev-entry = [ ];
          private-mode-binding = [ ];
          toggle-menu = [ "<Super>v" ];
        };

        "org/gnome/shell/extensions/vitals" = {
          hot-sensors = [
            "_temperature_acpi_thermal zone_"
            "_memory_allocated_"
            "_processor_usage_"
            "_processor_frequency_"
            "_battery_rate_"
          ];
          show-battery = true;
          show-fan = false;
          show-network = false;
          show-storage = false;
          show-system = false;
          show-voltage = false;
        };

        "org/gnome/shell/keybindings" = {
          screenshot = [ "Print" ];
          screenshot-window = [ "<Shift>Print" ];
          show-screenshot-ui = [ "<Shift><Super>s" ];
          toggle-message-tray = [ ];
        };

        "org/gnome/shell/window-switcher" = {
          current-workspace-only = false;
        };

        "org/gnome/shell/world-clocks" = {
          locations = [ ];
        };

        "org/gnome/desktop/peripherals/mouse" = {
          "accel-profile" = "'flat'";
        };
        "org/gnome/mutter" = {
          "workspaces-only-on-primary" = false;
        };
        "org/gnome/desktop/datetime" = {
          "automatic-timezone" = true;
        };
      };
    };
}
