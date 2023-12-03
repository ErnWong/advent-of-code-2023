{
  description = "My solutions to advent of code 2023";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-23.11";
    uiua.url = "github:uiua-lang/uiua";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, uiua, flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          name = "uiua shell";
          packages = [
            pkgs.nil
            uiua.packages.${system}.default
          ];
        };
      }
    );
}
