{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zig
    zls

    gdb
    lldb
    valgrind
    clang
    pkg-config
  ];
}


