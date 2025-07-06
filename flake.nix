{
  description = "Resume Generator";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forEachSupportedsystem = f:
        nixpkgs.lib.genAttrs supportedSystems
          (system: f {
            pkgs = import nixpkgs { inherit system; };
          });
    in {
      devShells = forEachSupportedsystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = [
            pkgs.typst
            (pkgs.texlive.combine {
              inherit (pkgs.texlive)
              scheme-full
              latexmk
              luatex
              biber
              amsmath
              graphics
              koma-script
              hyperref
              fontawesome5
              tcolorbox;
            })
            pkgs.skim
            pkgs.git
          ];
        };
      });
    };
}
