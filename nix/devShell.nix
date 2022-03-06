{ lib,
  stdenv,
  pkgs,
  unstable,
  mkShell
}:

let
  nodejs = pkgs.nodejs-16_x;
in mkShell rec {
  name = "elastic-kibana";


  packages = with pkgs; [
    stdenv.cc.cc.lib
    nodejs
    unstable.bazel_5
    (yarn.override { inherit nodejs; })
  ];

  LD_LIBRARY_PATH="${stdenv.cc.cc.lib}/lib";

  shellHook = ''
  '';

  # Extra env vars
  # PROD_MODE = "true";
}
