{ pkgs, lib, ... }: {
  imports = [
    ./bloat.nix
    ./boot.nix
    ./debloat.nix
    ./file-system.nix
    ./hardware.nix
    ./kernel.nix
    ./mdns.nix
    ./musnix.nix
    ./ssh.nix
    ./users.nix
    ./utils.nix
  ];

  networking.hostName = "raspio";

  system.stateVersion = "22.11";
}
