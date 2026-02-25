{
  description = "Environment for development Quorumeum";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          shellHook = ''
            export PATH="$PATH:${toString ./bitcoin/build/bin}"
          '';

          packages = with pkgs; [
            cmake
            boost
            libevent
            zeromq
            zlib
            pkg-config
            capnproto
            python3
            sqlite
            autoconf
            automake
            libtool
          ];
        };
      }
    );
}
