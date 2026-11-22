{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
    rust-analyzer
    clippy
    rustfmt
    gcc
  ];

  home.sessionVariables.RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
}

