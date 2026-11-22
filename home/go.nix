{ pkgs, ... }:

{
  programs.go.enable = true;

  home.sessionPath = [ "$HOME/go/bin" ];

  home.packages = with pkgs; [
    gopls
    delve
    gotools
  ];
}

