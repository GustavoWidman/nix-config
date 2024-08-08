{ ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.email = "gustavo.widman@sou.inteli.edu.br";
      user.name = "GustavoWidman (NixOS)";
      push.autoSetupRemote = true;
    };
  };
}
