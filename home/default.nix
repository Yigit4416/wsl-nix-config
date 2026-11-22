{ ... }:

{
  imports = [
    ./rust.nix
    ./shell.nix
    ./git.nix
    ./helix.nix
    ./cpp.nix ./go.nix
    ./tmux.nix
  ];

  home.stateVersion = "26.05";
}
