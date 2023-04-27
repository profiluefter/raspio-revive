{ ... }: {
  # from https://github.com/NixOS/nixpkgs/blob/f38eca6a7d7186d30095130b134eb92382110070/nixos/modules/installer/sd-card/sd-image.nix#L156
  fileSystems = {
    "/boot/firmware" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
      options = [ "nofail" "noauto" ];
    };
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };
}
