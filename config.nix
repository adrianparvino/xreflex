compiler: {
  packageOverrides = pkgs: rec {
    haskellPackages = pkgs.haskell.packages.${compiler}.override {
      overrides = self: super: {
        xhb = self.callPackage ./pkgs/xhb.nix {};

        reflex = self.callPackage (pkgs.fetchFromGitHub {
          owner = "reflex-frp";
          repo = "reflex";
          rev = "f0b5e75f0f7539915071447b4e5e0c4c6ec633a6";
          sha256 = "11zhcg01yc2zjh24l1svfqyzasrc0v65mi10fkbpxw8fdljqihbm";
        }) {};
      };
    };
  };
}
