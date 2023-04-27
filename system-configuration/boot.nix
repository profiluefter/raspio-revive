{ lib, ... }: {
  boot.loader.grub.enable = false;

  boot.loader.generic-extlinux-compatible.enable = lib.mkOverride 90 false;

  boot.loader.raspberryPi = {
    enable = true;
    version = 3;
    uboot.enable = true;
    firmwareConfig = ''
      gpu_mem=256
      gpu_freq=250
    '';
  };
}
