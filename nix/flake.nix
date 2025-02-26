{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    texvim = {
      url = "./texvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, flake-utils, texvim }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
          texvimPkg = texvim.packages.${system}.default;
        in {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.texliveFull
              pkgs.zathura
              texvimPkg
            ];
          };
        }
      );
}
