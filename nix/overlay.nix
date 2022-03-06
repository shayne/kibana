final: prev: {
  devShell = prev.callPackage ./devShell.nix { };

  php = prev.callPackage ./php.nix { };
}
