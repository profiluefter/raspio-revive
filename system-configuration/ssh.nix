{ lib, ... }: {
  systemd.services.sshd.wantedBy = lib.mkOverride 40 [ "multi-user.target" ];
  services.sshd.enable = true;
  services.openssh.permitRootLogin = "yes";
  networking.firewall.enable = false;
}
