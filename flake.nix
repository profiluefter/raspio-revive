{
  inputs.nixpkgs.url = "nixpkgs/nixos-22.11";
  inputs.musnix.url = "github:musnix/musnix";

  outputs = { self, nixpkgs, musnix }@args:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.aarch64-linux.pi_fm_adv =
        pkgs.callPackage ./packages/pi_fm_adv.nix { };

      packages.aarch64-linux.pi_fm_rds =
        pkgs.callPackage ./packages/pi_fm_rds.nix { };

      nixosModules.pi-fm = ./nixos-modules/pi-fm.nix;

      nixosModules.icecast-fm = ./nixos-modules/icecast-fm.nix;

      nixosConfigurations.raspi = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = args // { inherit system; };
        modules = [
          ./system-configuration/configuration.nix
          self.nixosModules.pi-fm
          self.nixosModules.icecast-fm
        ];
      };

      images.raspi = (self.nixosConfigurations.raspi.extendModules {
        modules = [
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ({ lib, ... }: {
            sdImage.compressImage = false;
            boot.loader.generic-extlinux-compatible.enable = lib.mkForce true;
            boot.loader.raspberryPi.enable = lib.mkForce false;
          })
        ];
      }).config.system.build.sdImage;
    };
}
