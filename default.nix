{ pkgs ? import <nixpkgs> {config = (import ./config.nix) compiler;}
, compiler ? "ghc802"
}:
let
in pkgs.haskellPackages.mkDerivation {
  pname = "xreflex";
  version = "0.1.0.0";
  src = ./.;

  executableHaskellDepends = with pkgs.haskellPackages; [
    reflex xhb pointless-fun
    mtl transformers
  ];
  
  libraryHaskellDepends = with pkgs.haskellPackages; [
    reflex xhb dependent-sum
    either monad-loops mtl
    pointless-fun primitive
    ref-tf stm these
    transformers
  ];

  buildDepends = [];

  license = pkgs.stdenv.lib.licenses.gpl3;

  isExecutable = true;
}
