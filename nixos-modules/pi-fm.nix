{ self, system, pkgs, ... }: {
  boot.kernelParams = [ "iomem=relaxed" ];
  environment.systemPackages = [ self.packages.${system}.pi_fm_rds ];
}
