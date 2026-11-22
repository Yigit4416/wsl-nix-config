{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    gnumake
    cmake
    ninja
    pkg-config
    gdb
    lldb
    clang-tools
    bear
    ccache
    valgrind
    cppcheck
  ];
}
