{ nixpkgs, ... }: {
  imports = [ "${nixpkgs}/nixos/modules/profiles/all-hardware.nix" ];
  hardware.enableRedistributableFirmware = true;
}
