{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # VSCode
    vscode

    # Nix Formatter and LSP Binaries
    nixfmt-rfc-style
    nil
  ];
}
