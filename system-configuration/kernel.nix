{ pkgs, ... }: {
  nixpkgs.overlays = [
    (final: super: {
      makeModulesClosure = x:
        super.makeModulesClosure (x // { allowMissing = true; });
    })
  ];

  boot.kernelPackages = pkgs.linuxPackages_rpi3;
}
