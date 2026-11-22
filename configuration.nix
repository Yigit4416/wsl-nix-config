{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-wsl/modules>
    <home-manager/nixos>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;

  programs.neovim = {enable = true; };

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    ripgrep
    fd
    htop
    unzip
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.nixos = import ./home;
  };

  system.stateVersion = "26.05";
}
